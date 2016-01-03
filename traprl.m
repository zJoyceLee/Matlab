function [S] = traprl(f, a, b, m)

    h = b - a;
    T = (b - a) / 2 * (f(a) + f(b));
    while true
        H = 0;
        x = a + h / 2;
        while x < b
            H = H + f(x);
            x = x + h;
        endwhile
        T1 = 0.5 * (T + h * H);
        if(abs(T1 - T) < m)
            I = T1;
            break;
        endif
        h = 0.5 * h;
        T = T1;
    endwhile
    S = (1 / 3) * (4 * T1 - T);
endfunction


function s=simpson(f,a,b,n)
    h = (b - a) / n;
    s = 0;
    s2 = 0;
    s2 = s2 + feval(f, a + h / 2);
    for k = 1 : (n - 1)
        s = s + feval(f, a + h * k);
    s2 = s2 + feval(f, a + h * (k + 1 / 2));
    endfor
    s = h * (feval(f, a) + feval(f, b)) / 6 + h * s / 3 + 2 * h * s2 / 3;
endfunction


% Examples:
sum = traprl(@(x) x^2*exp(-2), 0, 4, 10);
fprintf("Traprl: traprl(@(x) x^2*exp(-2), 0, 4, 10)\n");
disp(sum);

sum = simpson(@(x) x^2*exp(-2), 0, 4, 10);
fprintf("Simpson: simpson(@(x) x^2*exp(-2), 0, 4, 10)\n");
disp(sum);
