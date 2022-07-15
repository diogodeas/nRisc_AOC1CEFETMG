module bancoInstrucoes (
  input wire clock,
  input wire [7:0] endereco,
  output wire [7:0] out
);
 
  reg [7:0] memoriaInstrucoes [10:0];
  reg[7:0] memoriaPC;

  always @(posedge clock)
    begin
        memoriaPC = memoriaInstrucoes[endereco];
    end
  assign out = memoriaPC;
 
  /*reg [7:0] memoriaInstrucoes;

  initial begin
    memoriaInstrucoes[0] = 8'b00010001;
    memoriaInstrucoes[1] = 8'b00010001;
    memoriaInstrucoes[2] = 8'b01110010;
    memoriaInstrucoes[3] = 8'b00010001;
    memoriaInstrucoes[4] = 8'b00101101;
    memoriaInstrucoes[5] = 8'b01010010;
    memoriaInstrucoes[6] = 8'b10010000;
    memoriaInstrucoes[7] = 8'b01110010;
    memoriaInstrucoes[8] = 8'b10100001;
    memoriaInstrucoes[9] = 8'b11000011;
    memoriaInstrucoes[10] = 8'b11100000;
  end

  assign out = memoriaInstrucoes[endereco];*/

endmodule