program fonction_intervalles
    implicit none
    real :: a,b,x,f

    !Lecture des valeurs
    print *, "Entrez la valeur de a:"
    read *,a

    print *, "Entrez la valeur de b:"
    read *,b

    print *, "Entrez la valeur de x (entre 0 et 30):"
    read *, x

    !vérification de l'intervalle
    if (x<0 .or. x>30) then 
        print *, "Erreur: x doit être compris entre 0 et 30"
        stop
    end if

    !méthode 1: sous routine

    call calcul_sous_routine(a,b,x,f)
    print *, "Methode 1: F(x)=",f

    !méthode 2: fonction
    f = calcul_fonction(a,b,x)
    print *, "Methode 2: F(x)=",f

    ! méthode 3: trois fonctions appellées par une sous-routine
    call calcul_trois_fonctions(a,b,x,f)
    print *, "Méthode 3: F(x)=",f

contains
    !===
    !méthode 1: sous routine
    !===

    subroutine calcul_sous_routine(a,b,x,f)
        ! la sous routine est un bloc qu'on peut appeler depuis le programme principal pour lui faire exécuter une tâche précise
        real, intent(in) :: a,b,x
        real, intent(out) :: f

        if (x>=0. .and. x<5.) then
            f = x**2 + b*x - 4.*exp(x+a)
        else if (x >= 5. .and. x <= 15.) then
            f = (x+a)**(3./2.) / (1.+4.*a*exp(a))
        else if (x > 15. .and. x <= 30.) then
            f = ((x+3./2.)*(a*x**2+b*sqrt(x))**(1./2.)+5.*a*x)/(3.*x**2+4.*b) 
        end if

    end subroutine calcul_sous_routine

    !===
    !méthode 2: fonction
    !===

    function calcul_fonction(a,b,x) result (f)
        real, intent(in) :: a,b,x
        real :: f

        if (x >= 0. .and. x < 5.) then
            f = x**2 + b*x - 4.*exp(x+a)

        else if (x >= 5. .and. x <= 15.) then
            f = (x+a)**(3./2.) / (1.+4.*a*exp(a))

        else if (x > 15. .and. x <= 30.) then
            f = ((x+3./2.)*(a*x**2+b*sqrt(x))**(1./2.) &
                +5.*a*x)/(3.*x**2+4.*b)
        end if

    end function calcul_fonction

    !===
    !méthode 3
    !===

    subroutine calcul_trois_fonctions(a,b,x,f)
        real, intent(in) :: a,b,x
        real, intent(out) :: f

        if (x >= 0. .and. x < 5.) then
            f = fonction1(a, b, x)

        else if (x >= 5. .and. x <= 15.) then
            f = fonction2(a, b, x)

        else if (x > 15. .and. x <= 30.) then
            f = fonction3(a, b, x)
        end if

    end subroutine calcul_trois_fonctions

    function fonction1(a, b, x) result(f)
        real, intent(in) :: a, b, x
        real :: f

        f = x**2 + b*x - 4.*exp(x+a)

    end function fonction1

    ! Deuxieme fonction
    function fonction2(a, b, x) result(f)
        real, intent(in) :: a, b, x
        real :: f

        f = (x+a)**(3./2.) / (1.+4.*a*exp(a))

    end function fonction2

    ! Troisieme fonction
    function fonction3(a, b, x) result(f)
        real, intent(in) :: a, b, x
        real :: f

        f = ((x+3./2.)*(a*x**2+b*sqrt(x))**(1./2.) &
            +5.*a*x)/(3.*x**2+4.*b)

    end function fonction3

end program fonction_intervalles

