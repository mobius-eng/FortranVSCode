module mymodule

    implicit none

    interface
        module subroutine bar(x)
            integer, intent(in) :: x
        end subroutine
    end interface



end module