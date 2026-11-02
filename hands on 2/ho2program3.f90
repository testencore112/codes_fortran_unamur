
program taylor_sinus
    implicit none

    integer :: n
    real :: x, angle, pi
    real :: terme, somme, ancienne_somme
    real :: erreur, resultat_fortran
    real, parameter :: precision=0.001 !c'est bien pour déclarer
    !  une constante en fortran

    ! lecture de l'angle en radians
    print *, "Entrez x en radians: "
    read *, x

    pi= acos(-1.)

    ! reduction de l'angle entre -pi et pi
    angle = modulo(x+pi,2.*pi) - pi
    ! pour rappel, le modulo nous donne le reste de la division:
    ! a = kb+r -> ca nour renvoie r.
    ! on fait ca car pour la série de taylor, elle converge plus rapidement
    ! lorsqu'on utilise un angle proche de zéro

    ! utilisation des symétries du sinus
    if(angle > pi/2.) then
        angle = pi - angle
    else if (angle < -pi/2.) then
        angle = -pi - angle
    end if

    ! premier terme de la série
    terme=angle
    somme = terme
    n=0

    print *, "n= ",n,"; sin x =",somme

    ! calcul des termes successifs
    do ! c'est un peu comme une boucle while(true) en c++ -> la boucle est infinie tant qu'on ne lui donne pas explicitement l'ordre de s'arrêter.
        ancienne_somme = somme

        ! T(n+1) = -T(n)*x²/((2n+2)*(2n+3)) ->formule à connaitre
        terme = -terme*angle**2 / (real(2*n+2)*real(2*n+3))

        ! Ajout du nouveau terme à la somme précédente
        somme = somme + terme

        ! Incrémentation du compteur
        n = n + 1

        if (somme /= 0.0) then
            erreur = abs(somme-ancienne_somme)/abs(somme)
        else
            erreur = abs(somme-ancienne_somme)
        end if

        print *, "n =", n, "; sin x =", somme, &
                 "; ecart relatif =", erreur

        if (erreur <= precision) exit
        if (n >= 100) exit

    end do

    ! Comparaison avec la fonction intrinseque
    resultat_fortran = sin(x)

    print *, "---------------------------"
    print *, "Sinus par Taylor :", somme
    print *, "Sinus par Fortran :", resultat_fortran
    print *, "Difference absolue :", abs(somme-resultat_fortran)

end program taylor_sinus

