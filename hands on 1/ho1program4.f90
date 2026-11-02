program manipulation_caracteres
    implicit none

    character(len=9) :: mot
    integer :: i

    ! Initialisation du mot
    mot = "constante"

    ! Parcours de chaque caractère du mot
    do i = 1, 9

        ! Si le caractère est 'o', on le remplace par 'a'
        if (mot(i:i) == 'o') then
            mot(i:i) = 'a'

        ! Si le caractère est 'a', on le remplace par 'o'
        else if (mot(i:i) == 'a') then
            mot(i:i) = 'o'
        end if

    end do

    ! Affichage du résultat
    print *, mot

end program manipulation_caracteres