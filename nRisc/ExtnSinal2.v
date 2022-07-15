module ExtnSinal2(
    input [3:0] rInst,
    output [7:0] rExtnd
);
    reg [0:7] regout;
    always @(rInst or rExtnd)
    begin
        regout = {{4{rInst[3]}}, rInst[3:0]};
    end
    assign rExtnd = regout;

endmodule

