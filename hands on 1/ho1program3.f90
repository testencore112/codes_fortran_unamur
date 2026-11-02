program cosinus_hyperbolique
    implicit none

    real :: x, resultat, resultat_fortran, erreur_relative

    ! Demander la valeur de x
    print *, "Entrez la valeur de x :"
    read *, x

    ! Calcul du cosinus hyperbolique avec la formule
    resultat = (exp(x) + exp(-x)) / 2.0

    ! Calcul avec la fonction intrinsèque de Fortran
    resultat_fortran = cosh(x)

    ! Calcul de l'erreur relative
    erreur_relative = abs(resultat - resultat_fortran) / abs(resultat_fortran)

    ! Affichage des résultats
    print *, "Resultat calcule :", resultat
    print *, "Resultat Fortran :", resultat_fortran
    print *, "Erreur relative :", erreur_relative

end program cosinus_hyperbolique