%1=Airline 
%2=HSR
clc;
clear all;
close all;
Gam = 0.01:0.01:1;     %Substitutability factor between HSR & Airline
Del = 0.01*(1:1:100);  %Government altruistic measure
C(1) = 1000; %rupees spent per airline passenger
C(2) = 600;  %rupees spent per HSR passenger
v(1) = 300; %value of travel time
v(2) = 150; %value of access time
v(3) = 50; %value of waiting time
tatr = 1+(0.01:0.01:1)*2; %airline travel time
taac = 0.02*(1:1:100);  %airline access time*
tawt = 0.01*(1:1:100);  %airline waiting time*
thtr = 1+(1:1:100)*0.09;  %HSR travel time*
thac = 0.01*(1:1:100);  %HSR access time*
thwt = 0.005*(1:1:100); %HSR waiting time

Alp1 = 5000+(1:1:100)*100; %highest willingness to pay for an airline seat
Alp2 = 3000+(1:1:100)*50;  %highest willingness to pay for a HSR seat
Bet1 = 1+(0.01:0.01:1);    %demand sensitivity for airline*
Bet2 = 1+(0.01:0.01:1);    %demand sensitivity for HSR*

width = 3;
height = 3;
alw = 0.75;
fsz = 11;
lw = 1.5;
msz = 8;

for i=1:1:100
   X = C(1)+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   Y = C(2)+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   Z(i) = 2*Bet1(1)*Bet2(1)*(2-Del(i));
   q1(i) = max(((Gam(50)*Y - X*Bet2(1)*(2-Del(i)) + Alp1(50)*Bet2(1)*(2-Del(i)) - Gam(50)*Alp2(50))/(Z(i) - (Gam(50)^2))),0);
   q2(i) = max(((2*Bet1(1)*Alp2(100) - 2*Bet1(1)*Y + X*Gam(50) - Alp1(50)*Gam(50))/(Z(i) - (Gam(50)^2))),0);
   p1(i) = max(Alp1(50)-Bet1(1)*q1(i)-Gam(50)*q2(i)-X+C(1),0);
   p2(i) = max(Alp2(100)-Bet2(1)*q2(i)-Gam(50)*q1(i)-Y+C(2),0);
end

