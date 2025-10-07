-- Génère le tableau de financement
-- Aller au bas du fichier pour définir les lignes correspondant à chaque unité de stage
function ligne_financement(unite, debut, fin, montant)
	tex.print(unite .. " & " .. debut .. " & " .. fin .. " & " .. montant .. "\\\\")
	tex.print("")
end

local datedebut = {year = 2015, month = 1, day = 1, hour = 0, minute = 0, sec = 0}
local tsdebut = os.time(datedebut)
local numunites = 4
local montant = "10~000\\$"
for i=1,12 do
  if i > numunites then
    ligne_financement(i, "", "", "")
  else
    local tsfin = tsdebut + (16 * 7 * 24 * 60 * 50) -- secondes en 16 semaines
    ligne_financement(i, os.date("%d/%m/%Y", tsdebut), os.date("%d/%m/%Y", tsfin), montant)
    tsdebut = tsfin
  end
  if (i < 12) then
    tex.print("\\hdashline")
    tex.print("")
  else
    tex.print("\\hline")
    tex.print("")
  end
end