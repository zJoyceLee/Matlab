% P(x) = x^3 - 3 * x^2 + 3 * x - 1
% Q(x) = ((x - 3) * x + 3) * x - 1
% R(x) = (x - 1)^3
% -------------------------------------------------
   function [result_p] = P(value_p)
   result_p = value_p.^3 -3 * value_p.^2 + 3 * value_p - 1
   end

   function [result_q] = Q(value_q)
   result_q = ((value_q - 3) * value_q + 3) * value_q -1
   end

   function [result_r] = R(value_r)
   result_r = (value_r - 1).^3
   end
% -------------------------------------------------
% (a) x = 2.72  four rounding
   value_p = 2.72
   result_p = P(value_p)

   value_q = 2.72
   result_q = Q(value_q)

   value_r = 2.72
   result_r = R(value_r)
