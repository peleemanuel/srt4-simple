module adder_tb;
  reg [8:0]i_tb,j_tb;
  wire [8:0]o_tb;

  nine_bit_adder nine_bit_adder_testbench(
    .i(i_tb),
    .j(j_tb),
    .o(o_tb)
  );

  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, adder_tb);
    #2
    i_tb = 9'b010011101;
    j_tb = 9'b001110010;
    #2
    if(o_tb == 9'b100001111)
      $display("Test Passed!");
    else
      $display("Test Failed!");
  end


endmodule