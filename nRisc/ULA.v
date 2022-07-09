module ULA (
    input wire [7:0] bReg,
    input wire [7:0] mux,
    output wire Zero,
    output wire [7:0] out,
    input OpULA
    );
    
    reg [7:0] ula;
    reg zero;

    always@(bReg or mux or OpULA)begin
        case (OpULA)
        1'b0: ula = bReg - mux;
        1'b1: ula = bReg*mux;
        default: ula=8'b00000000;
        endcase
        if(ula == 8'b00000000) begin
            zero = 1;
        end else begin
            zero = 0;
        end
    end
  
    assign out = ula;
    assign Zero = zero;

endmodule