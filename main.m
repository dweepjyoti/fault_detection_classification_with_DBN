% This is the main file for whole project. The first starting of the work
% consist of training the DBN and then simulate the simulation block and
% get the input parameters for the nueral network like 3 phase voltages and
% currents to check which fault has occur according to the classes defined
% earlier. The code will generate fault similarity struct values. The
% maxiimum similarity means the probablity the fault occued for that class
% is maximum.
clear all;
clc;
% Intialiazing the neural net for prediction
train_data; % In train_data.m file you can deffine the inputs for training, input neuron size, output neuron size, hidden layer neurons and other parameters for training the neural net
% Simulate the model
sim('TransmissionLineFault')  % here the model of plant is there Note: per unit value of the voltages and currents are passed for detection of fault
% final output is saved as fault_class struct where the faults are indexed
% from no-fault to A-C-G as given in the paper from 1 to 10 with its
% decimal value of similarity to which category it lies.( maximum one is the
% answer for fault)
fault_class  = determine_fault(V_abc.data, I_abc.data, dbn)