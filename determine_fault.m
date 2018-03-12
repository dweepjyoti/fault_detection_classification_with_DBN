function fault_map = determine_fault(v_abc, i_abc, dbn)
input = [v_abc, i_abc];
estimate = v2h(dbn, input);
fault_map = generate_fault_similarity(estimate);