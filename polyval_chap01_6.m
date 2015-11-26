% P(x) = x^3 - 3 * x^2 + 3 * x - 1
% Q(x) = ((x - 3) * x + 3) * x - 1
% R(x) = (x - 1)^3
% --------------------------------------------------
pkg load mapping
% integer
function ret = integer(value)
    if(value >= 0)
	ret = floor(value);
    else
	ret = ceil(value);
    endif
endfunction
% the number of integer
function ret = the_number_of_integer(value)
    ret = 0;
    value_copy = integer(value);
    if(value_copy != 0)
        while(value_copy != 0)
            value_copy = integer(value_copy / 10);
            ret = ret + 1;
        endwhile
    endif
endfunction
% roundn: like int
function ret = roundni(x, n = 0)
    if (mod(x,1) != 0)
        ret = integer(10^abs(n) * x) / (10^abs(n));
    else
        ret = integer(x / 10^abs(n)) * 10^abs(n);
    endif    
endfunction
% four rounding
function ret = four_rounding(value)
    integerpart = the_number_of_integer(value);
    ret = roundni(value, 4 - integerpart);
endfunction
% calculate
function result_p = P(value)
    cube_value = four_rounding(value.^3)
    square_value = four_rounding(value.^2)
    result_p = cube_value -3 * square_value + 3 * value - 1;
endfunction

function result_q = Q(value)
    result_q = ((value - 3) * value + 3) * value -1;
endfunction

function result_r = R(value)
    result_r = (value - 1).^3;
endfunction

output_precision(4)
% --------------------------------------------------
% (a) x = 2.72  four rounding
value = 2.72
result = [P(value), Q(value), R(value)]
% -------------------------------------------------
% (b) x = 0.975 four rounding
value = 0.975
result = [P(value), Q(value), R(value)]
