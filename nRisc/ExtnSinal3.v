module ExtnSinal3(
    input [4:0] rInst,
    output [7:0] rExtnd
);
    reg [0:7] regout;
    always @(rInst or rExtnd)
    begin
        regout = {{3{rInst[4]}}, rInst[4:0]};
    end
    assign rExtnd = regout;

endmodule
