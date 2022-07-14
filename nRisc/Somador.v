module Somador (
    input wire [7:0] iPC,
    output wire [7:0] out
);
    
    reg [7:0] pc1;
    
    always@(iPC)begin
        pc1 = iPC + 8'b00000001;
    end
  
    assign out = pc1;

endmodule