program classement_valeurs
    implicit none


    ! notons qu'on peut mettre en place des vecteurs comme pour c++, avec na notation
    real, dimension(3,2) :: matrice_real
    ! et on peut choisir les numérot des colonnes et lignes de matrices
    real, dimension(-5:5,-5:5) :: matrice_differente
    !notons qu'on a aussi la notation
    ! write(*,*) matrice_real(m,n) bon là il faudrait que ca soit dans deux do, avec comme integers m,n

    !attention, la limitation de la dimension de la matrice est 7

    !il y a aussi l'initialisation dynamique avec allocatable, 
    real, allocatable, dimension(:) :: vecteur_allocatable_s

    !on demande la dimension du vecteur
    !une fois qu'on l'a, oon met 
    !allocate(vecteur_allocatable_s(c'est ici qu'on met la dimension))
    !on peut aussi allocate pour les tableaux


    ! ensuite, on peut appliquer des opération sur ces matrices
    !comme le log10 d'une matrice, c'est bien entendu appliqué a tous les élements de la matrice
    !on a aussi la multiplication de la matrice par elle même **2, on a aussi la somme sum(matrice) ce qui nous donne la somme des éléments de la matrice
    !on a aussi tranpose(matrice), qui fait la transposée, dans le cas des matrices non carrées, bien spécifier la dimension de la matrice
    !on a aussi la fonction dot_product(vecteur1,vecteur2) par contre, il n'y a pas de produit vectoriel
    !on a aussi mutmul(matriceA,matriceB) attention à la dimesion, c'est bien la multiplication matricielle
    ! mask est une variable qu'on définit assez couramment pour définit les positif ou négatif, qui donne une matrice logiqie avec des true ou flase en fonction de positif et négatif, utile si on veut appliquer une logarithme par la suite

    !on a aussi minloc (matrice ) et matloc(matrice) qui nous donne et il y a aussi minval et maxval
    !on a aussi count ->pas très utilisé
    !on a aussi un is_any, true si un true je pense ->pas très utilisé
    !are_all aussi true si tout true ->pas très utilisé

    !on a aussi des fonctions différentes
    !on a aussi where(mat>0) qui permet de ne pas passer par le 
    !    mat=log10(mat)

    !on a aussi la fonction forall(...)->pas très utilisé

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