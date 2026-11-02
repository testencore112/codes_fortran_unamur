program interpolation_signal
    implicit none

    integer, parameter :: n=8, nbre_points=400
    integer :: i,j,k,m,ios,g,d,p(3),meilleur
    real :: x(n),y(n),xx
    real :: escalier, lineaire, parabolique, fonction
    real :: distance_min,terme

    !ouverture du fichier contenant les donnees
    open(10,file="signal.dat.txt", status="old", action="read",iostat=ios)

    if(ios /=0) then
        print *, "Erreur: impossible d'ouvrir le fichier"
        stop
    end if

    !lecture des 8 points
    do i=1,n
        read(10,*,iostat=ios) x(i), y(i)
        if (ios /=0) then
            print *, "Erreur lors de la lecture"
            close(10)
            stop
        end if
    end do

    close(10)

    !ouverture du fichier pour enregistrer les interpolations
    open(20,file="interpolations.dat.txt", status="replace", action="write")

    write(20,*) "# x escalier lineaire parabolique sin(x)"

    !calul des interpolations sur 400 intervalles
    do j=0, nbre_points
        xx=x(1)+real(j)*(x(n)-x(1))/real(nbre_points)
        !explication de la formule; 
        !xx : abscisse du nouveau point qu'on veut calculer.
        !x(1) : première valeur du tableau x.
        !x(n) : dernière valeur du tableau x.
        !x(n)-x(1) : longueur totale de l'intervalle
        !nb_points : nombre de subdivisions de cet intervalle.
        !j : indice qui permet d'avancer progressivement dans l'intervalle.
        !real(j) : convertit l'entier j en nombre réel pour effectuer le calcul

        !recherche de l'intervalle contenant xx
        if(xx >= x(n)) then
            i=n-1
            ! cette condition regarde si le xx qu'on construit pour l'interpolation est après x(n) le dernier point dans les abscisses(x)

        else 
            do i=1,n-1
                if(xx<x(i+1)) exit
                !on commence en bas et à un moment le xx sera plus petit que l'abscisse que je regarde
            end do 
        end if

        !interpolation en scalier
        escalier=y(i)
        if(xx>=x(n)) escalier=y(n)

        !interpolation linéaire
        lineaire=y(i)+(y(i+1)-y(i))*(xx-x(i))/(x(i+1)-x(i))

        !interpolation parabolique avec 3 points voisins
        !interpolation quadratique par morceaux, construite avec la méthode de Lagrange.
        !Attention : ce n'est pas exactement une spline quadratique classique, car on ne garantit pas la continuité des dérivées entre les morceaux.
        !on prends trois points consécutifs et on construit l'unique parabole qui passe exactement par ces trois points
        
        k=max(1,min(i-1,n-2))
        !Cette instruction choisit les trois points utilisés pour construire la parabole.
        !ex: si i=1, alors k=1: on utilise les points 1,2 et 3
        !    si i=4, alors k=3: on utilise les points 3,4,5
        !    si i=7, alors k=6: on utilise les points 6,7 et 8

        parabolique= y(k)*(xx-x(k+1))*(xx-x(k+2))/((x(k)-x(k+1))*(x(k)-x(k+2))) + y(k+1)*(xx-x(k))*(xx-x(k+2))/((x(k+1)-x(k))*(x(k+1)-x(k+2))) + y(k+2)*(xx-x(k))*(xx-x(k+1))/((x(k+2)-x(k))*(x(k+2)-x(k+1)))
        ! c'est la formule de lagrange, j'ai pas creusé des masses

        !fonction supposée
        fonction=sin(xx)

        ! enregistrement des résultats
        write(20,*) xx,escalier,lineaire,parabolique,fonction
    end do
    close(20)

    !je n'ai pas fait le graphique, je ne sais pas comment faire en fortran

    !affichage des résultats
    print *, "fonction suppoée: sin(x)"
    print *, "interpolation en scalier,lineaire et parabolique faite "

    print *, "résultats enregistrés dans interpolations.dat.txt"

end program interpolation_signal











