select historiquecommande.statuts,historiquecommande.timestamp,utilisateur.user_id,role.type_role
from historiquecommande
join utilisateur
on historiquecommande.numero_user=utilisateur.numero_user
join role
on utilisateur.role_id=role.role_id
where numero_commande=1
order by historiquecommande.timestamp



select * from produit
join memorecette
on produit.produit_id=memorecette.produit_id


select commande.statut, commande.montanttotal,produit.nom as pizza,commande.date,commande.heure, commande.modepaiement,commande.modelivraisonretrait,infoetablissement.nom as nom_pizzeria,
utilisateur.user_id, client.adresse
from commande
join utilisateur
on commande.client_id=utilisateur.numero_user
join client
on commande.client_id=client.numero_user
join infoetablissement
on commande.etablissement_id=infoetablissement.etablissement_id
join ajoutproduit
on commande.numero_commande=ajoutproduit.numero_commande
join produit
on ajoutproduit.produit_id=produit.produit_id
where commande.numero_commande=2

