module PC (
  input wire clock,
  input wire [7:0] in,
  output wire [7:0] out,
  input Encerra
);
  
  reg [7:0] pc;
  
  always @(posedge clock)
    begin
    if(~Encerra) begin 
      pc = in;
    end
  end
  
  assign out = pc;

endmodule

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

module bancoInstrucoes (
  input wire clock,
  input wire [7:0] in,
  output wire [7:0] out
);
 
  reg [7:0] banco_instrucoes;
  
  always @(posedge clock)
    begin
      case (in)
      8'b00000000: banco_instrucoes = 8'b00010001; 
      8'b00000001: banco_instrucoes = 8'b00101101;       
      8'b00000010: banco_instrucoes = 8'b01110010;
      8'b00000011: banco_instrucoes = 8'b01010010;
      8'b00000100: banco_instrucoes = 8'b10010000;
      8'b00000101: banco_instrucoes = 8'b10100001;
      8'b00000110: banco_instrucoes = 8'b11000011;
    	 8'b00000111: banco_instrucoes = 8'b11100000;
      default: banco_instrucoes = 8'bxxxxxxxx;
      endcase 
    end
  assign out = banco_instrucoes;
endmodule

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

module bancoMem(
input wire clock,
  input wire [7:0] endereco,
  input wire [7:0] dado,
  output wire [7:0] out,
  input lerMem,
  input EscreverMem
);

  reg[7:0] memoria [255:0];
  reg[7:0] lido;
  
  always @(posedge clock)
    begin
      if(EscreverMem) begin
        memoria[endereco] = dado;
      end
  end
  
  always @(negedge clock)
    begin
      if(lerMem) begin
      lido = memoria[endereco];
      end
   end
   
    assign out = lido;
endmodule

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
  