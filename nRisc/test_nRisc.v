`include "nRisc.v"
`include "bancoMem.v"
`include "bancoInstrucoes.v"

module test_nRisc;

reg clock;
wire [7:0] enderecoNrisc;
wire [7:0] dadoNrisc;
wire [7:0] saidaPC;
wire [7:0] saidaBancoMem;
wire [7:0] saidaBancoInst;
wire LerMem;
wire EscreveMem;
integer i;

/* Declaracao do contador de estagios */
reg[22:0] counter;

/*Banco de instruções*/
nRisc nrisc(clock,saidaBancoMem,saidaBancoInst,enderecoNrisc,dadoNrisc,saidaPC,EscreveMem,LerMem); // 8, 6
bancoInstrucoes BancoInstrucoes(clock, saidaPC, saidaBancoInst);
bancoMem Bancomem(clock,enderecoNrisc,dadoNrisc,saidaBancoMem,lerMem,EscreveMem);

  bancoMem bMem(
    clock,
    enderecoNrisc,//Vem do nrisc? -->> Bnco de mempor
    dadoNrisc,//
    saidaBancoMem,
    lerMem,
    EscreveMem
  );

  bancoInstrucoes bInst(
    clock,
    enderecoNrisc,//
    saidaBancoInst
  );

initial begin
    for(i = 0; i <= 10; i = i + 1)
     bInst.memoriaInstrucoes[i] = 0;

    $readmemb("inst.dat", bInst.memoriaInstrucoes, 0, 10);
    
    for(i = 0; i <= 255; i = i + 1)
      bMem.memoria[i] = 0;

    $readmemb("memDados.dat", bMem.memoria, 0,1);

    nrisc.pc.pc = 8'b00000000;

    clock = 0;
end
      
  initial begin
      counter = 1;
      forever begin       
          #1;	
          clock = ~clock;
          counter = counter +1;

          if(counter == 6)begin
            $finish;
          end
               
      $display("Status do processador");
      
      $display("Saidas do banco de Registradores:");
      $display("Registrador 1 banco de registradores: %b, registrador 2 banco de registradores: %b", nrisc.BancoRegs.out1, nrisc.BancoRegs.out2);
      
      $display("Saidas de PC+1:");
      $display("Entrada PC+1: %b, Saida PC+1: %b", nrisc.somador.iPC, nrisc.somador.out);

      $display("Saidas da ULA:");
      $display("Resultado da ULA: %b, Zero da ULA: %b", nrisc.ULAp.out, nrisc.ULAp.Zero);
      
      $display("Controles:");
      $display("Entrada controle: %b, jump:%b LerMem:%b EscreveMem:%b Branch:%b OpULA:%b MemtoREG:%b Defi:%b ULASrc:%b EscreveReg:%b Encerra:%b", nrisc.controle.Istrc, nrisc.controle.Jump, nrisc.controle.LerMem, nrisc.controle.EscreveMem, nrisc.controle.Branch, nrisc.controle.OpULA, nrisc.controle.MemtoREG, nrisc.controle.Defi, nrisc.controle.ULASrc, nrisc.controle.EscreveReg, nrisc.controle.Encerra);

      $display("Resultados Processador:");
      $display("Endereco Instrucao:%b, Dado a ser escrito na memória: %b, Endereco do dado: %b", nrisc.saidaPC, nrisc.dado, nrisc.endereco);

      $display("Resultados Memoria:");
      $display("Dado lido %b", bMem.out);

      $display("Resultado Memoria de Instrucoes:");
      $display("Instrucao %b", bInst.out);

      $display("Clock = %b",clock);
	    $display("Estagio : %d", counter);
	    $display("-------------------------------------------------");
	    #1;
      end
  end  
endmodule