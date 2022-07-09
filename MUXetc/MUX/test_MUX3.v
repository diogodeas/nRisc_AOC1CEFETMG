module test_MUX3;
    reg [7:0] imdt;
    reg [7:0] rMUX2;
    reg Defi;
    wire [7:0] out;
    initial begin
        #1 Defi = 0; imdt = 8'b00010001; rMUX2 = 8'b00001101;

        #1 Defi = 1; 
    end
    initial begin
        $monitor("Time=%0d, controle Defi: %b, in imdt: %b, in rMUX2: %b, out: %b",
                $time, Defi, imdt, rMUX2, out);
    end
    MUX3 gate1(imdt, rMUX2, out, Defi);
endmodule

