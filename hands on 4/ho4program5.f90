program calcul_pi
    implicit none
    integer :: i, n, points_interieurs, ios
    real :: x, y, pi_approx, erreur_relative
    real, allocatable :: tirages(:,:), approximations(:)
    real, parameter :: pi_reference= 3.14159265

    ! nombre de points à simuler
    print *, "Entrez le nombre de points à simuler:"
    read *, n

    if (n<=0) then
        print *, "Erreur, le nombre de points doit être positif"
        stop
    end if

    ! creation des tableaux
    allocate(tirages(2,n), approximations(n))

    points_interieurs=0

    ! ouverture du fichier pour enregistrer les donnees
    open(10, file="tirages_pi.txt", status="replace", action="write", iostat=ios)

    if (ios /= 0) then
        print *, "Erreur : impossible d'ouvrir le fichier"
        stop
    end if

    ! en-tete du fichier
    write(10,*) "Iteration  x   y   Pi_approx"

    ! Monte-Carlo
    do i=1,n

        ! generation de deux nombres aleatoires entre 0 et 1
        call random_number(x)
        call random_number(y)

        ! transformation pour obtenir des valeurs entre -1 et 1
        x=2.*x-1.
        y=2.*y-1.

        ! enregistrement des coordonnees
        tirages(1,i)=x
        tirages(2,i)=y

        ! verification si le point appartient au disque
        if (x**2+y**2 <= 1.) then
            points_interieurs=points_interieurs+1
        end if

        ! calcul et enregistrement de l'approximation de pi
        approximations(i)=4.*real(points_interieurs)/real(i)
        !l'approximation devient de plus en plus précise

        ! enregistrement des donnees dans le fichier
        write(10,*) i, x, y, approximations(i)

    end do

    ! fermeture du fichier
    close(10)

    ! approximation finale de pi
    pi_approx=approximations(n)

    ! calcul de l'erreur relative en pourcentage
    erreur_relative=abs(pi_approx-pi_reference)/pi_reference*100.

    ! affichage des resultats
    print *, "Nombre de points utilises:", n
    print *, "Valeur approchee de pi:", pi_approx
    print *, "Erreur relative (en pourcent):", erreur_relative

    print *, "Donnees enregistrees dans tirages_pi.txt"

end program calcul_pi
