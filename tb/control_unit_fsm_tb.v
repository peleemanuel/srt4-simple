`timescale 1ns/1ns
`include "../src/function_table.v"
`include "../src/control_unit_fsm.v"

module cu_testing;
    reg beginSignal;
    reg rst_b;
    reg clk;
    reg b7;
    reg [3:0] b;
    reg [5:0] msbp;
    reg [1:0] cnt1;
    reg p8;
    reg [2:0] cnt2;
    wire endSignal;
    wire [16:0] control_signals;

CU control_unit(
    .beginSignal(beginSignal),
    .rst_b(rst_b),
    .clk(clk),
    .b7(b7),
    .b(b),
    .msbp(msbp),
    .cnt1(cnt1),
    .p8(p8),
    .cnt2(cnt2),
    .endSignal(endSignal),
    .control_signals(control_signals)
);

initial begin
    clk = 0;
    repeat (300) #20 clk = ~clk;
end

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, cu_testing);
    b = 12;
    rst_b = 1;
    beginSignal = 0;
    cnt1 = 0;
    b7 = 0;
    p8 = 0;
    cnt2 = 2;
    #5 rst_b = 0;
    #5 rst_b = 1;
    #35 beginSignal = 1;
    #30 beginSignal = 0;
    #85 b7 = 1;
    #80 b7 = 0;
    #40 msbp = 6'b000001;
    #80 msbp = 6'b110100;
    #80 cnt1 = 3;
    #40 p8 = 1;
    #200 cnt2 = 1;
    #80 cnt2 = 0;
    #320;
end
endmodule