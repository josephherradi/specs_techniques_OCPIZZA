
CREATE SEQUENCE public.role_role_id_seq;

CREATE TABLE public.Role (
                role_id INTEGER NOT NULL DEFAULT nextval('public.role_role_id_seq'),
                type_role VARCHAR(50) NOT NULL,
                rights VARCHAR(50) NOT NULL,
                CONSTRAINT role_pk PRIMARY KEY (role_id)
);


ALTER SEQUENCE public.role_role_id_seq OWNED BY public.Role.role_id;

CREATE SEQUENCE public.utilisateur_numero_user_seq;

CREATE TABLE public.Utilisateur (
                numero_user INTEGER NOT NULL DEFAULT nextval('public.utilisateur_numero_user_seq'),
                user_id VARCHAR(50) NOT NULL,
                nom VARCHAR(50) NOT NULL,
                prenom VARCHAR(50) NOT NULL,
                role_id INTEGER NOT NULL,
                CONSTRAINT utilisateur_pk PRIMARY KEY (numero_user)
);


ALTER SEQUENCE public.utilisateur_numero_user_seq OWNED BY public.Utilisateur.numero_user;

CREATE SEQUENCE public.infoetablissement_etablissement_id_seq;

CREATE TABLE public.InfoEtablissement (
                etablissement_id INTEGER NOT NULL DEFAULT nextval('public.infoetablissement_etablissement_id_seq'),
                nom VARCHAR(100) NOT NULL,
                adresse VARCHAR(100) NOT NULL,
                tel VARCHAR(30) NOT NULL,
                mail VARCHAR(100) NOT NULL,
                CONSTRAINT infoetablissement_pk PRIMARY KEY (etablissement_id)
);


ALTER SEQUENCE public.infoetablissement_etablissement_id_seq OWNED BY public.InfoEtablissement.etablissement_id;

CREATE TABLE public.Personnel (
                numero_user INTEGER NOT NULL,
                etablissement_id INTEGER NOT NULL,
                CONSTRAINT personnel_pk PRIMARY KEY (numero_user)
);


CREATE SEQUENCE public.stockingredients_ingredient_id_seq;

CREATE TABLE public.StockIngredients (
                ingredient_id INTEGER NOT NULL DEFAULT nextval('public.stockingredients_ingredient_id_seq'),
                ingredients VARCHAR(100) NOT NULL,
                quantite INTEGER NOT NULL,
                restaurant_id INTEGER NOT NULL,
                CONSTRAINT stockingredients_pk PRIMARY KEY (ingredient_id)
);


ALTER SEQUENCE public.stockingredients_ingredient_id_seq OWNED BY public.StockIngredients.ingredient_id;

CREATE SEQUENCE public.produit_produit_id_seq;

CREATE TABLE public.Produit (
                produit_id INTEGER NOT NULL DEFAULT nextval('public.produit_produit_id_seq'),
                nom VARCHAR(100) NOT NULL,
                disponibilite BOOLEAN NOT NULL,
                CONSTRAINT produit_pk PRIMARY KEY (produit_id)
);


ALTER SEQUENCE public.produit_produit_id_seq OWNED BY public.Produit.produit_id;

CREATE TABLE public.IngredientsParProduit (
                produit_id INTEGER NOT NULL,
                ingredient_id INTEGER NOT NULL
);


CREATE SEQUENCE public.memorecette_recette_id_seq;

CREATE TABLE public.MemoRecette (
                recette_id INTEGER NOT NULL DEFAULT nextval('public.memorecette_recette_id_seq'),
                ingredients VARCHAR(200) NOT NULL,
                quantite VARCHAR(100) NOT NULL,
                temps_cuisson TIME NOT NULL,
                temperature_four INTEGER NOT NULL,
                produit_id INTEGER NOT NULL,
                CONSTRAINT memorecette_pk PRIMARY KEY (recette_id)
);


ALTER SEQUENCE public.memorecette_recette_id_seq OWNED BY public.MemoRecette.recette_id;

CREATE TABLE public.Client (
                numero_user INTEGER NOT NULL,
                adresse VARCHAR(100) NOT NULL,
                mail VARCHAR(100) NOT NULL,
                tel VARCHAR(100) NOT NULL,
                CONSTRAINT client_pk PRIMARY KEY (numero_user)
);


CREATE SEQUENCE public.commande_numero_commande_seq;

