module aes_key_expand_256(key,key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9,key_s10,key_s11,key_s12,key_s13,key_s14);
input	[255:0]	key;

output [127:0] key_s0,key_s1,key_s2,key_s3,key_s4,key_s5,key_s6,key_s7,key_s8,key_s9,key_s10,key_s11,key_s12,key_s13,key_s14;

reg	[31:0]	w0,w1,w2,w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15, w16, w17,
							w18, w19, w20, w21, w22, w23, w24, w25, w26, w27, w28, w29, w30, w31, w32, w33,
							w34, w35, w36, w37, w38, w39, w40, w41, w42, w43,w44,w45,w46,w47,w48,w49,w50,w51,w52,w53,w54,w55,w56,w57,w58,w59;
wire	[31:0]	subword1, subword2,subword3,subword4,subword5, subword6, subword7,subword8,subword9,subword10,subword11,subword12,subword13;			

always @*
begin

w0 =  key[255:224];
w1 =  key[223:192];
w2 =  key[191:160];
w3 =  key[159:128];
 
w4 =  key[127:096];
w5 =  key[095:064];
w6 =  key[063:032];
w7 =  key[031:000];
/////////
w8 =  w0^subword1^{8'h01,24'b0};
w9 =  w1^w8;
w10 =  w2^w9; 
w11 =  w3^w10;

w12  =  w4^subword2;
w13  =  w5^w12;
w14 =  w6^w13; 
w15 =  w7^w14;
////////////

w16  =  w8^subword3^{8'h02,24'b0};
w17  =  w9^w16;
w18  =  w10^w17; 
w19  =  w11^w18;


w20  =  w12^subword4;
w21  =  w13^w20;
w22  =  w14^w21; 
w23  =  w15^w22;
//////////////

w24  =  w16^subword5^{8'h04,24'b0};
w25  =  w17^w24;
w26  =  w18^w25; 
w27  =  w19^w26;


w28  =  w20^subword6;
w29  =  w21^w28;
w30  =  w22^w29; 
w31  =  w23^w30;

////////////////
w32  =  w24^subword7^{8'h08,24'b0};
w33  =  w25^w32;
w34  =  w26^w33; 
w35  =  w27^w34;

w36  =  w28^subword8;
w37  =  w29^w36;
w38  =  w30^w37; 
w39  =  w31^w38;
/////////////

w40  =  w32^subword9^{8'h10,24'b0};
w41  =  w33^w40;
w42  =  w34^w41; 
w43  =  w35^w42;

w44  =  w36^subword10;
w45  =  w37^w44;
w46  =  w38^w45; 
w47  =  w39^w46;

////////////////
w48  =  w40^subword11^{8'h20,24'b0};
w49  =  w41^w48;
w50  =  w42^w49; 
w51  =  w43^w50;

w52  =  w44^subword12;
w53  =  w45^w52;
w54  =  w46^w53; 
w55  =  w47^w54;

////////////////
w56  =  w48^subword13^{8'h40,24'b0};
w57  =  w49^w56;
w58  =  w50^w57; 
w59  =  w51^w58;
//////

end

//aes_rcon r1(rcon1,rcon2,rcon3,rcon4,rcon5,rcon6,rcon7);

sbox u0(	w7[23:16],subword1[31:24]);
sbox u1(	w7[15:8], subword1[23:16]);
sbox u2(	w7[7:0], subword1[15:8]);
sbox u3(	w7[31:24], subword1[7:0]); 

sbox u4(	w11[31:24], subword2[31:24]);
sbox u5(	w11[23:16], subword2[23:16]);
sbox u6(	w11[15:8], subword2[15:8]);
sbox u7(	w11[7:0], subword2[7:0]); 

//////
sbox u8(	w15[23:16], subword3[31:24]);
sbox u9(	w15[15:8], subword3[23:16]);
sbox u10(w15[7:0], subword3[15:08]);
sbox u11(w15[31:24], subword3[7:0]); 

sbox u12(w19[31:24], subword4[31:24]);
sbox u13(w19[23:16], subword4[23:16]);
sbox u14(w19[15:8], subword4[15:8]);
sbox u15(w19[7:0], subword4[7:0]); 

////////
sbox u16(w23[23:16],subword5[31:24]);
sbox u17(w23[15:8], subword5[23:16]);
sbox u18(w23[7:0], subword5[15:8]);
sbox u19(w23[31:24], subword5[7:0]); 

sbox u20(w27[31:24], subword6[31:24]);
sbox u21(w27[23:16], subword6[23:16]);
sbox u22(w27[15:8], subword6[15:8]);
sbox u23(w27[7:0], subword6[7:0]); 

/////////
sbox u24(w31[23:16], subword7[31:24]);
sbox u25(w31[15:08], subword7[23:16]);
sbox u26(w31[7:0], subword7[15:8]);
sbox u27(w31[31:24], subword7[7:0]); 

sbox u28(w35[31:24], subword8[31:24]);
sbox u29(w35[23:16], subword8[23:16]);
sbox u30(w35[15:8], subword8[15:8]);
sbox u31(w35[7:0], subword8[7:0]); 

///////
sbox u32(w39[23:16], subword9[31:24]);
sbox u33(w39[15:08], subword9[23:16]);
sbox u34(w39[7:0], subword9[15:8]);
sbox u35(w39[31:24], subword9[7:0]); 

sbox u36(w43[31:24], subword10[31:24]);
sbox u37(w43[23:16], subword10[23:16]);
sbox u38(w43[15:8], subword10[15:8]);
sbox u39(w43[7:0], subword10[7:0]); 

///////
sbox u40(w47[23:16], subword11[31:24]);
sbox u41(w47[15:08], subword11[23:16]);
sbox u42(w47[7:0], subword11[15:8]);
sbox u43(w47[31:24], subword11[7:0]); 

sbox u44(w51[31:24], subword12[31:24]);
sbox u45(w51[23:16], subword12[23:16]);
sbox u46(w51[15:8], subword12[15:8]);
sbox u47(w51[7:0], subword12[7:0]); 

///////
sbox u48(w55[23:16], subword13[31:24]);
sbox u49(w55[15:8], subword13[23:16]);
sbox u50(w55[7:0], subword13[15:8]);
sbox u51(w55[31:24], subword13[7:0]); 

///////


assign key_s0={w0,w1,w2,w3};
assign key_s1={w4,w5,w6,w7};
assign key_s2={w8,w9,w10,w11};
assign key_s3={w12,w13,w14,w15};
assign key_s4={w16,w17,w18,w19};
assign key_s5={w20,w21,w22,w23};
assign key_s6={w24,w25,w26,w27};
assign key_s7={w28,w29,w30,w31};
assign key_s8={w32,w33,w34,w35};
assign key_s9={w36,w37,w38,w39};
assign key_s10={w40,w41,w42,w43};
assign key_s11={w44,w45,w46,w47};
assign key_s12={w48,w49,w50,w51};
assign key_s13={w52,w53,w54,w55};
assign key_s14={w56,w57,w58,w59};

endmodule


