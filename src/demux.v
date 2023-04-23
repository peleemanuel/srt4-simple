module demux
  (
   input [9-1:0] data_in,  // Input data lines

   input sel,            // Select line
   output reg [9-1:0] data_out0,              // Output data line
   output reg [9-1:0] data_out1
  );

  always @(*) begin
    data_out0 = 9'b0_0000_0000;
    data_out1 = 9'b0_0000_0000;
    case(sel)
      1'b0: data_out0 = data_in;
      1'b1: data_out1 = data_in;
    endcase
  end
endmodule