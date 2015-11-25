% P(x) = x^3 - 3 * x^2 + 3 * x - 1
% Q(x) = ((x - 3) * x + 3) * x - 1
% R(x) = (x - 1)^3
% -------------------------------------------------
   function result_p = P(value)
   output_precision (4)
   cube_value = value.^3
   square_value = value.^2
   result_p = cube_value -3 * square_value + 3 * value - 1
   end

   function result_q = Q(value)
   result_q = ((value - 3) * value + 3) * value -1
   end

   function result_r = R(value)
   result_r = (value - 1).^3
   end
% -------------------------------------------------
% (a) x = 2.72  four rounding
   value = 2.72
   result = [P(value), Q(value), R(value)]
