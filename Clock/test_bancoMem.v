module test_bancoMem;
  reg clock;
  reg [7:0] endereco;
  reg [7:0] dado;
  reg lerMem, EscreverMem;
  wire [7:0] out;
  initial begin
  clock = 0; endereco = 0; dado = 0; lerMem = 0; EscreverMem = 0;
   
   #1 clock = 1;
   endereco = 1;
   dado = 1;
   EscreverMem = 1;
   lerMem = 0;
   
   #1 clock = 0; 
   #1 clock = 1;
   endereco = 1;
   dado = 1;
   EscreverMem = 0;
   lerMem = 1;
   
   #1 clock = 0;
   
  end
  initial begin
  $monitor("Time=%0d clock %d endereco %d dado %d EscreveMem %d, lerMem %d, out %d",
  $time, clock, endereco, dado, EscreverMem, lerMem, out);
  end
  bancoMem gate1(clock, endereco, dado, out, lerMem, EscreverMem);
endmodule