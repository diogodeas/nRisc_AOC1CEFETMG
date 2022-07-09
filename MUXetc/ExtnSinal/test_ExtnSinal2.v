module test_ExtnSinal2;
    reg [3:0] rInst;
    wire [7:0] rExtnd;
    initial begin
        #1 rInst=4'b1000;

        #1 rInst=4'b0110;

        #1 rInst=4'b0111;

        #1 rInst=4'b1111;   
    end
    initial begin
        $monitor("Time=%0d, in rInst: %b out extendido: %b",
                $time, rInst, rExtnd);
    end
    ExtnSinal2 gate1(rInst, rExtnd);
endmodule

