module pAND(
    input wire zeroULA, 
    output wire out,
    input Branch 
);
    assign out = ~zeroULA & Branch;
endmodule