module count1 (
    input c0,c11,
    output reg [1:0]count
);

always @(posedge c0, posedge c11) begin
    if(c0)
        count <= 2'b00;
    else if(c11)
        count <= count + 1;
end

endmodule

module count2 (
    input c0,c2,c14,
    output reg [2:0] count
);
always @(posedge c0, posedge c2, posedge c14) begin
    if(c0)
        count <= 2'b00;
    else if(c2)
        count <= count + 1;
    else if(c14)
        count <= count - 1;

end

endmodule