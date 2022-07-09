module test_ULA;
    reg [7:0] iPC;
    reg [7:0] bInst;
    wire [7:0] out;
    initial begin
        #1 iPC = 8'b01000010; bInst = 8'b00000001;

        #1 iPC = 8'b00010010; bInst = 8'b00000010;

        #1 iPC = 8'b01110011; bInst = 8'b00000011; 
    end
    initial begin
        $monitor("Time=%0d, in iPC %b, in bInst %b, out %b",
                $time, iPC, bInst, out);
    end
    ULA2 gate1(iPC, bInst, out);
endmodule