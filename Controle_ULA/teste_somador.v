module test_somador;
    reg [7:0] iPC;
    wire [7:0] out;
    initial begin
        #1 iPC = 8'b00010001;

        #1 iPC = 8'b00101101; 

        #1 iPC = 8'b01110010; 
    end
    initial begin
        $monitor("Time=%0d, in iPC %b, out %b",
                $time, iPC, out);
    end
    Somador gate1(iPC, out);
endmodule