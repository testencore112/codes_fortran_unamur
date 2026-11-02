program maximums_relatifs
    implicit none
    integer :: nb_lignes, nb_colonnes
    integer :: i,j,di,dj,statut,nb_maximums

    real, allocatable :: matrice(:,:) !permet de déclarer une 
    ! matrice de nombres réels dont on choisira les dimensions
    ! plus tard dans le programme.
    logical :: est_maximum

    ! ouverture du fichier contenant la matrice
    open(unit=10, file="matrice.dat.txt",status="old",action="read",iostat=statut)

    ! unit=10 : En Fortran, chaque fichier ouvert est associé à un numéro d'unité. Ici, nous choisissons le numéro 10.
    ! ca veut dire que par ex, lorsqu'on écrit: read(10,*) nb_lignes, nb_colonnes
    ! Fortran comprendra : Lis les données provenant du fichier associé à l'unité 10.

    !file="matrice.dat", c'est le nom du fichier à lire, la premiere ligne contient 5 5, les dimensions de la matrice

    !status="old" -> le fichier doit déjà exister, il a différentes possiblilités ici:
    ! "old"	Ouvrir un fichier existant
    ! "new"	Créer un fichier qui ne doit pas déjà exister
    ! "replace"	Créer un nouveau fichier ou remplacer un fichier existant
    ! "unknown"	Laisser Fortran gérer selon l'existence du fichier
    ! "scratch"	Créer un fichier temporaire sans nom

    ! action="read" pour lire uniquement, il a différentes possiblilités ici:
    ! "read"	Lecture uniquement
    ! "write"	Écriture uniquement
    ! "readwrite"	Lecture et écriture

    ! iostat=statut : Vérifier les erreurs
    ! On demande à Fortran de placer dans la variable entière statut un code indiquant si l'ouverture a réussi.
    ! Il faut donc avoir déclaré auparavant :
    ! integer :: statut
    ! cela nous renvoie:     statut = 0 : le fichier a été ouvert correctement.
    !ou alors:               statut /= 0 : une erreur s'est produite.
    ! C'est pourquoi nous écrivons ensuite :
    !if (statut /= 0) then
    !    print *, "Erreur : fichier introuvable."
    !    stop
    !end if

    if ( statut /= 0) then
        print*, "Erreur: fichier matrice.dat introuvable."
        stop ! veut dire qu'on arrête immédiatement l'exécution du programme
    end if

    !lecture du nombre de lignes et de colonnes
    read(10,*) nb_lignes,nb_colonnes ! la synthaxe générale est read(unite, format) variables, * : lecture avec un format libre , sinon, read(10,'(2I3)') nb_lignes, nb_colonnes est un exemple de format 
    ! notions que :
    ! read(*,*) x	Lit x au clavier
    ! read(10,*) x	Lit x dans le fichier associé à l'unité 10
    ! write(10,*) x	Écrit x dans le fichier associé à l'unité 10

    if(nb_lignes < 3 .or. nb_colonnes < 3) then
        print *, "La matrice doit avoir au moins 3 lignes et 3 colonnes."
        close(10)
        stop
    end if

    allocate(matrice(nb_lignes,nb_colonnes))

    !creation des valeurs de la matrice ligne par ligne
    do i=1, nb_lignes
        read(10,*) matrice(i,:) ! le * signifie qu'on utilise un format libre : Fortran reconnaît automatiquement les nombres, séparés par des espaces, des virgules ou des fins de ligne appropriées, sans qu'on lui impose des colonnes de largeur fixe
        ! et le : signifie que on sélectionne toute la première ligne ou la deuxieme
    end do

    !fermeture du fichier
    close(10) 

    nb_maximums=0

    !parcours des elements interieurs
    do i=2, nb_lignes -1
        do j=2, nb_colonnes -1

            est_maximum= .true.

            !comparaison avec les 8 elements voisins

            do di=-1,1
                do dj=-1,1

                    ! ne pas comparer l'element avec lui même 
                    if (di ==0 .and. dj==0) cycle ! C'est une instruction propre aux boucles Fortran. Elle signifie : ignorer le reste de l'itération actuelle et passer à la suivante.
                    
                    ! Si un voisin est supérieur ou égal
                    !l'élément n'est pas un maximum relatif
                    if(matrice(i,j) <= matrice(i+di,j+dj)) then
                        est_maximum= .false.
                    end if
                end do
            end do

            !affichage du max relatif trouvé
            if(est_maximum) then
                print *, "Maximum : ligne =",i,"colonne =",j, "valeur =", matrice(i,j)

                nb_maximums=nb_maximums +1
            end if
        end do
    end do

    print *, "Nombre de maximums relatifs:", nb_maximums

end program maximums_relatifs




    
