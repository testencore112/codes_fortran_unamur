program integration_fonction
    implicit none

    integer :: n
    real :: a,b

    a=0.
    b=5.

    !nombre de subdivisions il faut que ca soit pair pour la méthode de simpson
    
    do
        print *, "Entrez le nombde de subdivisions (nombre pair):" ! attention, c'est pas le nombre de points, il y a bien n+1 points et n subdivisions, il faut 3 points pour la premiere parabole et puis deux pour compléter car ca suitaprès le point utilisé. d'ou le pair en terme d'intervalles. 
        read *, n 

        if(n<=0 .or. mod(n,2)/=0) then
            print *, "Erreur: entrez un entier positif et pair"
            cycle !cycle : si la valeur est incorrecte, recommence la boucle et redemande n.
        end if
        exit
    end do


    !appel des quatre fonctions

    print *, "méthode des rectangles: ", rectangles(a,b,n)
    print *, "Méthode du point médian: ", point_median(a,b,n)
    print *, "Méthode des trapèzes: ", trapezes(a,b,n)
    print *, "Méthode de Simpson: ", simpson(a,b,n)

contains
    !fonction a integrer
    function f(x) result(y)
        real, intent(in) :: x 
        real :: y

        y=3.*(x-2.5)**3+(x-2.5)**2-10.*x+40.625
    end function f 

    !1: méthode des rectanges à gauche
    function rectangles(a,b,n) result(integrale)
        real,intent(in) :: a,b 
        integer, intent(in) :: n 
        real :: integrale,h 
        integer :: i
        
        h=(b-a)/real(n)
        integrale=0.

        do i=0,n-1
            integrale=integrale+f(a+(i*h))
        end do

        integrale=integrale*h 
        !bon, c'est un b-peu bizarre car la hauteur est enfait la largeur ici, mais ca fonctionne
    end function rectangles

    !méthode du point médian:
    function point_median(a,b,n) result(integrale)
        real,intent(in) :: a,b 
        integer,intent(in) :: n 
        real :: integrale,h 
        integer :: i 

        h=(b-a)/real(n)
        integrale=0.

        do i=0,n-1
            integrale=integrale+f(a+(i+0.5)*h)
            !on se met au milieu de l'intervalle, pas au début
        end do

        integrale=integrale*h 
        !la hauteur est aussi ici la largeur mais ok

    end function point_median

    !methode des trapèzes
    function trapezes(a,b,n) result(integrale)
        real, intent(in) :: a, b 
        integer, intent(in) :: n 
        real :: integrale,h 
        integer :: i 

        h=(b-a)/real(n)
        integrale=(f(a)+f(b))/2.
        !grande base plus petite base divisé par deux, il manque fois la hauteur

        do i=1,n-1
            integrale=integrale+f(a+i*h)
        end do

        integrale=integrale*h ! elle est là la hauteur
    end function trapezes   
    
    ! j'ai pas compris la méthode des trapèzes et il me reste à faire la méthode de simpson

    !méthode de simpson
    function simpson(a,b,n) result(integrale)
        real, intent(in) :: a,b
        integer, intent(in) :: n 
        real :: integrale,h 
        integer :: i 

        h=(b-a)/real(n)
        integrale=f(a)+f(b)

        !notes de chatgpt:
        ! Methode de Simpson composite (n doit etre pair)
!
! I = (h/3) * [ f(x0) + f(xn)
!               + 4*(f(x1) + f(x3) + f(x5) + ... + f(xn-1))  ->ca c'est les i impairs
!               + 2*(f(x2) + f(x4) + f(x6) + ... + f(xn-2)) ]  -> ca c'est les i pairs
!
! avec h = (b-a)/n et xi = a + i*h
!
! Les coefficients suivent l'ordre : 1, 4, 2, 4, 2, ..., 4, 1
! Simpson est exacte pour les polynomes de degre <= 3
! (a l'arrondi numerique pres).
        !c'est pour la méthode de simpson, la formule

        !c'est pour ce truc la que ca doit être paire voire explication au dessus
        do i=1, n-1 ! ca commence à 1 car les deux extrémites, f(a) et f(b) sont déjà prises en compte avant la boucle
            if(mod(i,2)==0) then
                integrale= integrale +2.*f(a+i*h)
            else 
                integrale=integrale+4.*f(a+i*h)
            end if
        end do

        integrale=integrale*h/3.

    end function simpson
end program integration_fonction




