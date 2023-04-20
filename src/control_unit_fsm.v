module CU (
    input beginSignal,
    input rst_b,
    input clk,
    input b7,
    input [3:0] b,
    input [5:0] msbp,
    input [1:0] cnt1,
    input p8,
    input [2:0] cnt2,
    output reg endSignal,
    output reg [16:0] control_signals 
);

localparam S0 = 5'b00000;
localparam S1 = 5'b00001;
localparam S2 = 5'b00010;
localparam S3 = 5'b00011;
localparam S4 = 5'b00100;
localparam S5 = 5'b00101;
localparam S6 = 5'b00110;
localparam S7 = 5'b00111;
localparam S8 = 5'b01000;
localparam S9 = 5'b01001;
localparam S10 = 5'b01010;
localparam S11 = 5'b01011;
localparam S12 = 5'b01100;
localparam S13 = 5'b01101;
localparam S14 = 5'b01110;
localparam S15 = 5'b01111;
localparam S16 = 5'b10000;
localparam S17 = 5'b10001;
localparam S18 = 5'b10010;
localparam S19 = 5'b10011;
localparam S20 = 5'b10100;
localparam S21 = 5'b10101;
localparam S22 = 5'b10110;
localparam S23 = 5'b10111;
localparam S24 = 5'b11000;

localparam f0 = 3'b000;
localparam f1 = 3'b001;
localparam f2 = 3'b010;
localparam fn1 = 3'b101;
localparam fn2 = 3'b110;

reg [4:0] state, state_next;
wire [2:0] f;

funtable srt4table(
  .b(b),
  .p(msbp), 
  .q(f)
);

always @(posedge clk or negedge rst_b) begin
    if(~rst_b) state <= S0;
    else state <= state_next;
end
//State calculator
always @(*) begin
    state_next = state;
    case (state)
        S0 : if(beginSignal) state_next = S1;
        S1 : state_next = S2;
        S2 : state_next = S3;
        S3 : begin 
            if(b7) state_next = S4;
            else if(~b7) state_next = S5;
        end
        S4 : state_next = S3;
        S5 : begin
            if(f == f0) state_next = S6;
            else if (f == f1) state_next = S7;
            else if (f == fn1) state_next = S8;
            else if (f == fn2) state_next = S9;
            else if (f == f2) state_next = S10;
        end
        S6 : state_next = S15;
        S7 : state_next = S11;
        S8 : state_next = S12;
        S9 : state_next = S13;
        S10 : state_next = S14;
        S11 : state_next = S15;
        S12 : state_next = S15;
        S13 : state_next = S15;
        S14 : state_next = S15;
        S15 :begin 
            if(cnt1[0] & cnt1[1]) state_next = S17;
            else state_next = S16;
        end
        S16 : state_next = S5;
        S17 : begin
            if(p8) state_next = S18;
            else state_next = S19;
        end
        S18 : state_next = S19;
        S19 : state_next = S20;
        S20 : begin
            if(~cnt2[0] & ~cnt2[1]) state_next = S22;
            esle state_next = S21;
        end
        S21: state_next = S20;
        S22: state_next = S23;
        S23: state_next = S24;
        S24: state_next = S0;
    endcase
end
// control signals calculator
always @(*) begin
    control_signals = 17'b0_0000_0000_0000_0000;
    endSignal = 1'b0;
    case (state)
        S1 : control_signals[0] = 1; 
        S2 : control_signals[1] = 1; 
        S4 : control_signals[2] = 1; 
        S6 : control_signals[3] = 1; 
        S7 : begin 
            control_signals[3] = 1; 
            control_signals[4] = 1; 
        end
        S8 : begin 
            control_signals[3] = 1; 
            control_signals[5] = 1; 
        end
        S9 : begin 
            control_signals[3] = 1; 
            control_signals[6] = 1; 
        end 
        S10 : begin 
            control_signals[3] = 1; 
            control_signals[7] = 1; 
        end 
        S11 : begin 
            control_signals[8] = 1; 
            control_signals[9] = 1; 
        end 
        S12 : control_signals[8] = 1; 
        S13 : begin 
            control_signals[8] = 1; 
            control_signals[10] = 1; 
        end         
        S14 : begin 
            control_signals[8] = 1; 
            control_signals[9] = 1; 
            control_signals[10] = 1; 
        end
        S16 : control_signals[11] = 1;
        S18 : begin 
            control_signals[8] = 1; 
            control_signals[9] = 1; 
        end  
        S19 : begin 
            control_signals[8] = 1; 
            control_signals[9] = 1; 
            control_signals[13] = 1; 
        end 
        S21 : control_signals[14] = 1;
        S22 : control_signals[15] = 1;
        S23 : control_signals[16] = 1;
        S24 : endSignal = 1;
       
    endcase
end
endmodule