CREATE TABLE public.Commande (
                numero_commande INTEGER NOT NULL DEFAULT nextval('public.commande_numero_commande_seq'),
                statut VARCHAR(50) NOT NULL,
                montantTotal NUMERIC NOT NULL,
                date DATE NOT NULL,
                heure TIME NOT NULL,
                modePaiement VARCHAR(50) NOT NULL,
                modeLivraisonRetrait VARCHAR(50) NOT NULL,
                etablissement_id INTEGER NOT NULL,
                client_id INTEGER NOT NULL,
                CONSTRAINT commande_pk PRIMARY KEY (numero_commande)
);


ALTER SEQUENCE public.commande_numero_commande_seq OWNED BY public.Commande.numero_commande;

CREATE SEQUENCE public.ajoutproduit_id_seq;

CREATE TABLE public.AjoutProduit (
                id INTEGER NOT NULL DEFAULT nextval('public.ajoutproduit_id_seq'),
                prix NUMERIC NOT NULL,
                qte INTEGER NOT NULL,
                numero_commande INTEGER NOT NULL,
                produit_id INTEGER NOT NULL,
                CONSTRAINT ajoutproduit_pk PRIMARY KEY (id)
);


ALTER SEQUENCE public.ajoutproduit_id_seq OWNED BY public.AjoutProduit.id;

CREATE SEQUENCE public.historiquecommande_numero_id_seq;

CREATE TABLE public.HistoriqueCommande (
                numero_id INTEGER NOT NULL DEFAULT nextval('public.historiquecommande_numero_id_seq'),
                statuts VARCHAR(100) NOT NULL,
                timestamp TIMESTAMP NOT NULL,
                numero_commande INTEGER NOT NULL,
                numero_user INTEGER NOT NULL,
                CONSTRAINT historiquecommande_pk PRIMARY KEY (numero_id)
);


ALTER SEQUENCE public.historiquecommande_numero_id_seq OWNED BY public.HistoriqueCommande.numero_id;

CREATE SEQUENCE public.facture_numero_facture_seq;

CREATE TABLE public.Facture (
                numero_facture INTEGER NOT NULL DEFAULT nextval('public.facture_numero_facture_seq'),
                date DATE NOT NULL,
                numero_commande INTEGER NOT NULL,
                client_id INTEGER NOT NULL,
                CONSTRAINT facture_pk PRIMARY KEY (numero_facture)
);


ALTER SEQUENCE public.facture_numero_facture_seq OWNED BY public.Facture.numero_facture;

ALTER TABLE public.Utilisateur ADD CONSTRAINT role_utilisateur_fk
FOREIGN KEY (role_id)
REFERENCES public.Role (role_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Client ADD CONSTRAINT utilisateur_client_table_fk
FOREIGN KEY (numero_user)
REFERENCES public.Utilisateur (numero_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Personnel ADD CONSTRAINT utilisateur_backend_utilisateur_fk
FOREIGN KEY (numero_user)
REFERENCES public.Utilisateur (numero_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.HistoriqueCommande ADD CONSTRAINT utilisateur_historiquecommande_fk
FOREIGN KEY (numero_user)
REFERENCES public.Utilisateur (numero_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande ADD CONSTRAINT infoetablissement_commande_fk
FOREIGN KEY (etablissement_id)
REFERENCES public.InfoEtablissement (etablissement_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Personnel ADD CONSTRAINT infoetablissement_personnel_fk
FOREIGN KEY (etablissement_id)
REFERENCES public.InfoEtablissement (etablissement_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.IngredientsParProduit ADD CONSTRAINT stockingredients_ingredientsparproduit_table_fk
FOREIGN KEY (ingredient_id)
REFERENCES public.StockIngredients (ingredient_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.AjoutProduit ADD CONSTRAINT produit_ajoutproduit_fk
FOREIGN KEY (produit_id)
REFERENCES public.Produit (produit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.MemoRecette ADD CONSTRAINT produit_memorecette_fk
FOREIGN KEY (produit_id)
REFERENCES public.Produit (produit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.IngredientsParProduit ADD CONSTRAINT produit_ingredientsparproduit_table_fk
FOREIGN KEY (produit_id)
REFERENCES public.Produit (produit_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Facture ADD CONSTRAINT client_table_facture_fk
FOREIGN KEY (client_id)
REFERENCES public.Client (numero_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (client_id)
REFERENCES public.Client (numero_user)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.Facture ADD CONSTRAINT commande_facture_fk
FOREIGN KEY (numero_commande)
REFERENCES public.Commande (numero_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.HistoriqueCommande ADD CONSTRAINT commande_historiquecommande_fk
FOREIGN KEY (numero_commande)
REFERENCES public.Commande (numero_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.AjoutProduit ADD CONSTRAINT commande_ajoutproduit_fk
FOREIGN KEY (numero_commande)
REFERENCES public.Commande (numero_commande)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
