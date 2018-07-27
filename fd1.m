function x = fd( u, v, w, t, a, b )
  %--------------------------------------------------------------------------
  % Jonathan R. Senning <jonathan.senning@gordon.edu>
  % Gordon College
  % April 19, 1999
  %
  % Compute finite difference solution to the BVP
  %
  %	x'' = u(t) + v(t) x + w(t) x'
  %	x(t(1)) = a, x(t(n)) = b
  %
  % t should be passed in as an Nx1 array, and u, v, and w should be either
  % Nx1 arrays corresponding to u(t), v(t) and w(t) or scalars in which case
  % an Nx1 array with that value is generated.
  %
  % Usage:	x = fd(u, v, w, t, a, b)
  %
  % Returns:
  %	x:	solution vector
  %
  % Parameters:
  %	u,v,w:	vectors containing the u(t), v(t), and w(t) values.
  %	a, b:	left and right boundary values.
  %
  %--------------------------------------------------------------------------

  % Get the dimension of t and make sure that t is an nx1 vector

  [n, m] = size( t );
  if ( n == 1 && n < m )
    t = t';
    n = m;
  end

  % Make sure that u, v, and w are either scalars or nx1 vectors.  If they
  % are scalars then we create nx1 vectors with the scalar value in each
  % position.  If they are 1xn vectors then we replace them with their
  % transposes.

  [p, q] = size( u );
  if ( p == 1 && q == 1 )
    u = u * ones( n, 1 );
  elseif ( p == 1 && p < q )
    u = u';
  end

  [p, q] = size( v );
  if ( p == 1 && q == 1 )
    v = v * ones( n, 1 );
  elseif ( p == 1 && p < q )
    v = v';
  end

  [p, q] = size( w );
  if ( p == 1 && q == 1 )
    w = w * ones( n, 1 );
  elseif ( p == 1 && p < q )
    w = w';
  end

  % Compute the stepsize.  It is assumed that all elements in t are equally
  % spaced.

  h = t(2) - t(1);

  % Construct tridiagonal system; boundary conditions appear as first and
  % last equations in system.

  A = -( 1 .+ w(2:n) * h / 2.0 );
  A(n-1) = 0.0;

  C = -( 1 .- w(1:n-1) * h / 2.0 );
  C(1) = 0.0;

  D = 2 .+ h * h * v;
  D(1) = D(n) = 1.0;

  B = - h * h * u;
  B(1) = a;
  B(n) = b;

  % Solve tridiagonal system

  for i = 2 : n
    xmult = A(i-1) / D(i-1);
    D(i) = D(i) - xmult * C(i-1);
    B(i) = B(i) - xmult * B(i-1);
  end

  x = zeros( n, 1 );
  x(n) = B(n) / D(n);

  for i = n - 1 : -1 : 1
    x(i) = ( B(i) - C(i) * x(i+1) ) / D(i);
  end

end