module demux #(parameter WIDTH = 9)
  (
   input [WIDTH-1:0] data_in,  // Input data lines

   input sel,            // Select line
   output reg [WIDTH-1:0] data_out0,              // Output data line
   output reg [WIDTH-1:0] data_out1
  );

  always @(*)
    data_out0 = 0;
    data_out1 = 0;
    case(sel)
      1'b0: data_out0 = data_in;
      1'b1: data_out1 = data_in;
    endcase

endmodule