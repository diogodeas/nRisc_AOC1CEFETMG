`include "ExtnSinal1.v"
`include "ExtnSinal2.v"
`include "ExtnSinal3.v"
`include "bancoRegs.v"
`include "Controle.v"
`include "MUX1.v"
`include "MUX2.v"
`include "MUX3.v"
`include "MUX4.v"
`include "MUX5.v"
`include "pAND.v"
`include "PC.v"
`include "Somador.v"
`include "ULA.v"
`include "ULA2.v"


module nRisc(
  //Conferir
  input clock,
  input [7:0] saidaDadoMem,
  input [7:0] saidaInstruction,
  output [7:0] endereco,
  output [7:0] dado,
  output [7:0] PC_inst,
  output ESCREVEmem,
  output LEmem  
);

  wire [7:0] dadoMem = saidaDadoMem[7:0];
  wire [7:0] instrucao = saidaInstruction[7:0];  

  wire [7:0] entradaPC;
  wire [7:0] saidaPC;

  PC pc(
      clock, //entradas do módulo
      entradaPC, 
      saidaPC, //saída do módulo
      Encerra // sinal de controle
  );

  wire [7:0] saidaSomador;

  Somador somador(
    saidaPC, //entrada do módulo
    saidaSomador //saída do módulo
  );

  wire registrador2 = instrucao[3];
  wire registrador1 = instrucao[4];
  wire [7:0] saidaMUX3;
  wire [7:0] saidabancoRegs1;
  wire [7:0] saidabancoRegs2;

  bancoRegs BancoRegs(
    clock, //entradas do módulo
    registrador1,
    registrador2,
    registrador1,
    saidaMUX3, //Criar MUX3 
    saidabancoRegs1, //saidas do módulo
    saidabancoRegs2,
    EscreveReg //sinal de controle
  );

  wire [2:0] entradaControle = instrucao[7:5]; //Saída banco de instruções
  wire Jump;                                 //Saídas Controle
  wire LerMem;
  wire EscreveMem;
  wire Branch;
  wire OpULA;
  wire MemtoReg;
  wire Defi;
  wire ULASrc;
  wire EscreveReg;
  wire Encerra;
  
  Controle controle (
    entradaControle,//entradas do modulo  
    Jump, //saidas do modulo
    LerMem,
    EscreveMem,
    Branch,
    OpULA,
    MemtoREG,
    Defi,
    ULASrc,
    EscreveReg,
    Encerra
  );

  wire [2:0] entradaExtnSinal1 = instrucao[2:0];
  wire [7:0] saidaExtnSinal1;

  ExtnSinal1 extnSinal1 (
    entradaExtnSinal1, //entradas do modulo
    saidaExtnSinal1 //saidas do modulo
  );

  wire [7:0] saidaULA2;

  ULA2 ula2(
    saidaSomador, //entradas do modulo
    saidaExtnSinal1,
    saidaULA2 //saida do modulo
  );

  wire zeroULA;
  wire saidaPAND;
  
  pAND pand(
    zeroULA,
    saidaPAND,
    Branch
  );

  wire [7:0] saidaMUX4;

  MUX4 mux4(
    saidaSomador, //entradas do modulo
    saidaULA2,
    saidaMUX4,     //saida MUX4
    saidaPAND
  );

  wire [3:0] entradaExtnSinal2 = instrucao[3:0];
  wire [7:0] saidaExtnSinal2;

  ExtnSinal2 extnSinal2(
    entradaExtnSinal2,
    saidaExtnSinal2
  );
  
  wire [4:0] entradaExtnSinal3 = instrucao[4:0];
  wire [7:0] saidaExtnSinal3;
  
  ExtnSinal3 extnSinal3(
    entradaExtnSinal3,
    saidaExtnSinal3
  );

  output wire [7:0] saidaMux5;

  MUX5 mux5(
    saidaExtnSinal3,
    saidaMUX4,
    saidaMux5,
    Jump
  );

  wire [7:0] saidaMux1;

  MUX1 mux1(
    saidabancoRegs2,
    saidaExtnSinal2,
    saidaMux1,
    ULASrc
  );
  
  wire [7:0] resultadoULAp;
  
  ULA ULAp(
    saidabancoRegs1,
    saidaMux1,
    zeroULA,
    resultadoULAp,
    OpULA
  );
  
  wire [7:0] saidaMUX2;
  MUX2 mux2(
    dadoMem,
    resultadoULAp,
    saidaMUX2,
    MemtoReg
  );

  assign endereco = saidaExtnSinal2;
  assign dado = saidabancoRegs1;
  assign PC_inst = saidaPC;
  assign ESCREVEmem = EscreveMem;
  assign LEmem = LerMem;

endmodule

