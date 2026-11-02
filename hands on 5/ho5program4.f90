module constantes
    ! un module est un bloc de code qui permet de regrouper des variables,
    ! des constantes, des fonctions ou des sous-routines pour les 
    ! réutiliser dans plusieurs programmes
    implicit none
    real , parameter :: pi=3.14159265

end module

program volume_cone
    use constantes
    implicit none

    real :: rayon, hauteur, volume

    !lecture des valeurs
    print *, "Entrez le rayon du cone:"
    read *, rayon

    print *, "Entrez la hauteur du cone:"
    read *, hauteur

    !calcul du volume avec la fonction
    volume=calcul_volume(rayon,hauteur)

    !affichage du resultat
    print *, "Volume du cone:", volume

contains
    !fonction calculant le volume du cone
    function calcul_volume(r,h) result(v)
        implicit none
        real, intent(in) :: r,h
        real :: v

        v=pi*r**2*h/3.

    end function calcul_volume
end program volume_cone

