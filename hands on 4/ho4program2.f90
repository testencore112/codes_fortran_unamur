program conversion_temperature
    implicit none

    real :: celsius, kelvin
    character(len=1) :: reponse
    integer :: ios

    !ouverture du fichier pour enregistrer l'historique
    open(10, file="temperatures.dat", status="unknown", position="append", action="write",iostat=ios)
    !pour rappel, les différentes valeurs veulent dire:
    !10 est le numérot d'unité
    !file="temperatures.dat"	Nom du fichier à ouvrir.
    !status="unknown"	Ouvre le fichier s'il existe, ou le crée s'il n'existe pas.
    !position="append"	Se positionne à la fin du fichier pour ajouter des données sans écraser les précédentes.
    !action="write"	Autorise uniquement l'écriture dans le fichier.
    !iostat=ios	Stocke dans la variable entière ios un code indiquant si l'ouverture s'est bien passée.


    if( ios /=0) then
        print *, "Erreur : impossible d'ouvrir le fichier."
        stop
    end if

    !Boucle permettant de convertir plusieurs temperatures
    do
        print *, "Entrez la temperature en Celsuis"
        read(*,*,iostat=ios) celsius
        !premier *: lire depuis le clavier
        !Deuxième *: format libre
        !iostat=ios: stocke dans ios un code indiquant si la lecture a réussi
        !celsius: variable qui recoit la température

        if (ios < 0) exit
        ! Si l'utilisateur ferme l'entrée du clavier: ctrl+Z ios devient négatif, le cycle pourrait recommencer indéfiniement, on veut éviter ca

        if (ios > 0) then
            print *, "Erreur : entrez une valeur numerique"
            cycle
            !pour rappel, cycle permet de passer directement à l'itération suivante d'une boucle do sans exécuter les instructions restantes de l'itération actuelle

        end if
        
        !conversion en kelvin
        kelvin = celsius + 273.15

        ! affichage du resultat avec un format
        print *, "Température en Kelvin:", kelvin, "K"

        !enregistrement dans le fichier .dat
        write(10,*) celsius, kelvin

        do
            print *, "Nouvelle conversion? o/n"
            read *, reponse

            if(reponse == "o" .or. reponse == "O") exit
            if(reponse == "n" .or. reponse == "N") exit

            print *, "Erreur: entrez o ou n"
        end do

        if (reponse == "n" .or. reponse == "N") exit
    end do

    ! fermeture du fichier
    close(10)

    print *, "Fin du programme"

end program conversion_temperature




