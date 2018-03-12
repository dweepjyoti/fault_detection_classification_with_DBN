% Here the training nuerons are defined as input and output data for neural
% network. The input neurons are Va, Vb, Vc, Ia, Ib, Ic and output neurons
% are fault classification phases A, B, C, N. 10 samples are taken for
% pretrain the model and the model got from this simulation is used for
% fault detection. The input and output situations are taken from paper: 
% Faults Detection in Power Systems Using Artificial Neural Network - By
% Bashier and Tayeb
% phase_voltages = [Va; Vb; Vc];
% phase_currents = [Ia; Ib; Ic];
% so total number of inputs are 6
% input_neurons = [phase_voltages; phase_currents];
% Output neurons are truth values according to types of faults
% output_neurons = [A; B; C; G];
% Total number of outputs are 4
input_number = 6;
output_number = 4;
hidden_number = 24; % number of hidden nuerons
data_number = 10; % data number is the sample datas for training
input_neuron_matrix = [0.997 0.9991 0.9985 0.9978 0.9988 0.9984;
    0.334 1.194 1.172 3.335 0.981 0.979;
    1.172 0.334 1.194 0.981 3.335 0.979;
    1.194 1.172 0.334 0.981 0.979 3.335;
    0.471 0.650 0.986 5.379 5.379 0.983;
    0.986 0.471 0.650 0.984 5.379 5.379;
    0.471 0.986 0.650 5.379 0.984 5.379;
    0.205 0.205 1.188 7.187 7.855 0.985;
    1.188 0.205 0.205 0.985 7.187 7.855;
    0.205 1.188 0.205 7.187 0.985 7.855];
output_neuron_matrix = [0 0 0 0;
        1 0 0 1;
        0 1 0 1;
        0 0 1 1;
        1 1 0 0;
        0 1 1 0;
        1 0 1 0;
        1 1 0 1;
        0 1 1 1;
        1 0 1 1];
dbn = randDBN([input_number, hidden_number, output_number], 'GBDBN');
dbn = pretrainDBN(dbn, input_neuron_matrix);
dbn = SetLinearMapping(dbn, input_neuron_matrix, output_neuron_matrix);
opts.MaxIter = 100000;
dbn = trainDBN(dbn, input_neuron_matrix, output_neuron_matrix, opts);