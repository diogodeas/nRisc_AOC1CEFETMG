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