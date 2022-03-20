module clkgen(clka, clkb, clka_out, clkb_out);
input clka, clkb;
output clka_out, clkb_out;
reg clka_out, clkb_out;
always @(clka) begin 
clka_out = clka;
end
always @(clkb) begin
clkb_out = clkb;
end
endmodule

module decoder_2_4(E , In , Out);
input E; 
input [1:0] In;
output [3:0]Out; 
wire [3:0] Out;
assign Out = E ? 1'b1 << In : 4'h0;
endmodule
