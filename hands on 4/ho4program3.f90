program classement_valeurs
    implicit none
    integer :: i,j,ios
    real :: valeurs(10), valeurs_triees(10)
    real :: temporaire, moyenne

    !ouverture du fichier contenant les valeurs
    open(10, file="valeurs.txt", status="old", action="read", iostat=ios)

    if(ios /=0) then
        print *, "Erreur: impossible d'ouvrir le fichier"
        stop
    end if

    !lecture des 10 valeurs depuis le fichier
    read(10,*,iostat=ios) valeurs
    ! le tableau recoit automatiquement les nombres lus dans le fichier

    if(ios /=0) then
        print *, "Erreur: le fichier doit contenir 10 valeurs"
        close(10)
        stop
    end if

    close(10)

    !copie des valeurs pour conserver le tableau initial
    valeurs_triees=valeurs
    !tri des valeurs par ordre decroissant
    do i= 1,9
        do j=1,10-i 
            if(valeurs_triees(j)<valeurs_triees(j+1)) then
                temporaire=valeurs_triees(j)
                valeurs_triees(j)=valeurs_triees(j+1)
                valeurs_triees(j+1)=temporaire
            end if

        end do

    end do

    !calcul de la moyenne:
    moyenne=sum(valeurs)/10.

    !affichage dans le terminal:
    print *, "Valeurs initiales:"
    print *, valeurs

    print *, "valeurs triées par ordre decroissant:"
    print *, valeurs_triees

    print *, "Moyenne:", moyenne

    !ouverture du fichier de sortie
    open(20,file="valeurs_triees.txt",status="replace", action="write",iostat=ios)
    ! attention, remarquons que le statut replace sinifie que si le fichier n'existe pas, fortran le créé automatiquement, alors que si il existe, fortran supprime son ancien contenu et créé un nouveau fichier à sa place
    if(ios /=0) then
        print *,"Erreur: impossible de créer le fichier"
        stop
    end if

    !enregistrement des valeurs triees
    do i=1,10
        write(20,*) valeurs_triees(i)
    end do

    close (20)
    print *, "Valeurs enregistrees dans valeurs_triees.dat"

end program classement_valeurs



