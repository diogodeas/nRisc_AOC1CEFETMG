module MUX5 (
  input wire [7:0] iReg,
  input wire [7:0] rMUX4,
  output wire [7:0] out,
  input Jump
);
  reg [7:0] regout;
  
  
  always @(iReg or rMUX4 or Jump)
    begin
        regout = rMUX4;
        if (Jump) begin
            regout = iReg;
        end 
    end
  assign out = regout;
endmodule