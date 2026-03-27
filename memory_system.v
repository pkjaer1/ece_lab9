module memory_system(
    input [7:0] data,
    input store,
    input [1:0] addr,
    output [7:0] memory
);
    wire [7:0] mem_out[3:0];
    wire [7:0] data_dm[3:0];
    wire store_dm[3:0];      

    assign store_dm[0] = (addr == 2'b00) ? store : 1'b0;
    assign store_dm[1] = (addr == 2'b01) ? store : 1'b0;
    assign store_dm[2] = (addr == 2'b10) ? store : 1'b0;
    assign store_dm[3] = (addr == 2'b11) ? store : 1'b0;

    assign data_dm[0] = (addr == 2'b00) ? data : 8'b0;
    assign data_dm[1] = (addr == 2'b01) ? data : 8'b0;
    assign data_dm[2] = (addr == 2'b10) ? data : 8'b0;
    assign data_dm[3] = (addr == 2'b11) ? data : 8'b0;

    byte_memory bm0 (.data(data_dm[0]), .store(store_dm[0]), .memory(mem_out[0]));
    byte_memory bm1 (.data(data_dm[1]), .store(store_dm[1]), .memory(mem_out[1]));
    byte_memory bm2 (.data(data_dm[2]), .store(store_dm[2]), .memory(mem_out[2]));
    byte_memory bm3 (.data(data_dm[3]), .store(store_dm[3]), .memory(mem_out[3]));

    assign memory = (addr == 2'b00) ? mem_out[0] :
                    (addr == 2'b01) ? mem_out[1] :
                    (addr == 2'b10) ? mem_out[2] : 
                    mem_out[3];
endmodule