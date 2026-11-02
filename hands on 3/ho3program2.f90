program distribution_temperature
    implicit none

    integer :: i,j,iteration
    real :: temperature(10,10),nouvelle_temperature(10,10)
    real :: ecart_max
    real,parameter :: precision=0.01

    temperature=50.

    ! les quatre bords sont maintenus à 20 degrés

    temperature(1,:)=20. ! en fortran, les deux points veulent dire: 
                         ! "tous les éléments de cette dimension"
    temperature(10,:) =20.
    temperature(:,1)=20.
    temperature(:,10)=20.
    ! on met à 20 degrés les quatres bords de la plaque

    ! l'eau bouillante a la position (8,3)
    temperature(8,3) =100.

    iteration=0

    !calcul de la distribution de temperature
    do
        nouvelle_temperature=temperature

        !parcours des cases interieures de la plaque
        do i=2,9
            do j=2,9
                !nouvelle temperature= moyenne des 4 voisines
                nouvelle_temperature(i,j)=(temperature(i-1,j) + temperature(i+1,j)+temperature(i,j-1)+temperature(i,j+1))/4.
            end do
        end do

        ecart_max = maxval(abs(nouvelle_temperature(2:9,2:9)-temperature(2:9,2:9)))

        !Mise à jour de la plaque
        temperature = nouvelle_temperature

        iteration = iteration+1

        if(ecart_max<precision) exit
    end do

    ! affichage
    print *, "Nbre d'iterations", iteration
    print *, "Variation maximale:", ecart_max
    print *,"Distribution finale des temperatures:"

    do i= 10,1,-1 !attention, on s'arrête bien après avoir atteinti 1, pas avant
        print *, temperature(i,:)
    end do

end program distribution_temperature
