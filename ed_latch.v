module ed_latch(
    input E,
    input D,
    output reg Q,
    output NotQ
);

    always @(E, D) begin 
        if (E)
            if (D)
                Q <= 1; 
            else
                Q <= 0;
    end

    assign NotQ = ~Q; 

endmodule