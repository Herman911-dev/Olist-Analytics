-- 1. Traduction des catégories et enrichissement des produits
-- On utilise LEFT JOIN pour ne perdre aucun produit, même sans traduction
CREATE OR REPLACE VIEW view_products_enriched AS
SELECT 
    p.product_id,
    COALESCE(t.product_category_name_english, p.product_category_name) AS category_name,
    p.product_weight_g,
    p.product_photos_qty
FROM products p
LEFT JOIN product_category_name_translation t 
    ON p.product_category_name = t.product_category_name;

-- 2. Filtrage des commandes valides
-- On exclut les commandes annulées pour ne pas fausser le Chiffre d'Affaires
CREATE OR REPLACE VIEW view_orders_cleaned AS
SELECT 
    order_id,
    customer_id,
    order_status,
    order_purchase_timestamp,
    order_delivered_customer_date,
    order_estimated_delivery_date
FROM orders 
WHERE order_status NOT IN ('canceled', 'unavailable');

-- 3. VUE MASTER : La source principale pour Power BI
-- Cette vue regroupe toutes les dimensions nécessaires en une seule table
CREATE OR REPLACE VIEW view_master_sales AS
SELECT 
    -- Dimensions temporelles
    vo.order_id,
    vo.order_purchase_timestamp AS purchase_date,
    
    -- Dimensions géographiques
    c.customer_city,
    c.customer_state,
    
    -- Dimensions produits
    pe.category_name,
    
    -- Métriques financières
    oi.price AS item_price,
    oi.freight_value AS shipping_cost,
    (oi.price + oi.freight_value) AS total_order_value,
    
    -- Analyse de performance logistique (retard en jours)
    -- Si négatif = en avance, si positif = en retard
    DATE_PART('day', vo.order_delivered_customer_date - vo.order_estimated_delivery_date) AS delivery_delay_days
FROM view_orders_cleaned vo
JOIN order_items oi ON vo.order_id = oi.order_id
JOIN view_products_enriched pe ON oi.product_id = pe.product_id
JOIN customers c ON vo.customer_id = c.customer_id;