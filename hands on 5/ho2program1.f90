program fonction_intervalles
    implicit none

    real :: a,b,x,f

    ! lectures des valeurs a introduire
    print *, "Entrez la valeur de a :"
    read *,a

    print *, "Entrez la valeur de b:"
    read *,b

    print *, "Entrez la valeur de x (entre 0 et 30):"
    read *,x

    ! premer intervalle: 0 <= x <5
    if(x>= 0.0 .and. x< 5.) then
        f=x**2 +b*x -4.*exp(x+a)

    ! Deuxieme intervalle: 5 <= x <= 15
    else if (x >= 5. .and. x <= 15.) then
        f=(x+a)**(3./2.)/(1.+4.*a*exp(a))

    ! troisieme intervalle
    else if (x >15. .and. x<=30.) then
        f=((x+3.0/2.0)*(a*x**2+b*sqrt(x))**(1.0/2.0) +5.0*a*x)/(3.0*x**2+4.0*b)

    else 
        print *, "Erreur : x doit être compris entre 0 et 30"
    end if

    print *,"x=",x
    print *, "F(x) = ",F

end program fonction_intervalles
