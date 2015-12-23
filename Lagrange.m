% >> octave Lagrange.m

function [C, L, f] = lagran(X, Y)
    w = length(X);
    n = w - 1;
    L = zeros(w, w);
    for k = 1 : n + 1
        V = 1;
         for j = 1 : n + 1
             if k ~= j
                 V = conv(V, poly(X(j))) / (X(k) - X(j));
             endif
         endfor
         L(k,:) = V;
    endfor
    C = Y * L;
    f = 0;
    for i =  1 : length(C)
        f = f + C(i)  * power(X, length(C) -  i);
    endfor
endfunction

X = [0, 0.24, 0.48, 0.72, 0.96, 1.2];
% X = [0, 1.2];
Y = cos(X);

hold off;
[C, L, f] = lagran(X, Y);
disp(C);
plot(X,f)
hold on;
x0 = [0:0.01: 1.2];
plot(x0, cos(x0));
hold off;
