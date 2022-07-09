module test_MUX1;
    reg [7:0] dReg;
    reg [7:0] extd;
    reg ULASrc;
    wire [7:0] out;
    initial begin
        #1 ULASrc=0; dReg = 8'b00010001; extd = 8'b00101101;

        #1 ULASrc=1; 
    end
    initial begin
        $monitor("Time=%0d, controle: ULASrc %b, in dReg: %b, in extd: %b, out: %b",
                $time, ULASrc, dReg, extd, out);
    end
    MUX1 gate1(dReg, extd, out, ULASrc);
endmodule
