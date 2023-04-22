module rgst #(
	parameter w=8
)(
	input clk, rst_b, ld,//clr, // in case we need clr signal
	input [w-1:0] d,
	output reg [w-1:0] q
  //input c1 c2 c3 c4 etc
  //input in_bit si ii tot dau pl in gura (am valoarea din main)
  //output reg out_bit ii dau assign 
);
	always @ (posedge clk, negedge rst_b)
	begin
		if (!rst_b)			q <= 0;
		//else if (clr)			q <= 0; // do we need a clr signal?
		else if (ld)			q <= d;
  end
//posedge c2
//wire in_bit din fiecare registru si fac legatura in main
/*
reg [w:0]aux;
reg outbuss;

  always @(posedge clk)
  begin
    if(!ld)
      begin
        aux = Shift(q,1,0,1);      
        outbuss = aux[w];
        q <= aux[w-1:0];
      end
  end
*/

/*
always @(posedge clk)
begin
  if(!ld)
    begin
      q <= Shift_k(q,2);
    end  
end
*/

function [w:0] Shift(input [w-1:0]P,input in_bit, input left, input right); // this function is only used my P register
  reg out_bit;
  begin
    
    if(left)
    begin
      out_bit = P[w-1];
      P[w-1:1] = P[w-2:0];
      P[0] = in_bit;
    end  
  else if(right)
    begin
      out_bit = P[0];
      P[w-2:0] = P[w-1:1];
      P[w-1] = in_bit;
    end
  Shift = {out_bit,P};
  end
  
endfunction

function [w-1:0] Shift_k(input [w-1:0]P, input [2:0]k);
  Shift_k = P >> k;
endfunction

endmodule

// dim 9
module p (
  input c0,c2,
  input [1:0]inbit,
  input d,
  output outbit,
  output reg q
);


always @(posedge c0, posedge c2, posedge c3, posedge c8) begin
  if(c0) q <= 0;
  else if(c2) begin
    q[8:1] <= q[7:0];
    q[0] <= inbit[0];
  end 
  else if(c3) begin
  begin
      q[8:2] <= q[6:0];
      q[1:0] <= inbit;
    end
  end
  else if(c8) begin
   q <= d;
  end
end

endmodule
//restul de 8
module a (
  ports
);
  
endmodule

module aprim (
  ports
);
  
endmodule

module b (
  
);
  
endmodule