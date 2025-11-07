function main()
    data = readtable("bottle_data.csv")

    % mass of empty botle 198g
    % opening of bottle 19mm
    % neck length 80mm
    bottleMass = .2; % mass of empty bottle in kg
    bottleFullMass = .576; % through the neck in kg
    openingDiameter = .019; % opening diameter in m
    neckLength = .080; % neck length in m

    %pull the lists of masses and frequencies out of
    %data_mat, so each can manipulated independently
    total_mass_list = data.Mass ./1000; % convert to kg
    freq_list = data.Frequency; % already in rad/s

    water_density = 1000; %kg/m^3
    air_density = 1.205; %kg/m^3
    gamma_air = 1.402; %unitless
    P0 = 29.88 %inHg
    neck_diameter = 0.019; %m
    neck_length = 0.08; %m
    empty_bottle_mass = .2; %kg
    filled_bottle_mass = .576; %kg

    area_cx = pi * (neck_diameter / 2)^2; %m^2
    neck_volume = area_cx * neck_length; %m^3
    neck_air_mass = air_density * neck_volume; %kg
    bottle_volume =  (bottleFullMass - bottleMass)/water_density; %m^3
    empty_cavity_volume = bottle_volume - neck_volume; %m^3

    water_mass_list = total_mass_list - bottleMass; %kg
    water_volume_list = water_mass_list ./ water_density; %m^3

    air_volume_list = bottle_volume - water_volume_list; %m^3

    max_volume = max(air_volume_list);
    max_freq = max(freq_list);
    figure(1);
    hold on;
    axis([0,1.1*max_volume,0,1.1*max_freq]);
    plot(air_volume_list,freq_list,'ro','markerfacecolor','r');
    %remember to include axis labels and a title!!!
    xlabel('Air Volume (m^3)');
    ylabel('Sounds Frequency (rad/s)');
    title('Air Volume by Sound Frequency for Helmholtz Resonator');


    n_points = length(freq_list);
    V0_list = linspace(empty_cavity_volume/100, empty_cavity_volume, n_points);

    predicted_k_list = (gamma_air * area_cx * P0) ./ V0_list;
    predicted_wn_list = sqrt(predicted_k_list / neck_air_mass);
    predicted_total_volume = V0_list + neck_volume;

    %plot the predicted values on the same axes as the measured values
    plot(predicted_total_volume,predicted_wn_list,'b','linewidth',2);
    %please include a legend!
    mylegend = legend('Calculated','Predicted');
    
    

    
