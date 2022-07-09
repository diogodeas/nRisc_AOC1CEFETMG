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
  valorescrito,
  valorlido  
);

