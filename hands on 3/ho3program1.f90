program classement_valeurs
    implicit none

    integer :: i,j
    real :: valeurs(10), valeurs_triees(10)
    real :: temporaire, moyenne

    ! lecture des 10 valeurs entrees par l'utilisateur
    do i=1,10
        print *, "Entrez la valeur numero",i,":"
        read *,valeurs(i)
    end do

    !copie des valeurs pour conserver le tableau initial
    valeurs_triees = valeurs

    do i= 1,9
        do j=1,10-i

            ! Si une valeur est plus petite que la suivante,
            ! on intervertit les deux valeurs

            if(valeurs_triees(j)<valeurs_triees(j+1)) then
                temporaire=valeurs_triees(j)
                valeurs_triees(j)=valeurs_triees(j+1)
                valeurs_triees(j+1)=temporaire
            end if
        end do
    end do

    !calcul de la valeur moyenne des 10 valeurs
    moyenne = sum(valeurs)/10.

    !affichage
    print *, "valeurs initiales:"
    print*, valeurs

    print *, "valeurs triées par ordre decroissant : "
    print*, valeurs_triees

    print *,"moyenne: ",moyenne
end program classement_valeurs