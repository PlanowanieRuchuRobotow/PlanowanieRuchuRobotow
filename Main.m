%% 
close all;
clear;
clc;

%% Dane wejœciowe
N = 2; % N-wahad³o
a = [1 1]; % D³ugoœci ramion
p0 = [0.5; -0.5]; % Punkt pocz¹tkowy
p1 = [1; 1]; % Punkt koñcowy
delta = 0.1; % Dok³adnoœæ trajektorii

%% Obliczenia kinematyki odwrotnej dla p0 i p1 oraz trajektorii zadanej w przestrzeni zadaniowej
q0 = kinematyka_odwrotna(p0, a); %Konfiguracja dla p0
q1 = kinematyka_odwrotna(p1, a); %Konfiguracja dla p1

%% Obliczanie trajektorii
kroki = 101;
dp = sqrt((p1(1)-p0(1))^2+(p1(2)-p0(2))^2); %D³ugoœæ zadanej œcie¿ki
dq1 = (q1(1)-q0(1))/(kroki-1);
dq2 = (q1(2)-q0(2))/(kroki-1);

for i = 1:kroki
    q(:,i) = [q0(1)+dq1*(i-1);q0(2)+dq2*(i-1)];
    p(:,i) = kinematyka(q(:,i),a);
end

s = linspace(0,1,kroki);
bok1 = sqrt((p0(1)-p(1,:)).^2+(p0(2)-p(2,:)).^2);
bok2 = sqrt((p1(1)-p(1,:)).^2+(p1(2)-p(2,:)).^2);
pobw = (bok1+bok2+dp)/2;
odleglosc = 2.*(sqrt(pobw.*(pobw-bok1).*(pobw-bok2).*(pobw-dp)))./dp;

%% Wyniki
%plot (s,p(1,:),s,p(2,:))
f1 = figure();
hold on;
grid;
plot(p(1,:),p(2,:));
title('Trajektoria');

f2 = figure();
hold on;
grid;
plot(s,odleglosc);
title('Odleg³oœæ');

%% Pierwsza iteracja
[c, d] = max(odleglosc);
figure(f2);
plot(s(d), c, 'r*');
figure(f1);
plot(p(1,d), p(2, d), 'r*');

[A, B] = rownanieProstej(p0(1), p1(1), p0(2), p1(2));
[p2(1), p2(2)] = punktNaProstej(A, B, p(1, d), p(2, d));

% Obliczenia kinematyki odwrotnej dla p2
q2 = kinematyka_odwrotna(p2, a); %Konfiguracja dla p2

% Obliczanie trajektorii q(0) -> q(2)
kroki = 101;
dp_2 = sqrt((p2(1)-p0(1))^2+(p2(2)-p0(2))^2); %D³ugoœæ zadanej œcie¿ki
dq1 = (q2(1)-q0(1))/(kroki-1);
dq2 = (q2(2)-q0(2))/(kroki-1);

for i=1:kroki
    q_2(:,i) = [q0(1)+dq1*(i-1);q0(2)+dq2*(i-1)];
    p_2(:,i) = kinematyka(q_2(:,i),a);
end

% Obliczanie trajektorii  q(2) -> q(1)
kroki = 101;
dp_3 = sqrt((p1(1)-p2(1))^2+(p1(2)-p2(2))^2); %D³ugoœæ zadanej œcie¿ki
dq1 = (q1(1)-q2(1))/(kroki-1);
dq2 = (q1(2)-q2(2))/(kroki-1);

for i = 1:kroki
    q_3(:,i)=[q2(1)+dq1*(i-1);q2(2)+dq2*(i-1)];
    p_3(:,i)=kinematyka(q_3(:,i),a);
end

%plot (s,p(1,:),s,p(2,:))
f3 = figure();
hold on;
grid;
plot(p_2(1,:), p_2(2,:), 'r', p_3(1,:), p_3(2,:), 'g');
text(p(1), p(2), 'p0');
text(p1(1), p1(2), 'p1');
textTMP = ['p2 (' num2str(p2(1)) ', ' num2str(p2(2)) ')'];
text(p2(1), p2(2), textTMP);
title('Trajektoria po 1. podziale');
plot(p(1,:),p(2,:));