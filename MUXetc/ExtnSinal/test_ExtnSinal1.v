module test_ExtnSinal1;
    reg [2:0] rInst;
    wire [7:0] rExtnd;
    initial begin
        #1 rInst=3'b000;

        #1 rInst=3'b101;

        #1 rInst=3'b111;

        #1 rInst=3'b011;   
    end
    initial begin
        $monitor("Time=%0d, in rInst: %b out extendido: %b",
                $time, rInst, rExtnd);
    end
    ExtnSinal1 gate1(rInst, rExtnd);
endmodule

