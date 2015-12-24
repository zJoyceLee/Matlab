% >> octave differenceQuotient.m

function NewtonFunc = Newton_differenceQuotient_table(x, y)
    if(length(x) == length(y))
        n = length(x);
    else
        disp('x is not equal to y!');
        return;
    endif

    A = zeros(n, n - 1);
    A = [y', A'];
    for j = 2 : n
        for i = j : n
            A(i, j) = (A(i, j - 1) - A(i - 1, j - 1)) / (x(i) - x(i + 1 - j));
        endfor
    endfor
    disp('differenceQuotient Table is: ');
    A = [x', A'];
    disp(A);

    NewtonFunc = y(1);
    yd = 0;
    New = 1;
    for(i = 1 : n - 1)
        for(j = i + 1: n)
            yd(j) = (y(j) - y(i)) / (x(j) - x(i));
        endfor
        c(i) = yd(i + 1);
        New = New * (t - x(i));
        NewtonFunc = NewtonFunc + c(i) * New;
        y = yd;
        NewtonFunc = collect(NewtonFunc);
    endfor
endfunction

% Examples:
% x = 4;
% y = 4;
