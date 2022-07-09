module bancoRegs (
  input wire clock,
  input wire [1:0] in1,
  input wire [1:0] in2,
  input wire inec,
  input wire [7:0] dado,
  output wire [7:0] out1,
  output wire [7:0] out2,
  input EscreveReg
);
  reg [7:0] regs [1:0];
  reg [7:0] valores [1:0];
  
  always @(posedge clock) 
    begin
      if(EscreveReg) begin
        regs[inec] = dado;
      end
   end
   
   always @(negedge clock)
      begin
        valores [0] = regs [in1];
        valores [1] = regs [in2];
      end
  
    assign out1 = valores [0];
    assign out2 = valores [1];

endmodule