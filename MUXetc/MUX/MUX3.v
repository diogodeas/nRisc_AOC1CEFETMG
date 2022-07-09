module MUX3 (
  input wire [7:0] imdt,
  input wire [7:0] rMUX2,
  output wire [7:0] out,
  input Defi
);
  reg [7:0] regout;
  
  
  always @(imdt or rMUX2 or Defi)
    begin
        regout = imdt;
        if (Defi) begin
            regout = rMUX2;
        end 
    end
  assign out = regout;
endmodule