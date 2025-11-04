function main()
    data = readtable("bottle_data.csv")

    % mass of empty botle 198g
    % opening of bottle 19mm
    % neck length 80mm
    bottleMass = 198; % mass of empty bottle in grams
    bottleFullMass = 576 % through the neck in grams
    openingDiameter = 19; % opening diameter in mm
    neckLength = 80; % neck length in mm

    %pull the lists of masses and frequencies out of
    %data_mat, so each can manipulated independently
    total_mass_list = data.Mass ./1000 % convert to kg
    freq_list = data.Frequency % already in rad/s

    water_density = 0.994078 / 1000%kg/cm^3
    air_density = 1.205 %kg/m^3
    gamma_air = 1.402 %unitless
    P0 = 29.88 %inHg
    neck_diameter = 0.019 %m
    neck_length = 0.08 %m
    empty_bottle_mass = .2 %kg
    filled_bottle_mass = .576 %kg

    area_cx = pi * (neck_diameter / 2)^2 %m^2
    neck_volume = area_cx * neck_length %m^3
    neck_air_mass = air_density * neck_volume %kg
    bottle_volume = (bottleFullMass - bottleMass) * (1/1000000)
    empty_cavity_volume = bottle_volume - neck_volume
    

    
