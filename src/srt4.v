module srt4 (
    input [7:0] inbus,
    input beginSignal, clk, rst_b
    output [7:0] outbus,
    output endSignal
);

wire [16:0]csingals; 

CU control_unit(
    .beginSignal(beginSignal),
    .rst_b(rst_b),
    .clk(clk),
    .b7(),
    .b(),
    .msbp(),
    .cnt1(),
    .p8(),
    .cnt2(),
    .endSignal(endSignal),
    .control_signals(csingals) 
);

p P_register(
    .c0(csingals[0]),
    .c2(csingals[2]),
    .c3(csingals[3]),
    .c8(csingals[8]),
    .c14(csingals[14]),
    .inbit(q_a[7:6]),//stabilim ulterior pt ca exista niste muxuri
    .d(), //stabilim ulterior  
    .outbit(), // cand shiftez cu 2 pozitii, o sa imi iasa 2 biti
    .q() 
)
endmodule