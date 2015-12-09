function [x, det, flag] = Gauss(A, b)
% A is coefficient matrix
% b is constant matrix
% x is the solution of equations
% det is the determinant of A
% flag: True or Flse
    [n, m] = size(A);
    nb = length(b);
    if n != m
        error('A is not a square matrix.');
        return;
    endif
    if m != nb
        error('Length of b is not equal to the order of A.');
        return;
    endif
    flag = 'True';
    det = 1;
    x = zeros(n, 1);
    for k = 1: n - 1
        max1 = 0;
        for i = k: n
            if abs(A(i, k)) > max1
                max1 = abs(A(i, k));
                r = i;
            endif
        endfor
        if max1 < 1e-10
            flag = 'False';
            return;
        endif
        if r > k
            for j = k: n
                z = A(k, j);
                A(k, j) = A(r, j);
                A(r, j) = z;
            endfor
            z = b(k);
            b(k) = b(r);
            b(r) = z;
            det = -det;
        endif
        for i = k + 1: n
            m = A(i, k) / A(k, k);
            for j = k + 1: n
                A(i, j) = A(i, j) - m * A(k, j);
            endfor
            b(i) = b(i) - m * b(k);
        endfor
        det = det * A(k,k);
    endfor
    det = det * A(n,n);
    if abs(A(n, n)) < 1e-10
        flag = 'False';
        return;
    endif
    for k = n: -1: 1
        for j = k + 1: n
             b(k) = b(k) - A(k, j) * x(j);
        endfor
        x(k) = b(k) / A(k, k);
    endfor
    x(k) = b(k) / A(k, k);
endfunction

function ret = displayTest(A, b)
% display my test like this pattern
% Matrix [A, b]:
%    1    2    1    4   13
%    2    0    4    3   28
%    4    2    2    1   20
%   -3    1    3    2    6
% result is: 
%   3  -1   4   2
    A_b = [A, b];
    x = Gauss(A, b);
    fprintf("Matrix [A, b]:\n");
    disp(A_b);
    fprintf("result is: \n");
    disp(x');
    return;
endfunction


% Test Examples:
A = [1 2 1 4; 2 0 4 3; 4 2 2 1; -3 1 3 2];
b = [13 28 20 6]';
displayTest(A, b);


A = [
 31 -13   0   0   0 -10   0   0   0; 
-13  35  -9   0 -11   0   0   0   0; 
  0  -9  31 -10   0   0   0   0   0;
  0   0 -10  79 -30   0   0   0  -9;
  0   0   0 -30  57  -7   0  -5   0;
  0   0   0   0  -7  47 -30   0   0;
  0   0   0   0   0 -30  41   0   0;
  0   0   0   0  -5   0   0  27  -2;
  0   0   0  -9   0   0   0  -2  29];
b = [-15 27 -23 0 -20 12 -7 7 10]';
displayTest(A, b);

A = [1 2 6; 4 8 -1; -2 3 -5];
b = [9 11 -4]';
displayTest(A, b);
