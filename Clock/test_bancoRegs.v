module test_bancoRegs;
  reg clock;
  reg [1:0] in1;
  reg [1:0] in2;
  reg inec;
  reg [7:0] dado;
  reg EscreveReg;
  wire [7:0] out1;
  wire [7:0] out2;
  initial begin
  clock = 0; in1 = 0; in2=0; inec=0; dado=0; EscreveReg = 0;
   
   #1 clock = 1;
   in1 = 0;
   in2 = 1;
   inec = 1;
   dado = 0; 
   EscreveReg = 1;
   
   #1 clock = 0;
   #1 clock = 1;
   in1 = 0;
   in2 = 1;
   inec = 0;
   dado = 1;
   EscreveReg = 1; 
   
   #1 clock = 0;
      
  end
  initial begin
  $monitor("Time=%0d clock %d entrada1 %d entrada2 %d regs escrito %d dado %d EscreveReg %d, out1 %d, out2 %d",
  $time, clock, in1, in2, inec, dado, EscreveReg, out1, out2);
  end
  bancoRegs gate1(clock, in1, in2, inec, dado, out1, out2, EscreveReg);
endmodule