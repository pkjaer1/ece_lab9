module byte_memory(
    input [7:0] data,
    input store, 
    output [7:0] memory
);
    genvar i;
    generate
        for (i = 0; i < 8; i = i + 1) begin : bit_latch
            ed_latch dl (
                .D(data[i]),
                .E(store),
                .Q(memory[i]),
                .NotQ()
            );
        end
    endgenerate
endmodule