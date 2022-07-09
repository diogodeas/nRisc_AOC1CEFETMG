module test_controle;
    reg [7:0] Istrc;
    wire Jump;
    wire LerMem;
    wire EscreveMem;
    wire Branch;
    wire OpULA;
    wire MemtoREG;
    wire Defi;
    wire ULASrc;
    wire EscreveReg;
    wire Encerra;
    initial begin
        #1 Istrc = 8'b00010001;
        
        #1 Istrc = 8'b00101101; 
        
        #1 Istrc = 8'b01110010; 
    end
    initial begin
        $monitor("Time=%0d, instrução: %b,\n jump: %b,  lerMem: %b, EscreveMem: %b,\n branch: %b, opULA: %b, memtoreg: %b,\n defi: %b, ULASrc: %b, escreveReg: %b,\n Encerra: %b",
                $time, Istrc, Jump, LerMem, EscreveMem, Branch, OpULA, MemtoREG, Defi, ULASrc, EscreveReg, Encerra);
    end
    Controle gate1(Istrc, Jump, LerMem, EscreveMem, Branch, OpULA, MemtoREG, Defi, ULASrc, EscreveReg, Encerra);
endmodule