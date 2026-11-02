

REM un fichier . bat est un fichier texte dans lequel on écris des commandes
REM windows pour qu'elles s'exécutent automatiquement

REM structure générale d'un fichier .bat:


REM : Par défaut, windows affiche les commandes qu'il est en train d'exécuter, pour Masquer l'affichage des commandes exécutées, c'est @echo off
@echo off	

REM le @ devant empêche également l'affichage de cette instruction elle-même
REM ainsi, 
@echo off
echo Bonjour
REM affiche simplement: bonjour


REM ceci est est un commentaire

echo Bonjour 
REM pour afficher un texte: echo

echo Comment allez-vous?

cd /d "%~dp0"
REM Elle paraît compliquée, mais on peut la décomposer:
REM cd change de dossier
REM /d : changer aussi de lecteur si nécessaire
REM %~dp0 : le dossier contenant le fichier .bat
REM -> c'est une variable spéciale de Windows

REM compiler le programme fortran
gfortran HelloWorld.f90 -o HelloWorld.exe
REM la je lance le fichier qui est dans le même dossier, mais je pourrais avoir le fichier dans un autre dossier, dans ce cas, il faut utiliser la commande:
REM gfortran "C:\Users\lcapo\OneDrive\Documents\2 université\1_bac2\namur\Programmation\codes\hands on 1\ho1program1.f90" -o "C:\Users\lcapo\OneDrive\Documents\2 université\1_bac2\namur\Programmation\codes\hands on 5\HelloWorld.exe"
REM ca c'est le chemin complet vers le fichier souhaité, qui fonctionne sans le REM

REM Executer le programme si la compilation a reussi
if errorlevel 1 exit /b 1
REM lorsque un programme se termine, il renvoie généralement un code de sortie: 
REM 0: exécution réussie
REM Une valeur non nulle= erreur
REM errorlevel représente le code de sortie de la dernière commande
REM Attention, if errorlevel 1 teste si ce code est supérieur ou égal à 1, et pas s'il est simplement différent de zéro.

HelloWorld.exe



pause
REM attendre une touche, cela évite que la fenêtre de commandes se ferme immédiatement lorsqu'on double clique sur le fichier .bat


