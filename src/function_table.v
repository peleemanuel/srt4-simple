module funtable(
    input [3:0]b,
    input [5:0]p,
    output reg [2:0]q
);

reg [4:0]psm;

always @(*) begin
    q = 3'b000;
    case (b)
        4'b1000 : begin if (p[5])
            begin
                psm = ~p[4:0] + 1'b1;
                if(psm < 3) q = 3'b000;
                else if (psm < 7) q = 3'b101;
                else if (psm >= 7) q = 3'b110;
            end
            else begin
                psm = p[4:0];
                if (psm < 2) q = 3'b000;
                else if (psm < 6) q = 3'b001;
                else if (psm >= 6) q = 3'b010;
            end
        end  
        4'b1001 : begin if (p[5])
            begin
                psm = ~p[4:0] + 1'b1;
                if(psm < 4) q = 3'b000;
                else if (psm < 8) q = 3'b101;
                else if (psm >= 8) q = 3'b110;
            end
            else begin
                psm = p[4:0];
                if (psm < 3) q = 3'b000;
                else if (psm < 7) q = 3'b001;
                else if (psm >= 7) q = 3'b010;
            end
        end  
        4'b1010 :begin if (p[5])
            begin
                psm = ~p[4:0] + 1'b1;
                if(psm < 4) q = 3'b000;
                else if (psm < 9) q = 3'b101;
                else if (psm >= 9) q = 3'b110;
            end
            else begin
                psm = p[4:0];
                if (psm < 3) q = 3'b000;
                else if (psm < 8) q = 3'b001;
                else if (psm >= 8) q = 3'b010;
            end
        end  
        4'b1011 :begin if (p[5])
            begin
                psm = ~p[4:0] + 1'b1;
                if(psm < 4) q = 3'b000;
                else if (psm < 10) q = 3'b101;
                else if (psm >= 10) q = 3'b110;
            end
            else begin
                psm = p[4:0];
                if (psm < 3) q = 3'b000;
                else if (psm < 9) q = 3'b001;
                else if (psm >= 9) q = 3'b010;
            end
        end  
        4'b1100 :begin if (p[5])
            begin
                psm = ~p[4:0] + 1'b1;
                if(psm < 5) q = 3'b000;
                else if (psm < 11) q = 3'b101;
                else if (psm >= 11) q = 3'b110;
            end
            else begin
                psm = p[4:0];
                if (psm < 4) q = 3'b000;
                else if (psm < 10) q = 3'b001;
                else if (psm >= 10) q = 3'b010;
            end
        end  
        4'b1101 :begin if (p[5])
            begin
                psm = ~p[4:0] + 1'b1;
                if(psm < 5) q = 3'b000;
                else if (psm < 11) q = 3'b101;
                else if (psm >= 11) q = 3'b110;
            end
            else begin
                psm = p[4:0];
                if (psm < 4) q = 3'b000;
                else if (psm < 10) q = 3'b001;
                else if (psm >= 10) q = 3'b010;
            end
        end  
        4'b1110 :begin if (p[5])
            begin
                psm = ~p[4:0] + 1'b1;
                if(psm < 5) q = 3'b000;
                else if (psm < 12) q = 3'b101;
                else if (psm >= 12) q = 3'b110;
            end
            else begin
                psm = p[4:0];
                if (psm < 4) q = 3'b000;
                else if (psm < 11) q = 3'b001;
                else if (psm >= 11) q = 3'b010;
            end
        end  
        4'b1111 :begin if (p[5])
            begin
                psm = ~p[4:0] + 1'b1;
                if(psm < 6) q = 3'b000;
                else if (psm < 13) q = 3'b101;
                else if (psm >= 13) q = 3'b110;
            end
            else begin
                psm = p[4:0];
                if (psm < 5) q = 3'b000;
                else if (psm < 12) q = 3'b001;
                else if (psm >= 12) q = 3'b010;
            end
        end  
    endcase
end
endmodule