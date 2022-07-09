module test_bancoInstrucoes;
  reg clock;
  reg [7:0] in; 
  wire [7:0] out;
  initial begin
  clock = 0; in = 0;
   
   #1 clock = 1;
   in = 1;
   
   #1 clock = 0;
   #1 clock = 1;
   in = 0;
   
  end
  initial begin
  $monitor("Time=%0d clock %d entrada %d saida %b",
  $time, clock, in, out);
  end
  bancoInstrucoes gate1(clock, in, out);
endmodule
