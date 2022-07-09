module test_PC;
  reg clock;
  reg [7:0] in; 
  reg Encerra; 
  wire [7:0] out;
  initial begin
  clock = 0; in = 0; Encerra=0;
   
   #1 clock = 1;
   in = 1;
   Encerra = 0;
   
   #1 clock = 0;
   #1 clock = 1;
   in = 0;
   Encerra = 0;
   
   #1 clock = 0;
   #1 clock = 1;
   in = 1;
   Encerra = 1;
   
  end
  initial begin
  $monitor("Time=%0d clock %d entrada %d saida %d encerra %d",
  $time, clock, in, out, Encerra);
  end
  PC gate1(clock, in, out, Encerra);
endmodule