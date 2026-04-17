-- REMPLACEZ 'NOM_UTILISATEUR' PAR VOTRE NOM DE SESSION WINDOWS
-- COPY customers FROM 'C:/Users/NOM_UTILISATEUR/Desktop/.../data/olist_customers_dataset.csv' ...
-- 1. Import des clients
COPY customers 
FROM 'C:/Users/herma/Desktop/Bureau/Data Analyst/Projet Perso/olist-data-analysis/data/olist_customers_dataset.csv' 
WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- 2. Import des produits
COPY products 
FROM 'C:/Users/herma/Desktop/Bureau/Data Analyst/Projet Perso/olist-data-analysis/data/olist_products_dataset.csv' 
WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- 3. Import des vendeurs
COPY sellers 
FROM 'C:/Users/herma/Desktop/Bureau/Data Analyst/Projet Perso/olist-data-analysis/data/olist_sellers_dataset.csv' 
WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- 4. Import des commandes
COPY orders 
FROM 'C:/Users/herma/Desktop/Bureau/Data Analyst/Projet Perso/olist-data-analysis/data/olist_orders_dataset.csv' 
WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- 5. Import des items
COPY order_items 
FROM 'C:/Users/herma/Desktop/Bureau/Data Analyst/Projet Perso/olist-data-analysis/data/olist_order_items_dataset.csv' 
WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- 6. Import des paiements
COPY order_payments 
FROM 'C:/Users/herma/Desktop/Bureau/Data Analyst/Projet Perso/olist-data-analysis/data/olist_order_payments_dataset.csv' 
WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- 7. Import des avis (Reviews)
COPY order_reviews 
FROM 'C:/Users/herma/Desktop/Bureau/Data Analyst/Projet Perso/olist-data-analysis/data/olist_order_reviews_dataset.csv' 
WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- 8. Import de la géolocalisation 
COPY geolocation 
FROM 'C:/Users/herma/Desktop/Bureau/Data Analyst/Projet Perso/olist-data-analysis/data/olist_geolocation_dataset.csv' 
WITH (FORMAT CSV, HEADER, DELIMITER ',');

-- 9. Import de la table de traduction des catégories
COPY product_category_name_translation 
FROM 'C:/Users/herma/Desktop/Bureau/Data Analyst/Projet Perso/olist-data-analysis/data/product_category_name_translation.csv' 
WITH (FORMAT CSV, HEADER, DELIMITER ',');