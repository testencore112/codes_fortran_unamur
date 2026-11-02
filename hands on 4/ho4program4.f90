program distribution_temperature
    implicit none

    integer :: i,j,iteration, ios
    real :: temperature(10,10), nouvelle_temperature(10,10)
    real :: ecart_max
    real :: moyenne_initiale, moyenne_finale, moyenne
    real, parameter :: precision= 0.01
    !pour rappel, parameter : indique que ce nombre est une constante.

    temperature=50.

    !les quatre bords sont maintenant a 20 degres
    temperature(1,:)=20.
    temperature(10,:)=20.
    temperature(:,1)=20.
    temperature(:,10)=20.

    !l'eau boutillante a la position (8,3)
    temperature(8,3)=100.

    iteration=0

    !calcul de la temperature moyenne initiale
    moyenne_initiale=sum(temperature)/100.

    !ouverture du fichier pour enregistrer les donnees
    open(10,file="evolution_temperature.txt", status="replace", action="write", iostat=ios)
    ! attention, remarquons que le statut replace sinifie que si le fichier n'existe pas, fortran le créé automatiquement, alors que si il existe, fortran supprime son ancien contenu et créé un nouveau fichier à sa place

    if (ios /=0) then
        print *, "Erreur: impossible d'ouvrir le fichier"
        stop
    end if

    ! enregistrement de l'état initial
    write(10,*) "Iteration Moyenne Ecart_max"
    write(10,*) iteration, moyenne_initiale, 0.

    !calcul de la distribution de temperature
    do
        nouvelle_temperature=temperature

        !parcours des cases interieures de la plaque
        do i=2,9
            do j=2,9

                !nouvelle temperature= moyenne des 4 voisines
                nouvelle_temperature(i,j)=(temperature(i-1,j)+temperature(i+1,j)+temperature(i,j-1)+temperature(i,j+1))/4.

            end do

        end do

        ! différence maximale entre deux ierations
        ecart_max=maxval(abs(nouvelle_temperature(2:9,2:9)-temperature(2:9,2:9)))

        !mise à jour de la plaque
        temperature=nouvelle_temperature

        iteration=iteration+1

        !calcul de la nouvelle temperature moyenne
        moyenne=sum(temperature)/100.

        !enregistremenet dna sle fichier .txt
        write(10,*) iteration, moyenne, ecart_max

        if(ecart_max<precision) exit
    end do

    ! temperature moyenne finale
    moyenne_finale=sum(temperature)/100.

    !fermeture du fichier
    close(10)

    ! affichage
    print *, "nbre d'iterations:",iteration
    print *, "variation maximale:", ecart_max
    print *, "temperature moyenne initiale:", moyenne_initiale
    print *, "temperature moyenne finale:", moyenne_finale
    print *, "distribution finale des temperatures:"

    do i=1,10
        print *, temperature(i,:)
        ! On affiche de la premiere ligne à la derniere
    end do

    print *, "Donnes enregistrées dans evolution_temperature.txt"

end program distribution_temperature
