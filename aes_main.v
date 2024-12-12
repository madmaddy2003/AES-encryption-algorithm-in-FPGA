module aes_main(clk,data_in,data_out);
input clk;
input [127:0] data_in;
output reg [127:0] data_out;
reg [255:0] key = 256'h0123456789012345678901234567890123456789012345678901234567890123;
wire [127:0] key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9,key_s10,key_s11,key_s12,key_s13,key_s14;
wire [127:0]r0_data_out,r1_data_out,r2_data_out,r3_data_out,r4_data_out,r5_data_out,r6_data_out,r7_data_out,r8_data_out,r9_data_out,r10_data_out,r11_data_out,r12_data_out,r13_data_out,r14_data_out;

assign r0_data_out=data_in^key_s0;

aes_key_expand_256 a0(key,key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9,key_s10,key_s11,key_s12,key_s13,key_s14);
round r1(clk,r0_data_out,key_s1,r1_data_out);
round r2(clk,r1_data_out,key_s2,r2_data_out);
round r3(clk,r2_data_out,key_s3,r3_data_out);
round r4(clk,r3_data_out,key_s4,r4_data_out);
round r5(clk,r4_data_out,key_s5,r5_data_out);
round r6(clk,r5_data_out,key_s6,r6_data_out);
round r7(clk,r6_data_out,key_s7,r7_data_out);
round r8(clk,r7_data_out,key_s8,r8_data_out);
round r9(clk,r8_data_out,key_s9,r9_data_out);
round r10(clk,r9_data_out,key_s10,r10_data_out);
round r11(clk,r10_data_out,key_s11,r11_data_out);
round r12(clk,r11_data_out,key_s12,r12_data_out);
round r13(clk,r12_data_out,key_s13,r13_data_out);
last_round r14(clk,r13_data_out,key_s14,r14_data_out);
always @* 
begin
data_out <= r14_data_out;
end
endmodule
