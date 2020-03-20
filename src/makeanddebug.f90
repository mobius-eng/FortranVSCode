program makeanddebug

    use iso_fortran_env
    use mymodule

    implicit none


    print *, 'Hello World!'

    call foo
    call bar(10)

    contains

        subroutine foo
            print *, 'From foo'
        end

end program