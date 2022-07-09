module test_ULA;
    reg [7:0] bReg;
    reg [7:0] mux;
    reg OpULA;  
    wire Zero;
    wire [7:0] out;
    initial begin
        bReg = 00000000; mux = 00000000; OpULA=0;
        
        #1 bReg = 00000001; 
        mux = 00000001; 
        OpULA=0;
        
        #1 bReg = 00000001; 
        mux = 00000011; 
        OpULA=0;
        
        #1 bReg = 00000001; 
        mux = 00000011; 
        OpULA=1;

        #1 bReg = 00000010; 
        mux = 00000011; 
        OpULA=1;
    end
    initial begin
        $monitor("Time=%0d, in bReg %b, in MUX %b, out resultado %b, out Zero %b, OpULA %b",
                $time, bReg, mux, out, Zero, OpULA);
    end
    ULA gate1(bReg, mux, Zero, out, OpULA);
endmodule