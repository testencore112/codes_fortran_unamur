program conversion_temperature
    implicit none

    real :: celsius, kelvin
    character(len=1) :: reponse

    ! boucle permettant de couvertir plusieur températures
    do
        print *, "Entrez la temperature en celuis:"
        read *,celsius

        ! conversion en kelvin
        kelvin = celsius + 273.15

        !affichage résultat
        print *, "Temperature en kelvin:",kelvin

        !demander si l'utilisateur souhaite recommencer
        do
            print *, "Nouvelle conversion ? (o/n)"
            read *, reponse

            if (reponse == "o" .or. reponse=="O") exit
            if (reponse == "n" .or. reponse == "N") exit

            print *, "Erreur : entrez o ou n."

        end do 

        if (reponse == "n" .or. reponse=="N") exit
    end do

    print *, "Fin du programme"
end program conversion_temperature


    

