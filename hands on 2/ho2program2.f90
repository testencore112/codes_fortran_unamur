program jours_semaine
    implicit none

    character(len=20) :: jour

    ! demander le jour de la semaine
    print *, "Entrez un jour de la semaine :"
    read *,jour

    select case(jour)
        case ("lundi", "mardi","mercredi","jeudi","vendredi")
            print *, "Vous êtes en semaine"

        case ("samedi","dimanche")
            print *, "Vous êtes le week-end"

        case default
            print *, "Jour non reconnu"

    end select


end program jours_semaine