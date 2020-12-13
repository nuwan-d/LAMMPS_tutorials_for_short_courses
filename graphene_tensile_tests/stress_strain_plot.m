%% Nuwan Dewapriya
%% 2020/12/12
%% This code extracts data from the LAMMPS output file stress-strain.dump and plot the stress-strain curve.

clear all
close all
clc

%% Extracting stress-strain data from the log.lammps file

[fid] = fopen('stress-strain.dump');

headings = fscanf(fid,'%s ',7);

[Stress,count] = fscanf(fid, '%f %f %f',[3,inf]);    

Stress = Stress'; %

%% Plotting

figure
plot(Stress(:,1), Stress(:,2),'-or','MarkerSize',2)
hold on
plot(Stress(:,1), Stress(:,3),'-ob','MarkerSize',2)
xlabel('Strain','fontsize',12)
ylabel('Stress (GPa)','fontsize',12)
grid on
set(gca,'LineWidth',1,'Fontsize',12)
axis square
axis([0 0.3 0 120])
legend({ '\sigma_{yy}', '\sigma_{xx}'},'Location','northwest','FontSize',14) 
legend boxoff