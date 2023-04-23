module mux #(parameter WIDTH = 9)
  (
   input [WIDTH-1:0] data_in0,  // Input data lines
   input [WIDTH-1:0] data_in1,  //nu merge sa fac array cu astea, imi zice ca e de systemverilog :(

   input sel,            // Select line
   output reg [WIDTH-1:0] data_out              // Output data line
  );

  always @(*)
    case(sel)
      1'b0: data_out = data_in0;
      1'b1: data_out = data_in1;
    endcase

endmodule