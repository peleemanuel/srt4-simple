module register_tb;
  
  parameter Pdimension = 9;

  reg clk_tb, rst_b_tb, ld_tb;  
  reg [Pdimension-1:0]P_tb;
  
  wire [Pdimension-1:0]P_o;
  
  rgst #(Pdimension)
    rgst_tb (
      .clk(clk_tb),
      .rst_b(rst_b_tb),
      .ld(ld_tb),
      .d(P_tb),
      .q(P_o)
    );
    
  initial begin
    clk_tb = 0;
    forever
      #50 clk_tb = ~clk_tb;
  end
    
  initial begin
    rst_b_tb = 1;
        
    ld_tb = 0;
    P_tb = 9'b100110100;
    #2
    rst_b_tb = 0;
    #2
    rst_b_tb = 1;
    #2
    ld_tb = 1;
    
    #50
    ld_tb = 0;
    #2;
    //$finish;
  end
  
endmodule
/*module rgst_tb;
  
  parameter Pdimension = 9;

  reg clk_tb, rst_b_tb, ld_tb;  
  reg [Pdimension-1:0] P_tb;
  
  wire [Pdimension-1:0] P_o;
  
  rgst #(.w(Pdimension)) rgst_tb (
      .clk(clk_tb),
      .rst_b(rst_b_tb),
      .ld(ld_tb),
      .d(P_tb),
      .q(P_o)
  );
  
  initial begin
    rst_b_tb = 0;
    clk_tb = 0;
    ld_tb = 0;
    P_tb = 9'b100110100;
    
    // wait for a few clock cycles to stabilize the inputs
    #5;
    
    // load the input data into the register
    ld_tb = 1;
    #5;
    
    
    // wait for one clock cycle to allow the register to capture the input data
    #1;
    
    // assert the clock signal to capture the input data and produce the output
    clk_tb = 1;
    #1;
    clk_tb = 0;
    
    // wait for one more clock cycle to allow the output to stabilize
    #1;
    
    // print the output value
    $display("Output: P_o = %b", P_o);
    
    // end the simulation
    $finish;
  end
  
endmodule
*/