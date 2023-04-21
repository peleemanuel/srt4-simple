`timescale 1ns/1ns
`include "../src/function_table.v"

module fun_tbl_tb;
  reg [3:0] b;
  reg [5:0] p;
  wire [2:0] q;
  reg sw;
  integer i,j;
  
funtable srt4table(
  .b(b),
  .p(p), 
  .q(q)
);

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, fun_tbl_tb);
    i = 8;
    sw = 0;
    #10;
end

always @(*) begin
  if(~sw) begin
    testing();
    sw = 1;
  end
end

task testing();
  for(i = 8; i < 16; i = i+1'b1)
  begin 
    b = i;
    for (j = 0; j < 64; j = j + 1'b1)
    begin
      p = j;
      #10;
    end
  end
endtask

endmodule