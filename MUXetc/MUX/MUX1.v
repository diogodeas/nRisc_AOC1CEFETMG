module MUX1 (
  input wire [7:0] dReg,
  input wire [7:0] extd,
  output wire [7:0] out,
  input ULASrc
);
  reg [7:0] regout;
  
  
  always @(dReg or extd or ULASrc)
    begin
        regout = extd;
        if (ULASrc) begin
            regout = dReg;
        end 
    end
  assign out = regout;
endmodule