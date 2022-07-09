module ULA2 (
    input wire [7:0] iPC,
    input wire [7:0] bInst,
    output wire [7:0] out
    );
    
    reg [7:0] ula2;
    
    always@(iPC or bInst)begin
        ula2 = iPC + bInst;
    end
  
    assign out = ula2;

endmodule