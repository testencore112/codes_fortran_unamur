! c'est sur les conversions forcées
! on se demande comment fotran efectue des opératione entre entiers et 
! réels

program conversions
    implicit none

    integer :: n, p, q
    real :: x, y

    n = 5
    p = 10
    q = 1

    x = 0.5
    y = 1.25

    ! n = 5, p = 10
    ! y = 5 + 10 = 15.0
    y = n + p
    print *, "y = n + p :", y
    ! Addition de deux entiers, puis conversion en réel


    ! x = 0.5, y = 15.0
    ! p = 0.5 + 15.0 = 15.5
    ! p = 15 (troncature car p est entier)
    p = x + y
    print *, "p = x + y :", p
    ! Addition de deux réels, puis suppression de la partie décimale
    ! car p est un entier

    ! x = 0.5, p = 15
    ! y = 0.5 / 15 = 0.0333333
    y = x / p
    print *, "y = x / p :", y
    ! Division réelle car x est un réel
    
    ! x = 0.5, n = 5, p = 15
    ! n/p = 5/15 = 0 (division entière)
    ! x = 0.5 + 0 = 0.5
    x = x + n / p
    print *, "x = x + n / p :", x
    ! Division entière car n et p sont entiers
    ! 5/15 = 0, donc x reste égal à 0.5

    ! y = 0.0333333, n = 5, p = 15, q = 1 initialement
    ! n/p = 5/15 = 0 (division entière)
    ! q = 0.0333333 + 0 = 0.0333333
    ! q = 0 (troncature car q est entier, l'ancienne valeur 1 est écrasée)
    q = y + n / p
    print *, "q = y + n / p :", q
    ! Division entière : n/p = 0 
    ! Le résultat réel (à ce stade du programme, y=0.33333réel) 
    ! est ensuite tronqué car q est un entier

end program conversions