figure('Name','Quantities vs Government Altruistic Measure','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,q1,'-ro','LineWidth',lw,'MarkerSize',msz); 
hold on;
xlabel('Government Altruistic Measure Delta');
plot(Del,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs Government Altruistic Measure','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
xlabel('Government Altruistic Measure Delta');
plot(Del,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   X = C(1)+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   Y = C(2)+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   Z = 2*Bet1(50)*Bet2(50)*(2-Del(1));
   q1(i) = max(((Gam(i)*Y - X*Bet2(50)*(2-Del(1)) + Alp1(50)*Bet2(50)*(2-Del(1)) - Gam(i)*Alp2(50))/(Z - Gam(i)^2)),0);
   q2(i) = max((2*Bet1(50)*Alp2(50) - 2*Bet1(50)*Y + X*Gam(i) - Alp1(50)*Gam(i))/(Z - Gam(i)^2),0);
   p1(i) = max(Alp1(50)-Bet1(50)*q1(i)-Gam(i)*q2(i)-X+C(1),0);
   p2(i) = max(Alp2(50)-Bet2(50)*q2(i)-Gam(i)*q1(i)-Y+C(2),0);
end

figure('Name','Quantities vs Substitutability','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Gam,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Substitutability Gamma');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs Substitutability','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Gam,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
xlabel('Substitutability Gamma');
plot(Gam,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   X(i) = C(1)+v(1)*tatr(50)+v(2)*taac(i)+v(3)*tawt(50);
   Y = C(2)+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   Z = 2*Bet1(50)*Bet2(50)*(2-Del(50));
   q1(i) = max(((Gam(50)*Y - X(i)*Bet2(50)*(2-Del(50)) + Alp1(50)*Bet2(50)*(2-Del(50)) - Gam(50)*Alp2(50))/(Z - Gam(50)^2)),0);
   q2(i) = max((2*Bet1(50)*Alp2(50) - 2*Bet1(50)*Y + X(i)*Gam(50) - Alp1(50)*Gam(50))/(Z - Gam(50)^2),0);
   p1(i) = max(Alp1(50)-Bet1(50)*q1(i)-Gam(50)*q2(i)-X(i)+C(1),0);
   p2(i) = max(Alp2(50)-Bet2(50)*q2(i)-Gam(50)*q1(i)-Y+C(2),0);
end

figure('Name','Quantities vs Airport Access Time','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(taac,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(taac,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Airport Access Time');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs Airport Access Time','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(taac,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(taac,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Airport Access Time');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   X(i) = C(1)+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(i);
   Y = C(2)+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   Z = 2*Bet1(50)*Bet2(50)*(2-Del(50));
   q1(i) = max(((Gam(50)*Y - X(i)*Bet2(50)*(2-Del(50)) + Alp1(50)*Bet2(50)*(2-Del(50)) - Gam(50)*Alp2(50))/(Z - Gam(50)^2)),0);
   q2(i) = max((2*Bet1(50)*Alp2(50) - 2*Bet1(50)*Y + X(i)*Gam(50) - Alp1(50)*Gam(50))/(Z - Gam(50)^2),0);
   p1(i) = max(Alp1(50)-Bet1(50)*q1(i)-Gam(50)*q2(i)-X(i)+C(1),0);
   p2(i) = max(Alp2(50)-Bet2(50)*q2(i)-Gam(50)*q1(i)-Y+C(2),0);
end

figure('Name','Quantities vs Airport Waiting Time','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(tawt,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(tawt,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Airport Waiting Time');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs Airport Waiting Time','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(tawt,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(tawt,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Airport Waiting Time');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   X = C(1)+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   Y(i) = C(2)+v(1)*thtr(i)+v(2)*thac(50)+v(3)*thwt(50);
   Z = 2*Bet1(50)*Bet2(50)*(2-Del(50));
   q1(i) = max(((Gam(50)*Y(i) - X*Bet2(50)*(2-Del(50)) + Alp1(50)*Bet2(50)*(2-Del(50)) - Gam(50)*Alp2(50))/(Z - Gam(50)^2)),0);
   q2(i) = max((2*Bet1(50)*Alp2(50) - 2*Bet1(50)*Y(i) + X*Gam(50) - Alp1(50)*Gam(50))/(Z - Gam(50)^2),0);
   p1(i) = max(Alp1(50)-Bet1(50)*q1(i)-Gam(50)*q2(i)-X+C(1),0);
   p2(i) = max(Alp2(50)-Bet2(50)*q2(i)-Gam(50)*q1(i)-Y(i)+C(2),0);
end

figure('Name','Quantities vs HSR Distance Travelled (HSR Speed = 200 kmph)','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(thtr*100,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(thtr*200,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Distance Travelled (HSR Speed = 200 kmph)');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Quantities vs HSR Distance Travelled (HSR Speed = 300 kmph)','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(thtr*300,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(thtr*300,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Distance Travelled (HSR Speed = 300 kmph)');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs HSR Distance Travelled (HSR Speed = 200 kmph)','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(thtr*200,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(thtr*200,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Distance Travelled (HSR Speed = 200 kmph)');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs HSR Distance Travelled (HSR Speed = 300 kmph)','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(thtr*300,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(thtr*300,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Distance Travelled (HSR Speed = 300 kmph)');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   X = C(1)+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   Y(i) = C(2)+v(1)*thtr(50)+v(2)*thac(i)+v(3)*thwt(50);
   Z = 2*Bet1(50)*Bet2(50)*(2-Del(1));
   q1(i) = max(((Gam(50)*Y(i) - X*Bet2(50)*(2-Del(1)) + Alp1(50)*Bet2(50)*(2-Del(1)) - Gam(50)*Alp2(50))/(Z - Gam(50)^2)),0);
   q2(i) = max((2*Bet1(50)*Alp2(50) - 2*Bet1(50)*Y(i) + X*Gam(50) - Alp1(50)*Gam(50))/(Z - Gam(50)^2),0);
   p1(i) = max(Alp1(50)-Bet1(50)*q1(i)-Gam(50)*q2(i)-X+C(1),0);
   p2(i) = max(Alp2(50)-Bet2(50)*q2(i)-Gam(50)*q1(i)-Y(i)+C(2),0);
end

figure('Name','Quantities vs HSR access Time','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(thac,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(thac,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Access Time');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs HSR Access Time','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(thac,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(thac,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Access Time');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   X = C(1)+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   Y = C(2)+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   Z = 2*Bet1(50)*Bet2(50)*(2-Del(50));
   q1(i) = max(((Gam(50)*Y - X*Bet2(50)*(2-Del(50)) + Alp1(i)*Bet2(50)*(2-Del(50)) - Gam(50)*Alp2(50))/(Z - Gam(50)^2)),0);
   q2(i) = max((2*Bet1(50)*Alp2(50) - 2*Bet1(50)*Y + X*Gam(50) - Alp1(i)*Gam(50))/(Z - Gam(50)^2),0);
   p1(i) = max(Alp1(i)-Bet1(50)*q1(i)-Gam(50)*q2(i)-X+C(1),0);
   p2(i) = max(Alp2(50)-Bet2(50)*q2(i)-Gam(50)*q1(i)-Y+C(2),0);
end

figure('Name','Quantities vs Airline Highest Willingness to Pay','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Alp1,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Alp1,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Airline Highest Willingness to Pay');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs Airline Highest Willingness to Pay','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Alp1,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Alp1,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Airline Highest Willingness to Pay');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   X = C(1)+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   Y = C(2)+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   Z = 2*Bet1(50)*Bet2(50)*(2-Del(50));
   q1(i) = max(((Gam(50)*Y - X*Bet2(50)*(2-Del(50)) + Alp1(50)*Bet2(50)*(2-Del(50)) - Gam(50)*Alp2(i))/(Z - Gam(50)^2)),0);
   q2(i) = max((2*Bet1(50)*Alp2(i) - 2*Bet1(50)*Y + X*Gam(50) - Alp1(50)*Gam(50))/(Z - Gam(50)^2),0);
   p1(i) = max(Alp1(50)-Bet1(50)*q1(i)-Gam(50)*q2(i)-X+C(1),0);
   p2(i) = max(Alp2(i)-Bet2(50)*q2(i)-Gam(50)*q1(i)-Y+C(2),0);
end

figure('Name','Quantities vs HSR Highest Willingness to Pay','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Alp2,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Alp2,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Airline Highest Willingness to Pay');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs HSR Highest Willingness to Pay','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Alp2,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Alp2,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Highest Willingness to Pay');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   X = C(1)+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   Y = C(2)+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   Z(i) = 2*Bet1(i)*Bet2(50)*(2-Del(50));
   q1(i) = max(((Gam(50)*Y - X*Bet2(50)*(2-Del(50)) + Alp1(50)*Bet2(50)*(2-Del(50)) - Gam(50)*Alp2(50))/(Z(i) - Gam(50)^2)),0);
   q2(i) = max((2*Bet1(i)*Alp2(50) - 2*Bet1(i)*Y + X*Gam(50) - Alp1(50)*Gam(50))/(Z(i) - Gam(50)^2),0);
   p1(i) = max(Alp1(50)-Bet1(i)*q1(i)-Gam(50)*q2(i)-X+C(1),0);
   p2(i) = max(Alp2(50)-Bet2(50)*q2(i)-Gam(50)*q1(i)-Y+C(2),0);
end

figure('Name','Quantities vs Airline Demand Sensitivity','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Bet1,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Bet1,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Airline Demand Sensitivity');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs Airline Demand Sensitivity','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Bet1,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Bet1,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Airline Demand Sensitivity');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   X = C(1)+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   Y = C(2)+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   Z(i) = 2*Bet1(50)*Bet2(i)*(2-Del(50));
   q1(i) = max(((Gam(50)*Y - X*Bet2(i)*(2-Del(50)) + Alp1(50)*Bet2(i)*(2-Del(50)) - Gam(50)*Alp2(50))/(Z(i) - Gam(50)^2)),0);
   q2(i) = max((2*Bet1(50)*Alp2(50) - 2*Bet1(50)*Y + X*Gam(50) - Alp1(50)*Gam(50))/(Z(i) - Gam(50)^2),0);
   p1(i) = max(Alp1(50)-Bet1(50)*q1(i)-Gam(50)*q2(i)-X+C(1),0);
   p2(i) = max(Alp2(50)-Bet2(i)*q2(i)-Gam(50)*q1(i)-Y+C(2),0);
end

figure('Name','Quantities vs HSR Demand Sensitivity','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Bet2,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Bet2,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Demand Sensitivity');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs HSR Demand Sensitivity','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Bet2,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Bet2,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Demand Sensitivity');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

% Frequency extension %%%%%%%%%%%%%%%%%%%%%%%%%%%%%

AlpAL = 4000 + (1:1:100)*40;
AlpAB = 20000 + (1:1:100)*40;
AlpHL = 1000 + (1:1:100)*20;
AlpHB = 9000 + (1:1:100)*20;
Tau = (1:1:100)*0.01;
GamL = 0.7;
GamB = 0.3;
Kaa = 80;
Ka = 2000;
Kaaa = 3000;
Khh = 30;
Kh = 1000;
Khhh = 1500;
Gamf = 1;
ca=1000;
ch=600;

for i=1:1:100
   Alp1(i) = AlpAL(50) + (AlpAB(50) - AlpAL(50))*Tau(i);
   Alp2(i) = AlpHL(50) + (AlpHB(50) - AlpHL(50))*Tau(i);
   Gam(i) = GamL - (GamL - GamB)*Tau(i);
   X = ca+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   Y = ch+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   A(i) = (Alp1(i)-X+Gamf*(Ka/(2*Kaa)))/(2*Bet1(1));
   B(i) = (Khh*Gam(i)/Bet1(1))*(Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/((2-Del(1))*2*Bet2(1)*Khh-(Gamf^2)*Del(1));
   C(i) = 1-((Gamf^2)/(4*Bet1(1)*Kaa))-(((Gam(i)^2)*Khh)/(Bet1(1)*((2-Del(1))*2*Bet2(1)*Khh-(Gamf^2)*Del(1))));
   D(i) = (Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/(Bet2(1)*(2-Del(1)));
   E(i) = ((Alp1(i)-X+Gamf*(Ka/(2*Kaa)))*2*Gam(i)*Kaa)/(Bet2(1)*(2-Del(1))*(4*Bet1(1)*Kaa-(Gamf^2)));
   F(i) = 1-(((Gamf^2)*Del(1))/((2-Del(1))*2*Bet2(1)*Khh))-(((Gam(i)^2)*Kaa*2)/((2-Del(1))*Bet2(1)*(4*Bet1(1)*Kaa-(Gamf^2))));
   q1(i) = max((A(i)-B(i))/C(i),0);
   q1(i) = min(q1(i),4000);
   q2(i) = max((D(i)-E(i))/F(i),0);
   q2(i) = min(q2(i),1500);
   f1(i) = max((Gamf*q1(i)+Ka)/(2*Kaa),0);
   f1(i) = min(f1(i),q1(i)/200);
   f2(i) = max((Del(1)*Gamf*q2(i)+Kh)/(2*Khh),0);
   f2(i) = min (f2(i),3);
   p1(i) = max(Alp1(i)-Bet1(1)*q1(i)-Gam(i)*q2(i)-X+ca+Gamf*f1(i),0);
   p2(i) = max(Alp2(i)-Bet2(1)*q2(i)-Gam(i)*q1(i)-Y+ch+Gamf*f2(i),0);
   PRO1(i) = (p1(i)-ca)*q1(i) - f1(i)*(f1(i)*Kaa - Ka) - Kaaa;
   PRO2(i) = (p2(i)-ch)*q2(i) - f2(i)*(f2(i)*Khh - Kh) - Khhh;
   U(i) = Alp1(i)*q1(i)+Alp2(i)*q2(i)-0.5*(Bet1(1)*(q1(i)^2)+Bet2(1)*(q2(i)^2)+2*Gam(i)*q1(i)*q2(i));
   Tht1(i) = p1(i)+X-ca-Gamf*f1(i);
   Tht2(i) = p2(i)+Y-ch-Gamf*f2(i);
   SW(i) = U(i) - Tht1(i)*q1(i) - Tht2(i)*q2(i) + PRO1(i) +PRO2(i);
   Zh(i) = Del(1)*SW(i) + (1-Del(1))*PRO2(i);
end

figure('Name','Quantities vs Business Leisure Passenger Distribution for Frequency Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Tau,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Passenger Distribution Tau');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs Business Leisure Passenger Distribution for Frequency Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Tau,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Passenger Distribution Tau');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Frequencies vs Business Leisure Passenger Distribution for Frequency Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Tau,f1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,f2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Passenger Distribution Tau');
h=legend('Airline Frequency f1','HSR Frequency f2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Profits vs Business Leisure Passenger Distribution for Frequency Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Tau,PRO1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,PRO2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Passenger Distribution Tau');
h=legend('Airline Profit PRO1','HSR Profit PRO2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Welfare vs Business Leisure Passenger Distribution for Frequency Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Tau,SW,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,Zh,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Passenger Distribution Tau');
h=legend('Social Welfare SW','HSR Maximization function Zh','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

   Alp1(50) = AlpAL(50) + (AlpAB(50) - AlpAL(50))*Tau(50);
   Alp2(50) = AlpHL(50) + (AlpHB(50) - AlpHL(50))*Tau(50);
   Gam(50) = GamL - (GamL - GamB)*Tau(50);
   X = ca+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   Y = ch+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   A = (Alp1(50)-X+Gamf*(Ka/(2*Kaa)))/(2*Bet1(50));
   
 for i=1:1:100
   B(i) = (Khh*Gam(50)/Bet1(50))*(Alp2(50)-Y+Gamf*(Kh/(2*Khh)))/((2-Del(i))*2*Bet2(50)*Khh-(Gamf^2)*Del(i));
   C(i) = 1-((Gamf^2)/(4*Bet1(50)*Kaa))-(((Gam(50)^2)*Khh)/(Bet1(50)*((2-Del(i))*2*Bet2(50)*Khh-(Gamf^2)*Del(i))));
   D(i) = (Alp2(50)-Y+Gamf*(Kh/(2*Khh)))/(Bet2(50)*(2-Del(i)));
   E(i) = ((Alp1(50)-X+Gamf*(Ka/(2*Kaa)))*2*Gam(50)*Kaa)/(Bet2(50)*(2-Del(i))*(4*Bet1(50)*Kaa-Gamf^2));
   F(i) = 1-(((Gamf^2)*Del(i))/((2-Del(i))*2*Bet2(50)*Khh))-(((Gam(50)^2)*Kaa*2)/((2-Del(i))*Bet2(50)*(4*Bet1(50)*Kaa-(Gamf^2))));
   q1(i) = max((A-B(i))/C(i),0);
   q1(i) = min(q1(i),4000);
   q2(i) = max((D(i)-E(i))/F(i),0);
   q2(i) = min(q2(i),1500);
   f1(i) = max((Gamf*q1(i)+Ka)/(2*Kaa),0);
   f1(i) = min(f1(i),q1(i)/200);
   f2(i) = max((Del(50)*Gamf*q2(i)+Kh)/(2*Khh),0);
   f2(i) = min (f2(i),3);
   p1(i) = max(Alp1(50)-Bet1(50)*q1(i)-Gam(50)*q2(i)-X+ca+Gamf*f1(i),0);
   p2(i) = max(Alp2(50)-Bet2(50)*q2(i)-Gam(50)*q1(i)-Y+ch+Gamf*f2(i),0);
   PRO1(i) = (p1(i)-ca)*q1(i) - f1(i)*(f1(i)*Kaa - Ka) - Kaaa;
   PRO2(i) = (p2(i)-ch)*q2(i) - f2(i)*(f2(i)*Khh - Kh) - Khhh;
   U(i) = Alp1(50)*q1(i)+Alp2(50)*q2(i)-0.5*(Bet1(50)*(q1(i)^2)+Bet2(50)*(q2(i)^2)+2*Gam(50)*q1(i)*q2(i));
   Tht1(i) = p1(i)+X-ca-Gamf*f1(i);
   Tht2(i) = p2(i)+Y-ch-Gamf*f2(i);
   SW(i) = U(i) - Tht1(i)*q1(i) - Tht2(i)*q2(i) + PRO1(i) +PRO2(i);
   Zh(i) = Del(i)*SW(i) + (1-Del(i))*PRO2(i);
end

figure('Name','Quantities vs Government Altruistic Measure for Frequency Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,q1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,q2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Government Altruistic Measure Del');
h=legend('Airline Quantity q1','HSR Quantity q2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs Government Altruistic Measure for Frequency Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,p1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,p2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Government Altruistic Measure Del');
h=legend('Airline Price p1','HSR Price p2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Frequencies vs Government Altruistic Measure for Frequency Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,f1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,f2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Government Altruistic Measure Del');
h=legend('Airline Frequency f1','HSR Frequency f2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Profits vs Government Altruistic Measure for Frequency Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,PRO1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,PRO2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Government Altruistic Measure Del');
h=legend('Airline Profit PRO1','HSR Profit PRO2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Welfare vs Government Altruistic Measure for Frequency Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,SW,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,Zh,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Government Altruistic Measure Delta');
h=legend('Social Welfare SW','HSR Maximization function Zh','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

%%%%HETEROGENOUS PASSENGER TYPE EXTENSION

Gam1 = 0.01:0.01:1; % Substitutability between HSR and leisure class
Gam2 = 0.01:0.01:1; % Substitutability between leisure and business classes on airline
cab = 1200;
cal = 900;
ch = 600;
vab(1) = 2000;
vab(2) = 500;
vab(3) = 1000;
val(1) = v(1);
val(2) = v(2);
val(3) = v(3);
vh(1) = 500;
vh(2) = 125;
vh(3) = 250;
Betal = 1+(0.01:0.01:1);
Betab = 1+(0.01:0.01:1);
Alp2 = 3000+(1:1:100)*70;  %highest willingness to pay for a HSR seat

Xab = cab + vab(1)*tatr(50)+vab(2)*taac(50)+vab(3)*tawt(50);
Xal = cal + val(1)*tatr(50)+val(2)*taac(50)+val(3)*tawt(50);
Xh = ch + vh(1)*thtr(50)+vh(2)*thac(50)+vh(3)*thwt(50);

for i=1:1:100
   Alp1(i) = AlpAL(50) + (AlpAB(50) - AlpAL(50))*Tau(i);
   Alp2(i) = AlpHL(50) + (AlpHB(50) - AlpHL(50))*Tau(i);
   %Gam(i) = GamL - (GamL - GamB)*Tau(i);
   %X = ca+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   %Y = ch+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   %A(i) = (Alp1(i)-X+Gamf*(Ka/(2*Kaa)))/(2*Bet1(50));
   %B(i) = (Khh*Gam(i)/Bet1(50))*(Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/((Del(50)-2)*2*Bet2(50)*Khh-(Gamf^2)*Del(50));
   %C(i) = 1-((Gamf^2)/4*Bet1(50)*Kaa)-(((Gam(i)^2)*Khh)/(Bet1(50)*((Del(50)-2)*2*Bet2(50)*Khh-(Gamf^2)*Del(50))));
   %D(i) = (Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/(Bet2(50)*(Del(50)-2));
   %E(i) = ((Alp1(i)-X+Gamf*(Ka/(2*Kaa)))*2*Gam(i)*Kaa)/(Bet2(50)*(Del(50)-2)*(4*Bet1(50)*Kaa-Gamf^2));
   %F(i) = 1-(((Gamf^2)*Del(50))/((Del(50)-2)*2*Bet2(50)*Khh))-(((Gam(i)^2)*Kaa*2)/((Del(50)-2)*Bet2(50)*(4*Bet1(50)*Kaa-(Gamf^2))));   
   qal(i) = max(((2*Betab(50)-Gam1(50))*(2-Del(50))*Bet2(50)*Alp1(i)-2*Gam2(50)*Betab(50)*Alp2(i)+(2-Del(50))*Gam1(50)*Bet2(50)*Xab+2*Gam2(50)*Betab(50)*Xh-(2-Del(50))*2*Betab(50)*Bet2(50)*Xal)/(4*(2-Del(50))*Betal(50)*Betab(50)*Bet2(50)-(Gam1(50)^2)*Bet2(50)*(2-Del(50))-(Gam2(50)^2)*Betab(50)),0);
   qab(i) = max((Alp1(i) - Gam1(50)*qal(i) - Xab)/(2*Betab(50)),0);                                                                                        %2*Betal(50)*Betab(50)*Xab
   qh(i) = max((Alp2(i) - Gam2(50)*qal(i) - Xh)/((2-Del(50))*Bet2(50)),0);
   %f1(i) = (Gamf*q1(i)+Ka)/(2*Kaa);
   %f2(i) = (Del(50)*Gamf*q2(i)+Kh)/(2*Khh);
   pab(i) = max(Alp1(i)-Betab(50)*qab(i)-Gam1(50)*qal(i)-Xab+cab,0);
   pal(i) = max(Alp1(i)-Betal(50)*qal(i)-Gam1(50)*qab(i)-Gam2(50)*qh(i)-Xal+cal,0);
   pal(i) = min(pal(i),pab(i)-500);
   ph(i) = max(Alp2(i)-Bet2(50)*qh(i)-Gam2(50)*qal(i)-Xh+ch,0);
   PRO1(i) = (pab(i)-cab)*qab(i) + (pal(i)-cal)*qal(i) - Ka;
   PRO2(i) = (ph(i)-ch)*qh(i) - Kh;
   U(i) = AlpAL(50)*qal(i)+AlpAB(50)*qab(i)+Alp2(i)*qh(i)-0.5*(Betal(50)*(qal(i)^2) + Betab(50)*(qab(i)^2) + Bet2(50)*(qh(i)^2)+2*Gam1(50)*qal(i)*qab(i)+2*Gam2(50)*qal(i)*qh(i));
   Thtab(i) = pab(i)+Xab-cab;
   Thtal(i) = pal(i)+Xal-cal;
   Thth(i) = ph(i)+Xh-ch;
   SW(i) = U(i) - Thtab(i)*qab(i) - Thtal(i)*qal(i) - Thth(i)*qh(i) + PRO1(i) + PRO2(i);
   Zh(i) = Del(50)*SW(i) + (1-Del(50))*PRO2(i);
end

figure('Name','Quantities vs Business Leisure Passenger Distribution for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Tau,qal,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,qab,'-.g','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,qh,'b');
xlabel('Business Leisure Passenger Distribution Tau');
h=legend('Airline Leisure Quantity qal','Airline Business Quantity qab','HSR Quantity qh','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs Business Leisure Passenger Distribution for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Tau,pal,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,pab,'-.g','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,ph,'b');
xlabel('Business Leisure Passenger Distribution Tau');
h=legend('Airline Leisure Price pal','Airline Business Price pab','HSR Price ph','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Profits vs Business Leisure Passenger Distribution for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Tau,PRO1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,PRO2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Passenger Distribution Tau');
h=legend('Airline Profit PRO1','HSR Profit PRO2','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'color', 'none');

figure('Name','Welfare vs Business Leisure Passenger Distribution for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Tau,SW,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Tau,Zh,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Passenger Distribution Tau');
h=legend('Social Welfare SW','HSR Maximization function Zh','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   Alp1(50) = AlpAL(50) + (AlpAB(50) - AlpAL(50))*Tau(50);
   Alp2(50) = AlpHL(50) + (AlpHB(50) - AlpHL(50))*Tau(50);
   %Gam(i) = GamL - (GamL - GamB)*Tau(i);
   %X = ca+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   %Y = ch+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   %A(i) = (Alp1(i)-X+Gamf*(Ka/(2*Kaa)))/(2*Bet1(50));
   %B(i) = (Khh*Gam(i)/Bet1(50))*(Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/((Del(50)-2)*2*Bet2(50)*Khh-(Gamf^2)*Del(50));
   %C(i) = 1-((Gamf^2)/4*Bet1(50)*Kaa)-(((Gam(i)^2)*Khh)/(Bet1(50)*((Del(50)-2)*2*Bet2(50)*Khh-(Gamf^2)*Del(50))));
   %D(i) = (Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/(Bet2(50)*(Del(50)-2));
   %E(i) = ((Alp1(i)-X+Gamf*(Ka/(2*Kaa)))*2*Gam(i)*Kaa)/(Bet2(50)*(Del(50)-2)*(4*Bet1(50)*Kaa-Gamf^2));
   %F(i) = 1-(((Gamf^2)*Del(50))/((Del(50)-2)*2*Bet2(50)*Khh))-(((Gam(i)^2)*Kaa*2)/((Del(50)-2)*Bet2(50)*(4*Bet1(50)*Kaa-(Gamf^2))));
   qal(i) = max(((2*Betab(50)-Gam1(i))*(2-Del(50))*Bet2(50)*Alp1(50)-2*Gam2(50)*Betab(50)*Alp2(50)+(2-Del(50))*Gam1(i)*Bet2(50)*Xab+2*Gam2(50)*Betab(50)*Xh-(2-Del(50))*2*Betab(50)*Bet2(50)*Xal)/(4*(2-Del(50))*Betal(50)*Betab(50)*Bet2(50)-(Gam1(i)^2)*Bet2(50)*(2-Del(50))-(Gam2(50)^2)*Betab(50)),0);
   qab(i) = max((Alp1(50) - Gam1(i)*qal(i) - Xab)/(2*Betab(50)),0);
   qh(i) = max((Alp2(50) - Gam2(50)*qal(i) - Xh)/((2-Del(50))*Bet2(50)),0);
   %f1(i) = (Gamf*q1(i)+Ka)/(2*Kaa);
   %f2(i) = (Del(50)*Gamf*q2(i)+Kh)/(2*Khh);
   pab(i) = max(Alp1(50)-Betab(50)*qab(i)-Gam1(i)*qal(i)-Xab+cab,0);
   pal(i) = max(Alp1(50)-Betal(50)*qal(i)-Gam1(i)*qab(i)-Gam2(50)*qh(i)-Xal+cal,0);
   pal(i) = min(pal(i),pab(i)-500);
   ph(i) = max(Alp2(50)-Bet2(50)*qh(i)-Gam2(50)*qal(i)-Xh+ch,0);
   PRO1(i) = (pab(i)-cab)*qab(i) + (pal(i)-cal)*qal(i) - Ka;
   PRO2(i) = (ph(i)-ch)*qh(i) - Kh;
   U(i) = AlpAB(50)*qab(i)+AlpAL(50)*qal(i)+Alp2(50)*qh(i)-0.5*(Betal(50)*(qal(i)^2)+Betab(50)*(qab(i)^2)+Bet2(50)*(qh(i)^2)+2*Gam1(i)*qal(i)*qab(i)+2*Gam2(50)*qal(i)*qh(i));
   Thtab(i) = pab(i)+Xab-cab;
   Thtal(i) = pal(i)+Xal-cal;
   Thth(i) = ph(i)+Xh-ch;
   SW(i) = U(i) - Thtab(i)*qab(i) - Thtal(i)*qal(i) - Thth(i)*qh(i) + PRO1(i) + PRO2(i);
   Zh(i) = Del(50)*SW(i) + (1-Del(50))*PRO2(i);
end

figure('Name','Quantities vs Business Leisure Substitutability for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Gam1,qal,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam1,qab,'-.g','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam1,qh,'b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Substitutability Gam1');
h=legend('Airline Leisure Quantity qal','Airline Business Quantity qab','HSR Quantity qh','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs Business Leisure Substitutability for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Gam1,pal,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam1,pab,'-.g','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam1,ph,'b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Substitutability Gam1');
h=legend('Airline Leisure Price pal','Airline Business Price pab','HSR Price ph','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Profits vs Business Leisure Substitutability for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Gam1,PRO1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam1,PRO2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Substitutability Gam1');
h=legend('Airline Profit PRO1','HSR Profit PRO2','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Welfare vs Business Leisure Substitutability for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Gam1,SW,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam1,PRO2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('Business Leisure Substitutability Gam1');
h=legend('Social Welfare SW','HSR Maximization function Zh','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   Alp1(50) = AlpAL(50) + (AlpAB(50) - AlpAL(50))*Tau(50);
   Alp2(50) = AlpHL(50) + (AlpHB(50) - AlpHL(50))*Tau(50);
   %Gam(i) = GamL - (GamL - GamB)*Tau(i);
   %X = ca+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   %Y = ch+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   %A(i) = (Alp1(i)-X+Gamf*(Ka/(2*Kaa)))/(2*Bet1(50));
   %B(i) = (Khh*Gam(i)/Bet1(50))*(Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/((Del(50)-2)*2*Bet2(50)*Khh-(Gamf^2)*Del(50));
   %C(i) = 1-((Gamf^2)/4*Bet1(50)*Kaa)-(((Gam(i)^2)*Khh)/(Bet1(50)*((Del(50)-2)*2*Bet2(50)*Khh-(Gamf^2)*Del(50))));
   %D(i) = (Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/(Bet2(50)*(Del(50)-2));
   %E(i) = ((Alp1(i)-X+Gamf*(Ka/(2*Kaa)))*2*Gam(i)*Kaa)/(Bet2(50)*(Del(50)-2)*(4*Bet1(50)*Kaa-Gamf^2));
   %F(i) = 1-(((Gamf^2)*Del(50))/((Del(50)-2)*2*Bet2(50)*Khh))-(((Gam(i)^2)*Kaa*2)/((Del(50)-2)*Bet2(50)*(4*Bet1(50)*Kaa-(Gamf^2))));
   qal(i) = max(((2*Betab(50)-Gam1(50))*(2-Del(50))*Bet2(50)*Alp1(50)-2*Gam2(i)*Betab(50)*Alp2(50)+(2-Del(50))*Gam1(50)*Bet2(50)*Xab+2*Gam2(i)*Betab(50)*Xh-(2-Del(50))*2*Betab(50)*Bet2(50)*Xal)/(4*(2-Del(50))*Betal(50)*Betab(50)*Bet2(50)-(Gam1(50)^2)*Bet2(50)*(2-Del(50))-(Gam2(i)^2)*Betab(50)),0);
   qab(i) = max((Alp1(50) - Gam1(50)*qal(i) - Xab)/(2*Betab(50)),0);
   qh(i) = max((Alp2(50) - Gam2(i)*qal(i) - Xh)/((2-Del(50))*Bet2(50)),0);
   %f1(i) = (Gamf*q1(i)+Ka)/(2*Kaa);
   %f2(i) = (Del(50)*Gamf*q2(i)+Kh)/(2*Khh);
   pab(i) = max(Alp1(50)-Betab(50)*qab(i)-Gam1(50)*qal(i)-Xab+cab,0);
   pal(i) = max(Alp1(50)-Betal(50)*qal(i)-Gam1(50)*qab(i)-Gam2(i)*qh(i)-Xal+cal,0);
   pal(i) = min(pal(i),pab(i)-500);
   ph(i) = max(Alp2(50)-Bet2(50)*qh(i)-Gam2(i)*qal(i)-Xh+ch,0);
   PRO1(i) = ((pab(i)-cab)*qab(i) + (pal(i)-cal)*qal(i) - Ka);
   PRO2(i) = ((ph(i)-ch)*qh(i) - Kh);
   U(i) = AlpAL(50)*qal(i)+AlpAB(50)*qab(i)+Alp2(50)*qh(i)-0.5*(Betal(50)*(qal(i)^2)+Betab(50)*(qab(i)^2)+Bet2(50)*(qh(i)^2)+2*Gam1(50)*qal(i)*qab(i)+2*Gam2(i)*qal(i)*qh(i));
   Thtab(i) = pab(i)+Xab-cab;
   Thtal(i) = pal(i)+Xal-cal;
   Thth(i) = ph(i)+Xh-ch;
   SW(i) = U(i) - Thtab(i)*qab(i) - Thtal(i)*qal(i) - Thth(i)*qh(i) + PRO1(i) + PRO2(i);
   Zh(i) = Del(50)*SW(i) + (1-Del(50))*PRO2(i);
end

figure('Name','Quantities vs HSR Leisure Substitutability for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Gam2,qal,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam2,qab,'-.g','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam2,qh,'b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Leisure Substitutability Gam2');
h=legend('Airline Leisure Quantity qal','Airline Business Quantity qab','HSR Quantity qh','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs HSR Leisure Substitutability for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Gam2,pal,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam2,pab,'-.g','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam2,ph,'b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Leisure Substitutability Gam2');
h=legend('Airline Leisure Price pal','Airline Business Price pab','HSR Price ph','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Profits vs HSR Leisure Substitutability for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Gam2,PRO1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam2,PRO2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Leisure Substitutability Gam2');
h=legend('Airline Profit PRO1','HSR Profit PRO2','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Welfares vs HSR Leisure Substitutability for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Gam2,SW,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Gam2,Zh,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Leisure Substitutability Gam2');
h=legend('Social Welfare SW','HSR Maximization function Zh','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   Alp1(50) = AlpAL(50) + (AlpAB(50) - AlpAL(50))*Tau(50);
   Alp2(i) = AlpHL(50) + (AlpHB(50) - AlpHL(50))*Tau(i);
   %Gam(i) = GamL - (GamL - GamB)*Tau(i);
   %X = ca+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   %Y = ch+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   %A(i) = (Alp1(i)-X+Gamf*(Ka/(2*Kaa)))/(2*Bet1(50));
   %B(i) = (Khh*Gam(i)/Bet1(50))*(Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/((Del(50)-2)*2*Bet2(50)*Khh-(Gamf^2)*Del(50));
   %C(i) = 1-((Gamf^2)/4*Bet1(50)*Kaa)-(((Gam(i)^2)*Khh)/(Bet1(50)*((Del(50)-2)*2*Bet2(50)*Khh-(Gamf^2)*Del(50))));
   %D(i) = (Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/(Bet2(50)*(Del(50)-2));
   %E(i) = ((Alp1(i)-X+Gamf*(Ka/(2*Kaa)))*2*Gam(i)*Kaa)/(Bet2(50)*(Del(50)-2)*(4*Bet1(50)*Kaa-Gamf^2));
   %F(i) = 1-(((Gamf^2)*Del(50))/((Del(50)-2)*2*Bet2(50)*Khh))-(((Gam(i)^2)*Kaa*2)/((Del(50)-2)*Bet2(50)*(4*Bet1(50)*Kaa-(Gamf^2))));
   qal(i) = max(((2*Betab(50)-Gam1(50))*(2-Del(50))*Bet2(50)*Alp1(50)-2*Gam2(50)*Betab(50)*Alp2(i)+(2-Del(50))*Gam1(50)*Bet2(50)*Xab+2*Gam2(50)*Betab(50)*Xh-(2-Del(50))*2*Betab(50)*Bet2(50)*Xal)/(4*(2-Del(50))*Betal(50)*Betab(50)*Bet2(50)-(Gam1(50)^2)*Bet2(50)*(2-Del(50))-(Gam2(50)^2)*Betab(50)),0);
   qab(i) = max((Alp1(50) - Gam1(50)*qal(i) - Xab)/(2*Betab(50)),0);
   qh(i) = max((Alp2(i) - Gam2(50)*qal(i) - Xh)/((2-Del(50))*Bet2(50)),0);
   %f1(i) = (Gamf*q1(i)+Ka)/(2*Kaa);
   %f2(i) = (Del(50)*Gamf*q2(i)+Kh)/(2*Khh);
   pab(i) = max(Alp1(50)-Betab(50)*qab(i)-Gam1(50)*qal(i)-Xab+cab,0);
   pal(i) = max(Alp1(50)-Betal(50)*qal(i)-Gam1(50)*qab(i)-Gam2(50)*qh(i)-Xal+cal,0);
   pal(i) = min(pal(i),pab(i)-500);
   ph(i) = max(Alp2(i)-Bet2(50)*qh(i)-Gam2(50)*qal(i)-Xh+ch,0);
   PRO1(i) = (pab(i)-cab)*qab(i) + (pal(i)-cal)*qal(i) - Ka;
   PRO2(i) = (ph(i)-ch)*qh(i) - Kh;
   U(i) = AlpAL(50)*qal(i)+AlpAB(50)*qab(i)+Alp2(i)*q2(i)-0.5*(Betal(50)*(qal(i)^2)+Betab(50)*(qab(i)^2)+Bet2(50)*(qh(i)^2)+2*Gam1(50)*qal(i)*qab(i)+2*Gam2(50)*qal(i)*qh(i));
   Thtab(i) = pab(i)+Xab-cab;
   Thtal(i) = pal(i)+Xal-cal;
   Thth(i) = ph(i)+Xh-ch;
   SW(i) = U(i) - Thtab(i)*qab(i) - Thtal(i)*qal(i) - Thth(i)*qh(i) + PRO1(i) + PRO2(i);
   Zh(i) = Del(50)*SW(i) + (1-Del(50))*PRO2(i);
end

figure('Name','Quantities vs HSR Highest Willingness to Pay for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Alp2,qal,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Alp2,qab,'-.g','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Alp2,qh,'b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Highest Willingness to Pay Alp2');
h=legend('Airline Leisure Quantity qal','Airline Business Quantity qab','HSR Quantity qh','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs HSR Highest Willingness to Pay for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Alp2,pal,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Alp2,pab,'-.g','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Alp2,ph,'b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Highest Willingness to Pay Alp2');
h=legend('Airline Leisure Price pal','Airline Business Price pab','HSR Price ph','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Profits vs HSR Highest Willingness to Pay for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Alp2,PRO1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Alp2,PRO2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Highest Willingness to Pay Alp2');
h=legend('Airline Profit PRO1','HSR Profit PRO2','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Welfare vs HSR Highest Willingness to Pay for Heterogeneous Extension','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Alp2,SW,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Alp2,Zh,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Highest Willingness to Pay Alp2');
h=legend('Social Welfare SW','HSR Maximization function Zh','Location','NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

for i=1:1:100
   Alp1(50) = AlpAL(50) + (AlpAB(50) - AlpAL(50))*Tau(50);
   Alp2(50) = AlpHL(50) + (AlpHB(50) - AlpHL(50))*Tau(50);
   %Gam(i) = GamL - (GamL - GamB)*Tau(i);
   %X = ca+v(1)*tatr(50)+v(2)*taac(50)+v(3)*tawt(50);
   %Y = ch+v(1)*thtr(50)+v(2)*thac(50)+v(3)*thwt(50);
   %A(i) = (Alp1(i)-X+Gamf*(Ka/(2*Kaa)))/(2*Bet1(50));
   %B(i) = (Khh*Gam(i)/Bet1(50))*(Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/((Del(50)-2)*2*Bet2(50)*Khh-(Gamf^2)*Del(50));
   %C(i) = 1-((Gamf^2)/4*Bet1(50)*Kaa)-(((Gam(i)^2)*Khh)/(Bet1(50)*((Del(50)-2)*2*Bet2(50)*Khh-(Gamf^2)*Del(50))));
   %D(i) = (Alp2(i)-Y+Gamf*(Kh/(2*Khh)))/(Bet2(50)*(Del(50)-2));
   %E(i) = ((Alp1(i)-X+Gamf*(Ka/(2*Kaa)))*2*Gam(i)*Kaa)/(Bet2(50)*(Del(50)-2)*(4*Bet1(50)*Kaa-Gamf^2));
   %F(i) = 1-(((Gamf^2)*Del(50))/((Del(50)-2)*2*Bet2(50)*Khh))-(((Gam(i)^2)*Kaa*2)/((Del(50)-2)*Bet2(50)*(4*Bet1(50)*Kaa-(Gamf^2))));
   qal(i) = max(((2*Betab(50)-Gam1(50))*(2-Del(i))*Bet2(50)*Alp1(50)-2*Gam2(50)*Betab(50)*Alp2(50)+(2-Del(i))*Gam1(50)*Bet2(50)*Xab+2*Gam2(50)*Betab(50)*Xh-(2-Del(i))*2*Betab(50)*Bet2(50)*Xal)/(4*(2-Del(i))*Betal(50)*Betab(50)*Bet2(50)-(Gam1(50)^2)*Bet2(50)*(2-Del(i))-(Gam2(50)^2)*Betab(50)),0);
   qab(i) = max((Alp1(50) - Gam1(50)*qal(i) - Xab)/(2*Betab(50)),0);
   qh(i) = max((Alp2(i) - Gam2(50)*qal(i) - Xh)/((2-Del(i))*Bet2(50)),0);
   %f1(i) = (Gamf*q1(i)+Ka)/(2*Kaa);
   %f2(i) = (Del(50)*Gamf*q2(i)+Kh)/(2*Khh);
   pab(i) = max(Alp1(50)-Betab(50)*qab(i)-Gam1(50)*qal(i)-Xab+cab,0);
   pal(i) = max(Alp1(50)-Betal(50)*qal(i)-Gam1(50)*qab(i)-Gam2(50)*qh(i)-Xal+cal,0);
   pal(i) = min(pal(i),pab(i)-500);
   ph(i) = max(Alp2(i)-Bet2(50)*qh(i)-Gam2(50)*qal(i)-Xh+ch,0);
   PRO1(i) = (pab(i)-cab)*qab(i) + (pal(i)-cal)*qal(i) - Ka;
   PRO2(i) = (ph(i)-ch)*qh(i) - Kh;
   U(i) = AlpAL(50)*qal(i)+AlpAB(50)*qab(i)+Alp2(50)*qh(i)-0.5*(Betal(50)*(qal(i)^2)+Betab(50)*(qab(i)^2)+Bet2(50)*(qh(i)^2)+2*Gam1(50)*qal(i)*qab(i)+2*Gam2(50)*qal(i)*qh(i));
   Thtab(i) = pab(i)+Xab-cab;
   Thtal(i) = pal(i)+Xal-cal;
   Thth(i) = ph(i)+Xh-ch;
   SW(i) = U(i) - Thtab(i)*qab(i) - Thtal(i)*qal(i) - Thth(i)*qh(i) + PRO1(i) + PRO2(i);
   Zh(i) = Del(i)*SW(i) + (1-Del(i))*PRO2(i);
end

figure('Name','Quantities vs HSR Government Altruistic Measure Delta','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,qal,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,qab,'-.g','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,qh,'b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Government Altruistic Measure Delta');
h=legend('Airline Leisure Quantity qal','Airline Business Quantity qab','HSR Quantity qh','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Prices vs HSR Government Altruistic Measure Delta','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,pal,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,pab,'-.g','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,ph,'b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Government Altruistic Measure Delta');
h=legend('Airline Leisure Price pal','Airline Business Price pab','HSR Price ph','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Profits vs HSR Government Altruistic Measure Delta','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,PRO1,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,PRO2,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Government Altruistic Measure Delta');
h=legend('Airline Profit PRO1','HSR Profit PRO2','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');

figure('Name','Welfare vs HSR Government Altruistic Measure Delta','NumberTitle','off');
set(gca,'FontSize',fsz,'LineWidth',alw);
plot(Del,SW,'-ro','LineWidth',lw,'MarkerSize',msz);
hold on;
plot(Del,Zh,'-.b','LineWidth',lw,'MarkerSize',msz);
xlabel('HSR Government Altruistic Measure Delta');
h=legend('Social Welfare SW','HSR Maximization function Zh','Location', 'NorthEast');
set(h,'Interpreter','none');
set(h, 'Color', 'none');
