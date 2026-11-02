program classement_valeurs
    implicit none

    integer :: i, ios 
    real :: valeurs(10), valeurs_triees(10)
    real :: moyenne

    !ouverture du fichier contenant les valeurs
    open(10,file="valeurs.txt", status="old", action="read", iostat=ios)

    if(ios /=0) then
        print *, "Erreur: impossible d'ouvrir le fichier"
        stop
    end if

    ! lecture des 10 valeurs depuis le fichier
    read(10,*, iostat=ios) valeurs

    if (ios /=0) then
        print *, "Erreur: le fichier doit contenir 10 valeurs"
        close(10)
        stop
    end if

    close(10)

    ! copie des valeurs pour conserver le tableau initial
    valeurs_triees=valeurs

    ! appel de la sous-routine de tri
    call trier_valeurs(valeurs_triees)

    !calcul de la moyenne
    moyenne=sum(valeurs)/10.

    !affichage dans le terminal 
    print *, "Valeurs initiales:"
    print *, valeurs

    print *, "Valeurs triees par ordre decroissant:"
    print *, valeurs_triees

    print *, "Moyenne:", moyenne

    !ouverture du fichier de sortie
    open(20,file="valeurs_triees.txt", status="replace",action="write",iostat=ios)

    if(ios /=0) then
        print *, "Erreur: impossible de créer le fichier"
        stop
    end if

    ! enregistrement des valeurs triees
    do i=1,10
        write(20,*) valeurs_triees(i)
    end do 
    !en écrivant ca comme ca, notons que les valeurs sont écrites ligne par ligne

    close (20)

    print *, "Valeurs enregistrees dans valeurs_triees.txt"

contains

    !sous routine pour trier les valeurs par ordre decroissant
    subroutine trier_valeurs(tableau)
        implicit none
        real, intent(inout) :: tableau(10)
        !intent(inout) : le tableau est à la fois une entrée et une sortie. La sous-routine peut lire ses valeurs initiales et les modifier.
        real :: temporaire
        integer :: i,j

        do i=1,9
            do j=1,10-i
                if(tableau(j)<tableau(j+1)) then
                    temporaire=tableau(j)
                    tableau(j)=tableau(j+1)
                    tableau(j+1)=temporaire
                end if
            end do
        end do
    end subroutine trier_valeurs
end program classement_valeurs
