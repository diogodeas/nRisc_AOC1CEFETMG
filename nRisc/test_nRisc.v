`include "nRisc.v"
`include "bancoMem.v"
`include "bancoInstrucoes.v"

module test_nRisc;

reg clock;
wire LerMem;
wire EscreveMem;
wire [7:0] enderecoFromNrisc;
wire [7:0] saidaInstrucaoFromBancoInstrucoes;
wire [7:0] endEscreveMemFromNrisc;
wire [7:0] dadoFromNrisc;
wire [7:0] saidaDadoFromBancoMem;
integer i;

  

/* Declaracao do contador de estagios */
reg[15:0] counter;

/*Banco de instruções*/
nRisc nrisc(clock,saidaDadoFromBancoMem,saidaInstrucaoFromBancoInstrucoes,endEscreveMemFromNrisc,dadoFromNrisc,enderecoFromNrisc,EscreveMem,LerMem); // 8, 6
bancoInstrucoes BancoInstrucoes(clock, enderecoFromNrisc, saidaInstrucaoFromBancoInstrucoes);
bancoMem Bancomem(clock,endEscreveMemFromNrisc,dadoFromNrisc,saidaDadoFromBancoMem,lerMem,EscreveMem);

  bancoMem bMem(
    clock,
    enderecoFromNrisc,//Vem do nrisc? -->> Bnco de mempor
    dadoFromNrisc,//
    saidaDadoFromBancoMem,
    ESCREVEmem,
    LEmem
  );

  bancoInstrucoes bInst(
    clock,
    enderecoFromNrisc,//
    saidaInstrucaoFromBancoInstrucoes
  );

initial begin
  
    for(i = 0; i <= 11; i = i + 1)
     BancoInstrucoes.memoriaInstrucoes[i] = 0;

    $readmemb("/inst.dat", BancoInstrucoes.memoriaInstrucoes, 0, 11);
    
    for(i = 0; i <= 255; i = i + 1)
      Bancomem.memoria[i] = 0;

    $readmemb("/memDados.dat", Bancomem.memoria, 0,10);

    clock = 0;
end
      
  initial begin
      counter = 1;
      forever begin       
          #1;	
          clock = ~clock;
          counter = counter +1;

          if(counter == 11)begin
            $finish;
        end
               
      $display("Status do processador");
      
      $display("Saidas do banco de Registradores:");
      $display("Registrador 1 banco de registradores: %b, registrador 2 banco de registradores: %b", nrisc.BancoRegs.out1, nrisc.BancoRegs.out2);
      
      $display("Saidas de PC+1:");
      $display("Entrada PC+1: %b, Saida PC+1: %b", nrisc.somador.iPC, nrisc.somador.out);
      
      $display("Controles:");
      $display("Entrada controle: %b, jump:%b LerMem:%b EscreveMem:%b Branch:%b OpULA:%b MemtoREG:%b Defi:%b ULASrc:%b EscreveReg:%b Encerra:%b", nrisc.controle.Istrc, nrisc.controle.Jump, nrisc.controle.LerMem, nrisc.controle.EscreveMem, nrisc.controle.Branch, nrisc.controle.OpULA, nrisc.controle.MemtoREG, nrisc.controle.Defi, nrisc.controle.ULASrc, nrisc.controle.EscreveReg, nrisc.controle.Encerra);

      $display("Resultados:");
      $display("Dado a ser escrito na memória: %b", nrisc.dado);
    end
  end  
endmodule