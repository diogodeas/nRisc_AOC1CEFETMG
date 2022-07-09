module test_MUX5;
    reg [7:0] iReg;
    reg [7:0] rMUX4;
    reg Jump;
    wire [7:0] out;
    initial begin
        #1 Jump = 0; iReg = 8'b00010001; rMUX4 = 8'b00001101;

        #1 Jump = 1; 
    end
    initial begin
        $monitor("Time=%0d, controle Jump: %b, in iReg: %b, in rMUX4: %b, out: %b",
                $time, Jump, iReg, rMUX4, out);
    end
    MUX5 gate1(iReg, rMUX4, out, Jump);
endmodule

