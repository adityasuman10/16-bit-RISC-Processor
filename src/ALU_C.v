module ALU(
 input  [15:0] a,  
 input  [15:0] b,  
 input  [2:0] alu_control, 
 
 output reg [15:0] result,  
 output zero
    );

always @(*)
begin 
 case(alu_control)
 3'b000: result = a + b; 
 3'b001: result = a - b; 
 3'b010: result = ~a;
 3'b011: result = a<<b;
 3'b100: result = a>>b;
 3'b101: result = a & b;
 3'b110: result = a | b; 
 3'b111: begin if (a<b) result = 16'd1;
    else result = 16'd0;
    end
 default:result = a + b; 
 endcase
end
assign zero = (result==16'd0) ? 1'b1: 1'b0;
 
endmodule