
INSERT INTO public.produit (nom,disponibilite)
VALUES
('pizza 4 saisons',TRUE),
('pizza du chef',FALSE),
('pizza norvegienne',TRUE),
('pizza hawaienne',TRUE),
('pizza sicilienne',TRUE);

INSERT INTO public.role (type_role,rights)
VALUES
('CLIENT','COMMANDE1'),
('LIVREUR','LIVR_PAY'),
('CUISINIER','PREPARATION'),
('VENDEUR','COMMANDE2'),
('RESPONSABLE','ADMIN');


INSERT INTO public.utilisateur (user_id,nom,prenom,role_id)
VALUES
('dpatrick','DUPONT','PATRICK',1),
('smichel','SEBASTIEN','MICHEL',2),
('rherve','RENARD','HERVE',3),
('dmichel','DENISOT','MICHEL',4),
('jplesage','LESAGE','JP',5),
('pcatherine','PHILLIPE','CATHERINE',1);

INSERT INTO public.client (numero_user,adresse,mail,tel)
VALUES
(1,'10 rue Pasteur, Paris','dpatrick@caramail.com','0123456789'),
(6,'76 Bd Magenta, Colombe','pcatherine@hotmail.fr','0635782312');

INSERT INTO public.infoetablissement (nom,adresse,tel,mail)
VALUES
('republique','15 place de la republique','0123981287','pizzeria.republique@ocpizza.com'),
('etoile','34 av des champs élysés','01139898287','pizzeria.etoile@ocpizza.com');

INSERT INTO public.commande (statut,montanttotal,date,heure,modepaiement,modelivraisonretrait,etablissement_id,client_id)
VALUES
('VALIDEE',29,'2019-03-19','19:12:30','EN_LIGNE','LIVRAISON',1,1),
('EN_COURS_LIVRAISON',12,'2019-03-19','19:45:00','LIVRAISON','LIVRAISON',1,1);

INSERT into ajoutproduit (prix,qte,numero_commande,produit_id)
VALUES
(13,1,1,2),
(16,1,1,1),
(12,1,2,4);


INSERT INTO public.stockingredients (ingredients,quantite,restaurant_id)
VALUES
('sauce tomate',5,1),
('mozzarella',3,1),
('champignons',3,1),
('anchois',2,2),
('anchois',2.4,1),
('saumon',5,1),
('poivrons',4,1),
('poivrons',5,2),
('coeur artichaut',3,1),
('capres',2,2),
('gorgonzola',2,1),
('gorgonzola',2,2),
('ananas',2.5,2),
('creme fraiche',3,1),
('creme fraiche',3,2),
('viande hachee',0,1);

INSERT INTO public.ingredientsparproduit (produit_id,ingredient_id)
VALUES
(1,1),
(1,2),
(1,3),
(1,7),
(2,1),
(2,12),
(2,3),
(2,16),
(3,1),
(3,2),
(3,6),
(3,14),
(4,1),
(4,2),
(4,8),
(4,13),
(4,14),
(5,1),
(5,2),
(5,4),
(5,10);



INSERT INTO public.memorecette (ingredients,quantite,temps_cuisson,temperature_four,produit_id)
VALUES
('sauce tomate; mozzarella; champignons; poivrons; coeur artichaut','0.1;0.05;0.1;0.1;0.2','00:10:00',170,1),
('sauce tomate; gorgonzola; champignons; viande hachee','0.1;0.15;0.15;0.2','00:07:00',180,2),
('sauce tomate; mozzarella; saumon; creme fraiche','0.1;0.2;0.25;0.25;0.25','00:08:00',185,3),
('sauce tomate; mozzarella; coeur artichaut; ananas; creme fraiche','0.1;0.2;0.15;0.2;0.2','00:10:00',175,4),
('sauce tomate; mozzarella; anchois; capres','0.1;0.2;0.1;0.1','00:08:00',180,5);

INSERT INTO public.facture (date, numero_commande, client_id)
VALUES
('2019-03-19',1,1),
('2019-03-19',2,6);

INSERT INTO public.historiquecommande (statuts,timestamp,numero_commande,numero_user)
VALUES
('EFFECTUEE','2019-03-19,18:45:00',1,1),
('VALIDEE','2019-03-19,18:49:00',1,4),
('PREPAREE','2019-03-19,19:00:00',1,3),
('EN_COURS_LIVRAISON','2019-03-19,19:20:00',1,2),
('LIVRAISON_VALIDEE','2019-03-19,19:30:00',1,2),
('FINALISEE','2019-03-19,19:35:00',1,2),
('EFFECTUEE','2019-03-19,19:45:00',2,1),
('VALIDEE','2019-03-19,19:53:00',2,4),
('PREPAREE','2019-03-19,20:00:00',2,3),
('EN_COURS_LIVRAISON','2019-03-19,20:04:00',2,2),
('LIVRAISON_VALIDEE','2019-03-19,20:14:00',2,2),
('FINALISEE','2019-03-19,20:35:00',2,2);
