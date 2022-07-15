module test_controle;
    reg [7:5] Istrc;
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
        #1 Istrc = 3'b000;
        
        #1 Istrc = 3'b001; 
        
        #1 Istrc = 3'b011; 

        #1 Istrc = 3'b010;

        #1 Istrc = 3'b100;

        #1 Istrc = 3'b011;

        #1 Istrc = 3'b101;

        #1 Istrc = 3'b110;

        #1 Istrc = 3'b111;
    end
    initial begin
        $monitor("Time=%0d, instrução: %b,\n jump: %b,  lerMem: %b, EscreveMem: %b,\n branch: %b, opULA: %b, memtoreg: %b,\n defi: %b, ULASrc: %b, escreveReg: %b,\n Encerra: %b",
                $time, Istrc, Jump, LerMem, EscreveMem, Branch, OpULA, MemtoREG, Defi, ULASrc, EscreveReg, Encerra);
    end
    Controle gate1(Istrc, Jump, LerMem, EscreveMem, Branch, OpULA, MemtoREG, Defi, ULASrc, EscreveReg, Encerra);
endmodule