program calcul_pi
    implicit none

    integer :: i, n, points_interieurs
    real :: x, y, pi_approx, erreur_relative
    real, allocatable :: tirages(:,:), approximations(:)
    real, parameter :: pi_reference=3.14159265

    ! nombre de points à simuler
    print *, "Entrez le nombre de points à simuler:"
    read *,n 

    if (n<=0) then
        print *, "Erreur, le nombre de points doit être positif"
        stop
    end if

    ! creation des tableaux
    allocate(tirages(2,n), approximations(n))

    points_interieurs=0

    !monte carlo:

    do i=1,N
        !generatoi de deux nombres aléatoires entre 0 et 1
        call random_number(x)
        call random_number(y)

        !transformation pour obtenir des valeurs entre -1 et 1

        x= 2.*x -1
        y=2.*y-1

        ! enregistrement des coordonnees
        tirages(1,i)=x
        tirages(2,i)=y

        !verification si le point appartient au disque
        if(x**2+y**2 <=1. ) then
            points_interieurs=points_interieurs+1

        end if

        ! calcul et enregistrement de l'approximation de pi
        approximations(i)=4.*real(points_interieurs)/real(i)
    end do

    ! Approximation finale de pi
    pi_approx = approximations(n)

    !calcul de l'erreur relative en pourcentage
    erreur_relative = abs(pi_approx-pi_reference)/pi_reference*100.

    !affichage des resultats
    print *, "Nombre de points utilisés:",N
    print *,"Valeur approchées de pi:", pi_approx
    print *, "Erreur reative (en pourcent):", erreur_relative

end program calcul_pi
