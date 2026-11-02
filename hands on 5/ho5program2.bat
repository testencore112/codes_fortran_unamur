REM ici, on doit reprendre le programme fonction_intervalles et utiliser une sous-routine pour implémenter la fonction

REM on utilise ensuite une fonction pour implémenter la fonction définie par intervalles

REM Finalement, on utilise trois fonctions distrinctes, appellées par une sous-routine, pour implémenter la fonction définie par intervalles.

REM ---------------------------------------------------------------
REM une routine dans un fichier .bat est: un ensemble d'instructions qui accomplissent une tâche précise.

REM Imaginons un programme qui doit effectuer les opérations suivantes :
REM: 1: lire une matrice
REM: 2: calculer les maximums de la matrice
REM: 3: Afficher les résultats

Rem on pourrait écrire toutes ces instructions les unes à la suite des autres
REM mais on peut aussi organiser le programme en plusieurs blocs

REM PROGRAMME PRINCIPAL
REM    |
REM    |-- Routine : lire la matrice
REM    |
REM    |-- Routine : calculer les maximums
REM    |
REM    |-- Routine : afficher les résultats
REM    |
REM    FIN

REM chaque routine est chargée d'une tâche particulière

REM qu'est ce qu'une sous routine? 
REM une sous routine est un bloc d'instructions qu'un programmme peut appeler pour effectuer une tâche, puis reprendre son exécution là où il s'est arrêté.

REM On emploie souvent routine comme terme général, tandis que sous-routine désigne plus précisément un bloc appelé par un autre.

REM exemple concret d'une sous routine dans un fichier .bat :

REM @echo off
REM echo Debut du programme
REM call :bonjour -> l'instruction call :bonjour envoie l'exécution vers le bloc nommé bonjour
REM remarque:  la sous routine est exécutée et affiche "Bonjour Louis!" -> voire suite du programme
REM echo Fin du programme
REM goto :eof 
REM cette commande signifie: goto signifie aller à et :eof signifie end of file. Elle est nécessaire sinon la sous routine serait relue. 
REM c'est bien là en dessous qu'on définit la sous routine. 
REM :bonjour
REM echo Bonjour Louis!
REM exit /b
REM cette dernière commande exit /b signifie quitter et le /b signifie batch: quitter le script ou la sous routine, sans fermer l'interpéteur de commandes

REM quand à la synthaxe des routines, elles sont exécutées directement, c'est le train principal

REM -------------------------------------------

REM On peut aussi définir des routines et sous routines directement dans le fichier .f90. 

REM faisons un exemple: 

REM program principal
REM    implicit none
REM    print *, "Debut du programme"
REM    call bonjour()
REM    print *, "Fin du programme"

REM contains
REM    subroutine bonjour()
REM        print *, "Bonjour !"
REM    end subroutine bonjour
REM end program principal

REM je vais donc implémenter les routines et sous routines en fortran




