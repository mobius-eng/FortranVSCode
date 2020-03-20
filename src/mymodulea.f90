submodule (mymodule) mymodulea


contains

    module subroutine bar(x)
        integer, intent(in) :: x

        integer, dimension(1:10) :: u
        integer, dimension(:), allocatable :: v

        u(:) = x
        allocate(v(1:5))
        v(:) = u(1:5)
        print *, 'bar', x, u(3)
        deallocate(v)
    end

end submodule