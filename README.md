# Analyse de la Marketplace Olist (E-Commerce)

## Présentation du Projet
Ce projet est une analyse **End-to-End** des données de la marketplace brésilienne **Olist**. L'objectif est de transformer des données brutes stockées dans des fichiers CSV en un dashboard décisionnel interactif permettant de piloter la performance commerciale et logistique.

## Stack Technique
- **Base de données :** PostgreSQL (Modélisation relationnelle & Nettoyage)
- **Outil de requêtage :** VS Code & SQLTools
- **BI & Visualisation :** Power BI (DAX, Data Modeling)
- **Gestion de version :** Git & GitHub

## Architecture des Données
Le projet suit une structure rigoureuse en 3 étapes SQL :
1.  **`1_create_tables.sql`** : Création du schéma relationnel (Contraintes PK/FK).
2.  **`2_import_data.sql`** : Ingestion des données CSV via la commande `COPY`.
3.  **`3_cleaning_and_views.sql`** : Création d'une couche sémantique (Vues SQL) pour :
    - Traduire les catégories du portugais vers l'anglais.
    - Filtrer les commandes annulées.
    - Calculer les indicateurs de performance (KPIs) comme les délais de livraison.

## Key Insights (Dashboard Power BI)
Le dashboard final met en lumière plusieurs points clés :
- **Volume d'affaires :** Un CA total de **15,74M€** avec une croissance forte identifiée en 2017.
- **Top Catégories :** Les secteurs *Health & Beauty* et *Watches & Gifts* sont les principaux moteurs de revenus.
- **Excellence Logistique :** Une avance moyenne de **11 jours** sur les dates de livraison estimées, soulignant une gestion efficace du dernier kilomètre.
- **Concentration Géographique :** L'État de São Paulo (SP) représente la majorité du volume d'affaires.

## Structure du Repository
- `/sql_scripts` : Scripts SQL ordonnés pour la reproductibilité.
- `/dashboard` : Fichier `.pbix` de la solution Power BI.
- `/data` : Dossier contenant les sources CSV (ignoré par Git pour la performance).

## Comment reproduire l'analyse ?
1. Cloner le repository.
2. Installer PostgreSQL et créer une base nommée `olist_db`.
3. Exécuter les scripts du dossier `/sql_scripts` dans l'ordre (01, 02, 03).
4. Connecter Power BI à la vue `view_master_sales`.

