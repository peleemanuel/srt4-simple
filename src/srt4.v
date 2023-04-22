module srt4 (
    input [7:0] inbus,
    input beginSignal, clk, rst_b
    output [7:0] outbus,
    output endSignal
);

wire [16:0]control_signals_wire;

CU control_unit(
    .beginSignal(),
    .rst_b(),
    .clk(),
    .b7(),
    .b(),
    .msbp(),
    .cnt1(),
    .endSignal(),
    .control_signals()
);

p P_register(
    .c0(control_signals_wire[0]),
    .c2(control_signals_wire[2]),
    .c3(control_signals_wire[3]),
    .c8(control_signals_wire[8]),
    .c14(control_signals_wire[14]),
    .inbit(),
    .d(),
    .outbit(),
    .q()
);

a A_register(
    .c0(control_signals_wire[0]),
    .c2(control_signals_wire[2]),
    .c3(control_signals_wire[3]),
    .c4(control_signals_wire[4]),
    .c7(control_signals_wire[7]),
    .c13(control_signals_wire[13]),
    .inbit(),
    .d(),
    .outbit(),
    .q()
);

aprim Aprim_register(
    .c0(control_signals_wire[0]),
    .c3(control_signals_wire[3]),
    .c5(control_signals_wire[5]),
    .c6(control_signals_wire[6]),
    .c12(control_signals_wire[12]),
    .inbit(),
    .d(),
    .outbit(),
    .q()
);

b B_register(
    .c0(control_signals_wire[0]),
    .inbit(),
    .d(),
    .outbit(),
    .q()
);



endmodule