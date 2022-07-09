module PC (
  input wire clock,
  input wire [7:0] in,
  output wire [7:0] out,
  input Encerra
);
  
  reg [7:0] pc;
  
  always @(posedge clock)
    begin
    if(~Encerra) begin 
      pc = in;
    end
  end
  
  assign out = pc;

endmodule