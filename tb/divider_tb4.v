`timescale 1ns/1ns

`include "../src/function_table.v"
`include "../src/control_unit_fsm.v"
`include "../src/adder.v"
`include "../src/counter.v"
`include "../src/demux.v"
`include "../src/mux.v"
`include "../src/register.v"
`include "../src/srt4.v"

module impartire_tb;
reg [7:0] inbus;
reg beginSignal, clk, rst_b;
wire [7:0] outbus;
wire endSignal;

srt4 srt_4(
    .inbus(inbus),
    .beginSignal(beginSignal), 
    .clk(clk), 
    .rst_b(rst_b),
    .outbus(outbus),
    .endSignal(endSignal)
);

initial begin
    clk = 0;
    repeat (100) #10 clk = ~clk;
end

initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0, impartire_tb);
    beginSignal = 1;
    rst_b = 1;
    inbus = 216;
    #2 rst_b = 0;
    #3 rst_b = 1;    
    #15 beginSignal = 0;
    #10 inbus = 21; 
end

endmodule