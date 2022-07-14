`include "bancoInstrucoes.v"
`include "bancoMem.v"
`include "bancoRegs.v"
`include "Controle.v"
`include "MUX1.v"
`include "MUX2.v"
`include "MUX3.v"
`include "MUX4.v"
`include "MUX5.v"
`include "nRisc.v"
`include "pAND.v"
`include "PC.v"
`include "Somador.v"
`include "ULA.v"
`include "ULA2.v"

module nRisc (
  CLK,
  EscreveMem,
  endereço,
  dado,
  saidaDadoMem,
  saidaInstruction  
);

  wire [7:0] entradaPC;
  wire [7:0] saidaPC;

  PC pC(
      clock, //entradas do módulo
      PCin,
      Encerra, // sinal de controle
      PCout //saída do módulo
  );

  wire [7:0] saidaBancInst;

  bancoInstrucoes BancoInstrucoes(
    clock, //entradas do módulo
    saidaPC, 
    saidaBancInst //saída do módulo
  );

  wire [7:0] saidaSomador;

  Somador somador(
    saidaPC, //entrada do módulo
    saidaSomador //saída do módulo
  );

  wire registrador2 = saidaBancInst[3];
  wire registrador1 = saidaBancInst[4];
  wire [7:0] saidaMUX2;
  wire [7:0] saidabancoRegs1;
  wire [7:0] saidabancoRegs2;

  bancoRegs BancoRegs(
    clock, //entradas do módulo
    registrador1,
    registrador2,
    registrador1,
    saidaMUX2,
    EscreveReg, //sinal de controle
    saidabancoRegs1, //saidas do módulo
    saidabancoRegs2

  );

  wire 




endmodule;

