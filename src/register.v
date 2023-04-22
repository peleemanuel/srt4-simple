module p (
  input c0,c2,c3,c8,c14,
  input [1:0]inbit,
  input [8:0]d, // intrarea pentru registru 
  output reg [1:0]outbit, // cand shiftez cu 2 pozitii, o sa imi iasa 2 biti
  output reg [8:0]q //iesirea pentru registru
);


always @(posedge c0 or posedge c2 or posedge c3 or posedge c8 or posedge c14) begin
  if(c0)
    q <= 0;

  else if(c2) begin
    q[8:1] <= q[7:0];
    q[0] <= inbit[0];
  end 

  else if(c3) begin
    q[8:2] <= q[6:0];
    q[1:0] <= inbit;
  end
  
  else if(c8) begin // nu mai trebuie tratat cazul de c9 sau c10
   q <= d;
  end

  else if(c14) begin
    q[7:0] <= q[8:1];
    q[8] <= 0;
  end
end

endmodule

module a (
  input c0,c2,c3,c4,c7,c13,
  input [1:0]inbit,
  input [7:0]d,
  output reg [1:0]outbit,
  output reg [7:0]q
);
  
always @(posedge c0 or posedge c2 or posedge c3 or posedge c4 or posedge c7 or posedge c13) begin
  if(c0) begin
    q <= d;
  end

  else if(c2) begin
    outbit[0] <= q[7];
    q[7:1] <= q[6:0];
    q[0] <= inbit[0];
  end

  else if(c3) begin
    outbit <= q[7:6];
    q[7:2] <= q[5:0];

    if(c4) begin
      q[1:0] <= 2'b01;
    end
    else if(c7) begin
      q[1:0] <= 2'b10;
    end

    else begin
      q[1:0] <= 2'b00;
    end
  end

  else if(c13) begin
    q <= d;
  end
  
end

endmodule

module aprim (
  input c0,
  input [1:0]inbit,
  input [7:0]d,
  output reg [1:0]outbit,
  output reg [7:0]q
);
  
always @(posedge c0) begin

end

endmodule

module b (
  input c0,
  input [1:0]inbit,
  input [7:0]d,
  output reg [1:0]outbit,
  output reg [7:0]q
);

always @(posedge c0) begin

end

endmodule