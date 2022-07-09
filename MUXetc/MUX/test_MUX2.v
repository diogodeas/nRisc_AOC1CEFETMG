module test_MUX2;
    reg [7:0] dRead;
    reg [7:0] rULA;
    reg MemtoREG;
    wire [7:0] out;
    initial begin
        #1 MemtoREG = 0; dRead = 8'b00010001; rULA = 8'b00001101;

        #1 MemtoREG = 1; 
    end
    initial begin
        $monitor("Time=%0d, controle: MemtoREG %b, in dRead: %b, in rULA: %b, out: %b",
                $time, MemtoREG, dRead, rULA, out);
    end
    MUX2 gate1(dRead, rULA, out, MemtoREG);
endmodule

