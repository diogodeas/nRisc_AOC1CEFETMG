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