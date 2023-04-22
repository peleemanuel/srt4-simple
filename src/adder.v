module FAC(
  input i,j,ci,
  output reg c,o
);

always @(*)begin
  o=i^j^ci;
  c=i&j | i&ci | j*ci;
end

endmodule

module nine_bit_adder(
    input [8:0]i,j,
    output [8:0]o
);

  wire [9:0]c;
  
  assign c[0]=0;
  generate
    genvar x;
    for(x = 0; x < 9 ; x=x+1)
      begin
        FAC sum(.i(i[x]), .j(j[x]), .ci(c[x]), .c(c[x+1]), .o(o[x]));
      end
  endgenerate
  
  
endmodule