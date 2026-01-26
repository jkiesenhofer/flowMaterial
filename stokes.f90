program stokeszahl
  implicit none
  integer :: i
  real(8) :: dp, rho_p, mu, U, L, St

  rho_p = 2500.0d0      ! Partikeldichte [kg/m^3]
  mu    = 1.8d-5        ! dyn. Viskosität Luft [Pa s]
  U     = 1.0d0         ! Strömungsgeschwindigkeit [m/s]
  L     = 0.1d0         ! charakteristische Länge [m]

  open(unit=10, file="stokes.dat", status="replace")

  do i = 1, 100
     dp = i * 1.0d-6    ! Partikeldurchmesser [m]
     St = rho_p * dp**2 * U / (18.0d0 * mu * L)
     write(10,*) dp, St
  end do

  close(10)
end program stokeszahl
