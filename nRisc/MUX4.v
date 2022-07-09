module MUX4 (
  input wire [7:0] PC1,
  input wire [7:0] rULA2,
  output wire [7:0] out,
  input wire pAND
);
  reg [7:0] regout;
  
  
  always @(PC1 or rULA2 or pAND)
    begin
        regout = PC1;
        if (pAND) begin
            regout = rULA2;
        end 
    end
  assign out = regout;
endmodule