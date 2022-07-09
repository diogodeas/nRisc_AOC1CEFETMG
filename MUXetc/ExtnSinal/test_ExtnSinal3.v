module test_ExtnSinal3;
    reg [4:0] rInst;
    wire [7:0] rExtnd;
    initial begin
        #1 rInst=5'b01000;

        #1 rInst=5'b10110;

        #1 rInst=5'b10111;

        #1 rInst=5'b00111;   
    end
    initial begin
        $monitor("Time=%0d, in rInst: %b out extendido: %b",
                $time, rInst, rExtnd);
    end
    ExtnSinal3 gate1(rInst, rExtnd);
endmodule