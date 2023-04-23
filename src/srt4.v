module srt4 (
    input [7:0] inbus,
    input beginSignal, clk, rst_b,
    output [7:0] outbus,
    output endSignal
);


wire [16:0]control_signals_wire;
wire [8:0] p_in_wire, p_out_wire;
wire [7:0] a_in_wire, a_out_wire, aprim_in_wire, aprim_out_wire, b_in_wire, b_out_wire;
wire [1:0] pa_connect, ab_connect;
wire [1:0] cnt1;
wire [2:0] cnt2;
wire [8:0] adder_out;
wire [8:0] a_9_bits, aprim_9_bits, b_9_bits;
wire [8:0] adder_i, adder_j, intermediate_adder_j;

assign a_9_bits = {1'b0,a_out_wire};
assign b_9_bits = (c10) ? {b_out_wire,1'b0} : {1'b0, b_out_wire};
assign aprim_9_bits = {1'b0,aprim_out_wire};
assign adder_j = (c9) ? (~intermediate_adder_j + 1) : intermediate_adder_j;

always @(*) begin
    outbus = 0;
    if(control_signals_wire[15])
        outbus = a_out_wire;
    else if(control_signals_wire[16])
        outbus = p_out_wire[7:0];
end

always @(*) begin
    if(control_signals_wire[0])
        a_in_wire = inbus;
    else if(control_signals_wire[1])
        b_in_wire = inbus;
end

count1 countOne(
    .c0(control_signals_wire[0]),
    .c11(control_signals_wire[11]),
    .count(cnt1)
);

count2 countTwo(
    .c0(control_signals_wire[0]),
    .c2(control_signals_wire[2]),
    .c14(control_signals_wire[14]),
    .count(cnt2)
);

CU control_unit(
    .beginSignal(beginSignal),
    .rst_b(rst_b),
    .clk(clk),
    .b7(b_out_wire[7]),
    .b(b_out_wire[7:4]),
    .msbp(p_out_wire[8:3]),
    .cnt1(cnt1),
    .p8(p_out_wire[8]),
    .cnt2(cnt2),
    .endSignal(endSignal),
    .control_signals(control_signals_wire)
);

p P_register(
    .c0(control_signals_wire[0]),
    .c2(control_signals_wire[2]),
    .c3(control_signals_wire[3]),
    .c8(control_signals_wire[8]),
    .c14(control_signals_wire[14]),
    .inbit(pa_connect),
    .d(p_in_wire),
    //.outbit(),
    .q(p_out_wire)
);

a A_register(
    .c0(control_signals_wire[0]),
    .c2(control_signals_wire[2]),
    .c3(control_signals_wire[3]),
    .c4(control_signals_wire[4]),
    .c7(control_signals_wire[7]),
    .c13(control_signals_wire[13]),
    .inbit(ab_connect),
    .d(a_in_wire),
    .outbit(pa_connect),
    .q(a_out_wire)
);

aprim Aprim_register(
    .c0(control_signals_wire[0]),
    .c3(control_signals_wire[3]),
    .c5(control_signals_wire[5]),
    .c6(control_signals_wire[6]),
    .c12(control_signals_wire[12]),
    //.inbit(),
    .d(aprim_in_wire),
    //.outbit(),
    .q(aprim_out_wire)
);

b B_register(
    .c0(control_signals_wire[0]),
    //.inbit(),
    .d(b_in_wire),
    .outbit(ab_connect),
    .q(b_out_wire)
);
wire dump;
demux demux1(
    .sel(control_signals_wire[13]),
    .data_in(adder_out),
    .data_out0(p_in_wire),
    .data_out1({dump, a_in_wire})
);

mux muxj(
    .sel(control_signals_wire[13]),
    .data_in0(b_9_bits),
    .data_in1(aprim_9_bits),
    .data_out(intermediate_adder_j)
);

mux muxi(
    .sel(control_signals_wire[13]),
    .data_in0(p_out_wire),
    .data_in1(a_9_bits),
    .data_out(adder_i)
);

nine_bit_adder adder9bits(
    .i(adder_i),
    .j(adder_j),
    .o(adder_out)
);

endmodule