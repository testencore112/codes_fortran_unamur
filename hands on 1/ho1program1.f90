program HelloWorld
    implicit none

    character(len=50) :: prenom, nom
    ! attetion à bien spécifier la longeur de la chaine de caractère
    ! sinon ca ne sera pas plusieurs caractère mais un seul
    ! il faut rajouter le (len=50) pour passer de char à string
    print *, "Quel est votre prenom ?"
    read *, prenom

    print *, "Quel est votre nom ?"
    read *, nom

    print *, "Bonjour, ", trim(prenom), trim(nom)
    ! le truc trim sert à ce que il n'y aie pas plein d'espace après le 
    ! prénom et le nom. Car comme on a initialisé notre char avec (len=50),
    ! fortran rajoute automatiquement des espaces après si on ne rempli 
    ! pas tout l'espace. 
    ! d'où trim pour ne pas avoir tous ces espaces.

end program HelloWorld



    
