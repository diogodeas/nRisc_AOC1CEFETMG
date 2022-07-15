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

endmodule