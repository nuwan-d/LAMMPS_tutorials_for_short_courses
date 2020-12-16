%% Nuwan Dewapriya
%% 2020/12/12
%% This code extracts data from the LAMMPS output file stress-strain.dump and plot the stress-strain curve.

clear all
close all
clc

%% Extracting stress-strain data from the log.lammps file

[fid] = fopen('stress-srain.txt');

headings = fscanf(fid,'%s ',7);

[Stress,count] = fscanf(fid, '%f %f %f %f',[4,inf]);    

Stress = Stress'; %

%% Plotting

figure
plot(Stress(:,1), Stress(:,2),'-or','MarkerSize',2)
hold on
plot(Stress(:,1), Stress(:,3),'-ob','MarkerSize',2)
hold on
plot(Stress(:,1), Stress(:,4),'-og','MarkerSize',2)
xlabel('Strain','fontsize',12)
ylabel('Stress (GPa)','fontsize',12)
grid on
set(gca,'LineWidth',1,'Fontsize',12)
axis square
%axis([0 0.3 0 120])
legend({ '\sigma_{xx}', '\sigma_{yy}', '\sigma_{zz}'},'Location','northwest','FontSize',14) 
legend boxoff