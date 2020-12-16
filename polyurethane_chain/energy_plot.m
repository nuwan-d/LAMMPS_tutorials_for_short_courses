%% Nuwan Dewapriya
%% 2020/12/16
%% This code extracts data from the LAMMPS output file energy.dump and plot the time-energy curve.

clear all
close all
clc

%% Extracting stress-strain data from the log.lammps file

[fid] = fopen('energy.dump');

headings = fscanf(fid,'%s ',7);

[Energy,count] = fscanf(fid, '%f %f',[2,inf]);%% etract only Step and E_pair     

Energy = Energy'; %

%% Plotting

figure
plot(Energy(:,1), Energy(:,2),'-or','MarkerSize',2)
xlabel('Time (ps)','fontsize',12)
ylabel('Energy (kcal/mol)','fontsize',12)
grid on
set(gca,'LineWidth',1,'Fontsize',12)
axis square
%axis([0 0.3 0 120])