function ret = dichotomy_newton(Func)
a = -0.5;
b = 0.5;

while Func(a) * Func(b) >= 0
    if -a>=b
        b = b * 2;
    else
        a = a * 2;
    endif
    if Func(a) == 0
        ret = a;
    endif
    if Func(b) == 0
        ret = b;
    endif
endwhile

while b - a > 1
    mid = (a + b) / 2;
    if Func(a) * Func(mid) <= 0
        b = mid;
    else
        a = mid;
    endif
endwhile

p0 = a;
p1 = b;
for k=1:100000
    p2=p1-Func(p1)*(p1-p0)/(Func(p1)-Func(p0));	
    p0=p1;
    p1=p2;
    if abs(p2-p1)<1e-9
        break;
    endif
endfor
ret = p0;
endfunction

% Examples:
fprintf('x+2=0, root is: ');
disp(dichotomy_newton(@(x) x+2));

fprintf('x+10=0, root is: ');
disp(dichotomy_newton(@(x) x+10));

fprintf('sin(x)-x*cos(x)=0, root is: ');
disp(dichotomy_newton(@(x) sin(x)-x*cos(x)));

fprintf('x.^2-81=0, root is: ');
disp(dichotomy_newton(@(x) x.^2-81));

fprintf('x.^2-100=0, root is: ');
disp(dichotomy_newton(@(x) x.^2-100));

fprintf('2^x-128, root is: ');
disp(dichotomy_newton(@(x) 2^x-128));

