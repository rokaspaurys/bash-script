#Aprasymas
#Programa skirta perziureti naudotojo sporto tvarkarasti. Tvarkarastyje yra parasytos treniruociu datos ir savaites dienos bei pratimu sarasas su pakartojimais. Naudotojas programos menu gali pasirinkti viena is 5 operaciju: 1) Perziureti visa tvarkarasti; 2) Perziureti visus pratimus; 3) Perziureti savaites dienas, kai vyksta treniruotes; 4) Naudojant paieska, rasti kurio nors pratimo suvestine; 5) Baigus darba, isjungti.


#!/bin/bash
loop=true
while $loop; do
  PS3="Pasirinkite operacija: "
  echo "############ MENU ############"
  select opr in Tvarkarastis Pratimai Dienos Paieska Quit
  do
      case $opr in
          "Tvarkarastis")
              echo "Pilnas sporto tvarkarastis: "
              echo
              s="./treniruotes.txt"
              cat $s
              echo
              break;;
          "Pratimai")
              echo
              echo "Visi pratimai:"
              awk 'length($0) < 22' treniruotes.txt
              echo
              break;;
          "Dienos")
              echo "Sportuoti siomis dienomis: "
              awk '/2022/ {print $3}' treniruotes.txt
              echo
              break;;
          "Paieska")
              echo "Iveskite pratima: "
              read prat
              prat=${prat^}
              echo
              case $prat in
                "Begimas")
                awk '/Begimas/ {print}' ./treniruotes.txt
                echo;;
                "Plaukimas")
                awk '/Plaukimas/ {print}' ./treniruotes.txt
                echo;;
                "Atsilenkimai")
                awk '/Atsilenkimai/ {print}' ./treniruotes.txt
                echo;;
              esac
            break;;
        "Quit")
             echo "Darbo pabaiga, programa issijungia."
             loop=false
             break;;
          *)
             echo "Klaida, bandykite dar karta.";;
      esac
  done
done