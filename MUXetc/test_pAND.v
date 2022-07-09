module test_pAND;
    reg zeroULA;
    reg Branch;
    wire out;
    initial begin
        #1 zeroULA = 0; Branch = 0;

        #1 zeroULA = 0; 
        Branch = 1;

        #1 zeroULA = 1; 
        Branch = 0;
        
        #1 zeroULA = 1; 
        Branch = 1;
    end
    initial begin
        $monitor("Time=%0d, zeroULA: %b, Branch: %b, out: %b",
                $time, zeroULA, Branch, out);
    end
    pAND gate1(zeroULA, out, Branch);
endmodule