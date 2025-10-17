Mitacs Stagiaire
==================

Ce dépôt contient un gabarit LaTeX permettant de produire un formulaire
d'inscription de nouveau stagiaire dans le cadre d'une
subvention Mitacs Accélération, en replacement du document Word proposé. Il est
à toutes fins pratiques visuellement identique et possède quelques fonctions
additionnelles, comme l'auto-génération du calendrier de paiement.

<p><a href="https://www.overleaf.com/docs?snip_uri=https://github.com/sylvainhalle/mitacs-stagiaire/archive/refs/heads/main.zip"><img src="ouvrir-overleaf-16.png?raw=true" alt="Ouvrir dans Overleaf"/></a></p>

Comment utiliser ce gabarit
--------------------------

1. Cliquer sur "Ouvrir dans Overleaf" ou télécharger les sources du dépôt.
2. Remplir les métadonnées du fichier `parametres.inc.tex`, et inscrire du
   texte dans les fichiers `section-271.inc.tex` et `section-272.inc.tex`
   (liés aux sections correspondantes dans le formulaire original).
   Normalement rien d'autre n'a besoin d'être modifié.
3. Pour ajouter des signatures graphiques, télécharger l'image appropriée
   et éditer la commande en fonction du rôle (i.e. `\sigstagiaire`, etc.).
4. Ne pas oublier que la compilation doit
   être faite par [LuaLaTeX](https://www.luatex.org/).

À propos de l'auteur
-------------------

Cette classe a été conçue par [Sylvain Hallé](https://leduotang.ca/sylvain),
professeur titulaire à l'[Université du Québec à Chicoutimi](https://uqac.ca).
