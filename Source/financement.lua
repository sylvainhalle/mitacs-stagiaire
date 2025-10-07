-- Génère le tableau de financement
-- Aller au bas du fichier pour définir les lignes correspondant à chaque unité de stage
function ligne_objectif(min, max, color, objectif, nom)
	tex.print(objectif .. " & ")
	tex.print(nom)
	for i=1,60 do
	  tex.print(" & ")
	  if i >= min and i <= max then
		tex.print("\\cellcolor{" .. color .. "}")
	  end
	end
	tex.print(" \\\\")
	tex.print("")
	tex.print("\\hline")
	tex.print("")
end

tex.print("")
tex.print("\\begin{tabularx}{6in}{|X|X|X|X|}")
tex.print("\\hline")

-- First header row: multirow in col 1, a 2-column span in cols 2–3, and a normal cell in col 4
tex.print("\\multirow{2}{*}{\\textbf{Unité de stage}}"
  .. " & \\multicolumn{2}{|c|}{Période des unités de stage "
  .. "Énumérez chaque unité REMARQUE: Chaque unité peut durer de 4 ou 6 mois}"
  .. " & Montant de l'allocation (min.~10\\,000~\\$ par unité de stage) \\\\")
  
-- Second header row: the two subheaders under the 2-column span
tex.print("& \\textbf{Date de début} & \\textbf{Date de fin} & \\\\")
tex.print("\\hline")

tex.print("\\end{tabularx}")


-- Chaque appel à ligne_objectif() produit une ligne du tableau.
-- - Les deux premiers arguments sont l'index de la case de début et
--   de fin de l'intervalle à colorier dans le tableau. La case 1
--   correspond au mois 1 de l'année 1, et la case 60 est le mois 12
--   de l'année 5. Passer -1 aux deux arguments ne produit aucun
--   coloriage.
-- - L'argument suivant est la couleur du coloriage. Tous les noms
--   de [x11names]{xcolor} sont permis.
-- - Les deux derniers arguments sont le texte du sous-objectif et
--   le nom du stagiaire.
-- ligne_objectif(3, 10, "blue", "1) Inscrivez le sous-objectif ici", "")
-- ligne_objectif(-1, -1, "blue", "2) Inscrivez le sous-objectif ici", "")
-- ligne_objectif(-1, -1, "blue", "3)", "")
-- ligne_objectif(-1, -1, "blue", "4)", "")
-- ligne_objectif(-1, -1, "blue", "5)", "")
-- tex.print("")
-- 
-- tex.print("\\end{tabular}")
-- tex.print("")
-- tex.print("\\renewcommand{\\arraystretch}{1.2}")
-- tex.print("")