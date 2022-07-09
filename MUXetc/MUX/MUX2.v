module MUX2 (
  input wire [7:0] dRead,
  input wire [7:0] rULA,
  output wire [7:0] out,
  input MemtoREG
);
  reg [7:0] regout;
  
  always @(dRead or rULA or MemtoREG)
    begin
        regout = rULA;
        if (MemtoREG) begin
            regout = dRead;
        end 
    end
  assign out = regout;
endmodule
