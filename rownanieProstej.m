function [A, B] = rownanieProstej(x1, x2, y1, y2)
% Funkcja znajduje parametry prostej przechodz¹cej przez dwa zadane punkty
% (y = Ax + B)
if x1 ~= x2
  coefficients = polyfit([x1, x2], [y1, y2], 1);
  A = coefficients(1);
  B = coefficients(2);
  A = round(A*10^10)/10^10;
  B = round(B*10^10)/10^10;
else
  throw(MException('AcctError:NoClient', 'Wspolczynnik A nie zostal wyznaczony poprawnie, prosta zbyt pozioma/pionowa! (Tak, wiem, jestem mistrzem w opisywaniu rzeczy)'));
end

end

