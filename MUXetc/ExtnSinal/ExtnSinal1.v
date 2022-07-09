module ExtnSinal1(
    input [2:0] rInst,
    output [7:0] rExtnd
);
    reg [0:7] regout;
    always @(rInst or rExtnd)
    begin
        regout = {{5{rInst[2]}}, rInst[2:0]};
    end
    assign rExtnd = regout;

endmodule

