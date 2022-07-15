module Controle (
    input wire [7:5] Istrc,
    output wire Jump,
    output wire LerMem,
    output wire EscreveMem,
    output wire Branch,
    output wire OpULA,
    output wire MemtoREG,
    output wire Defi,
    output wire ULASrc,
    output wire EscreveReg,
    output wire Encerra
    );
    
    reg jump=0;
    reg lerMem=0;
    reg escreveMem=0;
    reg branch=0;
    reg opULA=0;
    reg memtoREG=0;
    reg defi=0;
    reg uLASrc=0;
    reg escreveReg=0;
    reg encerra=0;
    
    always@(Istrc)begin
        case (Istrc)
        3'b000: begin//instruction defi
            escreveReg = 1;
            defi = 1;
            jump=0;
            lerMem=0;
            escreveMem=0;
            branch=0;
            opULA=0;
            memtoREG=0;
            uLASrc=0;
            encerra=0;
        end
        8'b001: begin //instruction beq
            uLASrc = 1;
            branch = 1;
            escreveReg = 0;
            defi = 0;
            jump=0;
            lerMem=0;
            escreveMem=0;
            opULA=0;
            memtoREG=0;
            encerra=0;
        end
        8'b011: begin //instruction sw
            escreveMem = 1;
            uLASrc = 0;
            branch = 0;
            escreveReg = 0;
            defi = 0;
            jump=0;
            lerMem=0;
            opULA=0;
            memtoREG=0;
            encerra=0;
        end
        8'b010: begin //instruction lw
            escreveReg = 1;
            memtoREG = 1;
            lerMem = 1;
            escreveMem = 0;
            uLASrc = 0;
            branch = 0;
            defi = 0;
            jump=0;
            opULA=0;
            encerra=0;
        end
        8'b100: begin //instruction mul
            escreveReg = 1;
            uLASrc = 1;
            opULA = 1;
            escreveMem = 0;
            branch = 0;
            defi = 0;
            jump=0;
            lerMem=0;
            memtoREG=0;
            encerra=0;
        end
        8'b101: begin //instruction subi
            escreveReg = 1;
            escreveMem = 0;
            uLASrc = 0;
            branch = 0;
            defi = 0;
            jump=0;
            lerMem=0;
            opULA=0;
            memtoREG=0;
            encerra=0;
        end
        8'b110: begin //instruction j
            jump = 1;
            escreveReg = 0;
            escreveMem = 0;
            uLASrc = 0;
            branch = 0;
            defi = 0;
            lerMem=0;
            opULA=0;
            memtoREG=0;
            encerra=0;
        end
        8'b111: begin//instruction encerra
            encerra = 1;
            jump = 0;
            escreveReg = 0;
            escreveMem = 0;
            uLASrc = 0;
            branch = 0;
            defi = 0;
            lerMem=0;
            opULA=0;
            memtoREG=0;
        end
        default: begin 
            jump=1'bX;
            lerMem=1'bX;
            escreveMem=1'bX;
            branch=1'bX;
            opULA=1'bX;
            memtoREG=1'bX;
            defi=1'bX;
            uLASrc=1'bX;
            escreveReg=1'bX;
        end
        endcase
    end

    assign Jump = jump;
    assign LerMem = lerMem;
    assign EscreveMem = escreveMem;
    assign Branch = branch;
    assign OpULA = opULA;
    assign MemtoREG = memtoREG;
    assign Defi = defi;
    assign ULASrc = uLASrc;
    assign EscreveReg = escreveReg;
    assign Encerra = encerra;

endmodule