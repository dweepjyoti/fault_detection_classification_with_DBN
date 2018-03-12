function fault_map = generate_fault_similarity(estimate)
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
    fault_class = 1:10;
    output_mat_size = size(output_neuron_matrix);
    class_num = output_mat_size(1,1);
    for i = 1:class_num
        fault_similarity(i).fault_class = fault_class(i);
        fault_similarity(i).similarity_index = 1 - (abs(output_neuron_matrix(i,1)-estimate(1)) + abs(output_neuron_matrix(i,2)-estimate(2)) + abs(output_neuron_matrix(i,3)-estimate(3)) + abs(output_neuron_matrix(i,4)-estimate(4)))/4 ;
    end
    fault_map = fault_similarity;
end

     
    