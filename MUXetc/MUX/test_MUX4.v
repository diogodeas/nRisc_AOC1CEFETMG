module test_MUX4;
    reg [7:0] PC1;
    reg [7:0] rULA2;
    reg pAND;
    wire [7:0] out;
    initial begin
        #1 pAND = 0; PC1 = 8'b00010001; rULA2 = 8'b00001101;

        #1 pAND = 1; 
    end
    initial begin
        $monitor("Time=%0d, controle pAND: %b, in PC1: %b, in rULA2: %b, out: %b",
                $time, pAND, PC1, rULA2, out);
    end
    MUX4 gate1(PC1, rULA2, out, pAND);
endmodule

