/*
 Data Encryption Standard (S-DES)
 64-bit 16-round block cipher encryption and decryption algorithm 
 using 56-bit key (64-bit key with Parity).
 */

module GenerateKeys (Key, SubKey1, SubKey2, SubKey3, SubKey4,
		     SubKey5, SubKey6, SubKey7, SubKey8,
		     SubKey9, SubKey10, SubKey11, SubKey12,
		     SubKey13, SubKey14, SubKey15, SubKey16);
   
   // Generate SubKeys
   input logic [63:0]  Key;
   output logic [47:0] SubKey1;
   output logic [47:0] SubKey2;
   output logic [47:0] SubKey3;
   output logic [47:0] SubKey4;
   output logic [47:0] SubKey5;
   output logic [47:0] SubKey6;
   output logic [47:0] SubKey7;
   output logic [47:0] SubKey8;
   output logic [47:0] SubKey9;
   output logic [47:0] SubKey10;
   output logic [47:0] SubKey11;
   output logic [47:0] SubKey12;
   output logic [47:0] SubKey13;
   output logic [47:0] SubKey14;
   output logic [47:0] SubKey15;
   output logic [47:0] SubKey16;

    logic [55:0] LS1;
    logic [55:0] LS2;
    logic [55:0] LS3;
    logic [55:0] LS3b;
    logic [55:0] LS4;
    logic [55:0] LS4b;
    logic [55:0] LS5;
    logic [55:0] LS5b;
    logic [55:0] LS6;
    logic [55:0] LS6b;
    logic [55:0] LS7;
    logic [55:0] LS7b;
    logic [55:0] LS8;
    logic [55:0] LS8b;
    logic [55:0] LS9;
    logic [55:0] LS10;
    logic [55:0] LS10b;
    logic [55:0] LS11;
    logic [55:0] LS11b;
    logic [55:0] LS12;
    logic [55:0] LS12b;
    logic [55:0] LS13;
    logic [55:0] LS13b;
    logic [55:0] LS14;
    logic [55:0] LS14b;
    logic [55:0] LS15;
    logic [55:0] LS15b;
    logic [55:0] LS16;

   logic [55:0] pcKey;

   PC1 pc1 (Key, pcKey);

	LeftShift k1 (pcKey, LS1);
	PC2 p1 (LS1, SubKey1);
	LeftShift k2 (LS1, LS2);
	PC2 p2 (LS2, SubKey2);
	LeftShift k3 (LS2, LS3);
	LeftShift k32 (LS3, LS3b);
	PC2 p3 (LS3b, SubKey3);
	LeftShift k4 (LS3b, LS4);
	LeftShift k42 (LS4, LS4b);
	PC2 p4 (LS4b, SubKey4);
	LeftShift k5 (LS4b, LS5);
	LeftShift k52 (LS5, LS5b);
	PC2 p5 (LS5b, SubKey5);
	LeftShift k6 (LS5b, LS6);
	LeftShift k62 (LS6, LS6b);
	PC2 p6 (LS6b, SubKey6);
	LeftShift k7 (LS6b, LS7);
	LeftShift k72 (LS7, LS7b);
	PC2 p7 (LS7b, SubKey7);
	LeftShift k8 (LS7b, LS8);
	LeftShift k82 (LS8, LS8b);
	PC2 p8 (LS8b, SubKey8);
	LeftShift k92 (LS8b, LS9);
	PC2 p9 (LS9, SubKey9);
	LeftShift k10 (LS9, LS10);
	LeftShift k102 (LS10, LS10b);
	PC2 p10 (LS10b, SubKey10);
	LeftShift k11 (LS10b, LS11);
	LeftShift k112 (LS11, LS11b);
	PC2 p11 (LS11b, SubKey11);
	LeftShift k12 (LS11b, LS12);
	LeftShift k122 (LS12, LS12b);
	PC2 p12 (LS12b, SubKey12);
	LeftShift k13 (LS12b, LS13);
	LeftShift k132 (LS13, LS13b);
	PC2 p13 (LS13b, SubKey13);
	LeftShift k14 (LS13b, LS14);
	LeftShift k142 (LS14, LS14b);
	PC2 p14 (LS14b, SubKey14);
	LeftShift k15 (LS14b, LS15);
	LeftShift k152 (LS15, LS15b);
	PC2 p15 (LS15b, SubKey15);
	LeftShift k16 (LS15b, LS16);
	PC2 p16 (LS16, SubKey16);

endmodule // GenerateKeys

module LeftShift (inputKey, outputKey);

	input logic [55:0] inputKey;
	output logic [55:0] outputKey;
	logic [27:0] left_block;
	logic [27:0] right_block;

	assign left_block[27:1] = inputKey[54:28];
	assign left_block[0] = inputKey[55];
	assign right_block[27:1] = inputKey[26:0];
	assign right_block[0] = inputKey[27];

	assign outputKey[55:28] = left_block;
	assign outputKey[27:0] = right_block;

endmodule // LeftShift

module PC1 (key, outputKey);

   input logic [63:0]  key;
	logic [27:0] left_block;
    logic [27:0] right_block;

   output logic [55:0] outputKey;
	
	assign left_block [27] = key[64-57];
	assign left_block [26] = key[64-49];
	assign left_block [25] = key[64-41];
	assign left_block [24] = key[64-33];
	assign left_block [23] = key[64-25];
	assign left_block [22] = key[64-17];
	assign left_block [21] = key[64-9];
	assign left_block [20] = key[64-1];
	assign left_block [19] = key[64-58];
	assign left_block [18] = key[64-50];
	assign left_block [17] = key[64-42];
	assign left_block [16] = key[64-34];
	assign left_block [15] = key[64-26];
	assign left_block [14] = key[64-18];
	assign left_block [13] = key[64-10];
	assign left_block [12] = key[64-2];
	assign left_block [11] = key[64-59];
	assign left_block [10] = key[64-51];
	assign left_block [9] = key[64-43];
	assign left_block [8] = key[64-35];
	assign left_block [7] = key[64-27];
	assign left_block [6] = key[64-19];
	assign left_block [5] = key[64-11];
	assign left_block [4] = key[64-3];
   	assign left_block [3] = key[64-60];
   	assign left_block [2] = key[64-52];
	assign left_block [1] = key[64-44];
   	assign left_block [0] = key[64-36];

	assign right_block[27]= key[64-63];
  	assign right_block[26]= key[64-55];
   	assign right_block[25]= key[64-47];
	assign right_block[24]= key[64-39];
	assign right_block[23]= key[64-31];
	assign right_block[22]= key[64-23];
	assign right_block[21]= key[64-15];
	assign right_block[20]= key[64-7];
	assign right_block[19]= key[64-62];
	assign right_block[18]= key[64-54];
	assign right_block[17]= key[64-46];
	assign right_block[16]= key[64-38];
	assign right_block[15]= key[64-30];
	assign right_block[14]= key[64-22];
	assign right_block[13]= key[64-14];
	assign right_block[12]= key[64-6];
	assign right_block[11]= key[64-61];
	assign right_block[10]= key[64-53];
	assign right_block[9]= key[64-45];
	assign right_block[8]= key[64-37];
	assign right_block[7]= key[64-29];
	assign right_block[6]= key[64-21];
	assign right_block[5]= key[64-13];
	assign right_block[4]= key[64-5];
	assign right_block[3]= key[64-28];
	assign right_block[2]= key[64-20];
	assign right_block[1]= key[64-12];
	assign right_block[0]= key[64-4];

	assign outputKey [55:28] = left_block;
	assign outputKey [27:0] = right_block;

endmodule // PC1

module PC2 (whole_block, subkey);

   	output logic [47:0] subkey;
	input logic [55:0] whole_block;
   	assign subkey[47] = whole_block[56-14];
   	assign subkey[46] = whole_block[56-17];
   	assign subkey[45] = whole_block[56-11];
   	assign subkey[44] = whole_block[56-24];
   	assign subkey[43] = whole_block[56-1];
   	assign subkey[42] = whole_block[56-5];
   	assign subkey[41] = whole_block[56-3];
   	assign subkey[40] = whole_block[56-28];
   	assign subkey[39] = whole_block[56-15];
   	assign subkey[38] = whole_block[56-6];
   	assign subkey[37] = whole_block[56-21];
   	assign subkey[36] = whole_block[56-10];
   	assign subkey[35] = whole_block[56-23];
   	assign subkey[34] = whole_block[56-19];
   	assign subkey[33] = whole_block[56-12];
   	assign subkey[32] = whole_block[56-4];
   	assign subkey[31] = whole_block[56-26];
   	assign subkey[30] = whole_block[56-8];
   	assign subkey[29] = whole_block[56-16];
   	assign subkey[28] = whole_block[56-7];
   	assign subkey[27] = whole_block[56-27];
   	assign subkey[26] = whole_block[56-20];
   	assign subkey[25] = whole_block[56-13];
   	assign subkey[24] = whole_block[56-2];
   	assign subkey[23] = whole_block[56-41];
   	assign subkey[22] = whole_block[56-52];
   	assign subkey[21] = whole_block[56-31];
   	assign subkey[20] = whole_block[56-37];
   	assign subkey[19] = whole_block[56-47];
   	assign subkey[18] = whole_block[56-55];
   	assign subkey[17] = whole_block[56-30];
   	assign subkey[16] = whole_block[56-40];
   	assign subkey[15] = whole_block[56-51];
   	assign subkey[14] = whole_block[56-45];
   	assign subkey[13] = whole_block[56-33];
   	assign subkey[12] = whole_block[56-48];
   	assign subkey[11] = whole_block[56-44];
   	assign subkey[10] = whole_block[56-49];
   	assign subkey[9] = whole_block[56-39];
   	assign subkey[8] = whole_block[56-56];
   	assign subkey[7] = whole_block[56-34];
   	assign subkey[6] = whole_block[56-53];
   	assign subkey[5] = whole_block[56-46];
   	assign subkey[4] = whole_block[56-42];
   	assign subkey[3] = whole_block[56-50];
   	assign subkey[2] = whole_block[56-36];
   	assign subkey[1] = whole_block[56-29];
   	assign subkey[0] = whole_block[56-32];

endmodule // PC2

// Straight Function
module SF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [31:0] out_block;

   assign out_block [31]= inp_block [32-16];
   assign out_block [30]= inp_block [32-7];
   assign out_block [29]= inp_block [32-20];
   assign out_block [28]= inp_block [32-21];
   assign out_block [27]= inp_block [32-29];
   assign out_block [26]= inp_block [32-12];
   assign out_block [25]= inp_block [32-28];
   assign out_block [24]= inp_block [32-17];
   assign out_block [23]= inp_block [32-1];
   assign out_block [22]= inp_block [32-15];
   assign out_block [21]= inp_block [32-23];
   assign out_block [20]= inp_block [32-26];
   assign out_block [19]= inp_block [32-5];
   assign out_block [18]= inp_block [32-18];
   assign out_block [17]= inp_block [32-31];
   assign out_block [16]= inp_block [32-10];
   assign out_block [15]= inp_block [32-2];
   assign out_block [14]= inp_block [32-8];
   assign out_block [13]= inp_block [32-24];
   assign out_block [12]= inp_block [32-14];
assign out_block [11]= inp_block [32-32];
assign out_block [10]= inp_block [32-27];
assign out_block [09]= inp_block [32-3];
assign out_block [08]= inp_block [32-9];
assign out_block [07]= inp_block [32-19];
assign out_block [06]= inp_block [32-13];
assign out_block [05]= inp_block [32-30];
assign out_block [04]= inp_block [32-6];
assign out_block [03]= inp_block [32-22];
assign out_block [02]= inp_block [32-11];
assign out_block [01]= inp_block [32-4];
assign out_block [0]= inp_block [32-25];
endmodule // SF

// Expansion Function
module EF (inp_block, out_block);

input logic [31:0] inp_block;
output logic [47:0] out_block;
assign out_block[47]= inp_block[32-32];
assign out_block[46]= inp_block[32-1];
assign out_block[45]= inp_block[32-2];
assign out_block[44]= inp_block[32-3];
assign out_block[43]= inp_block[32-4];
assign out_block[42]= inp_block[32-5];
assign out_block[41]= inp_block[32-4];
assign out_block[40]= inp_block[32-5];
assign out_block[39]= inp_block[32-6];
assign out_block[38]= inp_block[32-7];
assign out_block[37]= inp_block[32-8];
assign out_block[36]= inp_block[32-9];
assign out_block[35]= inp_block[32-8];
assign out_block[34]= inp_block[32-9];
assign out_block[33]= inp_block[32-10];
assign out_block[32]= inp_block[32-11];
assign out_block[31]= inp_block[32-12];
assign out_block[30]= inp_block[32-13];
assign out_block[29]= inp_block[32-12];
assign out_block[28]= inp_block[32-13];
assign out_block[27]= inp_block[32-14];
assign out_block[26]= inp_block[32-15];
assign out_block[25]= inp_block[32-16];
assign out_block[24]= inp_block[32-17];
assign out_block[23]= inp_block[32-16];
assign out_block[22]= inp_block[32-17];
assign out_block[21]= inp_block[32-18];
assign out_block[20]= inp_block[32-19];
assign out_block[19]= inp_block[32-20];
assign out_block[18]= inp_block[32-21];
assign out_block[17]= inp_block[32-20];
assign out_block[16]= inp_block[32-21];
assign out_block[15]= inp_block[32-22];
assign out_block[14]= inp_block[32-23];
assign out_block[13]= inp_block[32-24];
assign out_block[12]= inp_block[32-25];
assign out_block[11]= inp_block[32-24];
assign out_block[10]= inp_block[32-25];
assign out_block[9]= inp_block[32-26];
assign out_block[8]= inp_block[32-27];
assign out_block[7]= inp_block[32-28];
assign out_block[6]= inp_block[32-29];
assign out_block[5]= inp_block[32-28];
assign out_block[4]= inp_block[32-29];
assign out_block[3]= inp_block[32-30];
assign out_block[2]= inp_block[32-31];
assign out_block[1]= inp_block[32-32];
assign out_block[0]= inp_block[32-1];

endmodule // EF

module feistel (inp_block, subkey, out_block);

   input logic [31:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [31:0] out_block;

	logic [47:0] ep_out;
	logic [47:0] xor_out;
	logic [3:0] S1_out;
	logic [3:0] S2_out;
	logic [3:0] S3_out;
	logic [3:0] S4_out;
	logic [3:0] S5_out;
	logic [3:0] S6_out;
	logic [3:0] S7_out;
	logic [3:0] S8_out;
	logic [31:0] S_out;

   EF ty(inp_block, ep_out);
   assign xor_out = ep_out ^ subkey; 
   S1_Box ss1 (xor_out[47:42], S1_out);
   S2_Box ss2 (xor_out[41:36], S2_out);
   S3_Box ss3 (xor_out[35:30], S3_out);
   S4_Box ss4 (xor_out[29:24], S4_out);
   S5_Box ss5 (xor_out[23:18], S5_out);
   S6_Box ss6 (xor_out[17:12], S6_out);
   S7_Box ss7 (xor_out[11:6], S7_out);
   S8_Box ss8 (xor_out[5:0], S8_out);

   assign S_out =  {S1_out, S2_out, S3_out, S4_out, S5_out, S6_out, S7_out, S8_out};
   SF s1 (S_out, out_block);

endmodule // Feistel

// DES block round
module round (inp_block, subkey, out_block);

   input logic [63:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [63:0] out_block;

   logic [31:0] right_block;
   logic [31:0] left_block;
   logic [31:0] right_block2;
   logic [31:0] left_block2;
   logic [31:0] feistel_out;

   assign right_block = inp_block[31:0];
   assign left_block = inp_block[63:32];

   feistel f1 (right_block, subkey, feistel_out);
   assign left_block2 = right_block;
   assign right_block2 = (feistel_out ^ left_block);
   assign out_block = {left_block2, right_block2};

endmodule // round1

// Initial Permutation
module IP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-58];
   assign out_block[62] = inp_block[64-50];
   assign out_block[61] = inp_block[64-42];
   assign out_block[60] = inp_block[64-34];
   assign out_block[59] = inp_block[64-26];
   assign out_block[58] = inp_block[64-18];
   assign out_block[57] = inp_block[64-10];
   assign out_block[56] = inp_block[64-2];
   assign out_block[55] = inp_block[64-60];
   assign out_block[54] = inp_block[64-52];   
   assign out_block[53] = inp_block[64-44];   
   assign out_block[52] = inp_block[64-36];
   assign out_block[51] = inp_block[64-28];
   assign out_block[50] = inp_block[64-20];
   assign out_block[49] = inp_block[64-12];
   assign out_block[48] = inp_block[64-4];
   assign out_block[47] = inp_block[64-62];
   assign out_block[46] = inp_block[64-54];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-38];   
   assign out_block[43] = inp_block[64-30];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-14];
   assign out_block[40] = inp_block[64-6];
   assign out_block[39] = inp_block[64-64];
   assign out_block[38] = inp_block[64-56];
   assign out_block[37] = inp_block[64-48];
   assign out_block[36] = inp_block[64-40];
   assign out_block[35] = inp_block[64-32];
   assign out_block[34] = inp_block[64-24];   
   assign out_block[33] = inp_block[64-16];
   assign out_block[32] = inp_block[64-8];   
   assign out_block[31] = inp_block[64-57];
   assign out_block[30] = inp_block[64-49];
   assign out_block[29] = inp_block[64-41];
   assign out_block[28] = inp_block[64-33];
   assign out_block[27] = inp_block[64-25];
   assign out_block[26] = inp_block[64-17];
   assign out_block[25] = inp_block[64-9];   
   assign out_block[24] = inp_block[64-1];   
   assign out_block[23] = inp_block[64-59];
   assign out_block[22] = inp_block[64-51];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-35];
   assign out_block[19] = inp_block[64-27];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-11];
   assign out_block[16] = inp_block[64-3];
   assign out_block[15] = inp_block[64-61];
   assign out_block[14] = inp_block[64-53];   
   assign out_block[13] = inp_block[64-45];
   assign out_block[12] = inp_block[64-37];   
   assign out_block[11] = inp_block[64-29];
   assign out_block[10] = inp_block[64-21];
   assign out_block[9] = inp_block[64-13];
   assign out_block[8] = inp_block[64-5];
   assign out_block[7] = inp_block[64-63];
   assign out_block[6] = inp_block[64-55];
   assign out_block[5] = inp_block[64-47];
   assign out_block[4] = inp_block[64-39];   
   assign out_block[3] = inp_block[64-31];
   assign out_block[2] = inp_block[64-23];    
   assign out_block[1] = inp_block[64-15];
   assign out_block[0] = inp_block[64-7];   

endmodule // IP

// Final Permutation
module FP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-40];
   assign out_block[62] = inp_block[64-8];
   assign out_block[61] = inp_block[64-48];
   assign out_block[60] = inp_block[64-16];
   assign out_block[59] = inp_block[64-56];
   assign out_block[58] = inp_block[64-24];
   assign out_block[57] = inp_block[64-64];
   assign out_block[56] = inp_block[64-32];   
   assign out_block[55] = inp_block[64-39];
   assign out_block[54] = inp_block[64-7];   
   assign out_block[53] = inp_block[64-47];   
   assign out_block[52] = inp_block[64-15];
   assign out_block[51] = inp_block[64-55];
   assign out_block[50] = inp_block[64-23];
   assign out_block[49] = inp_block[64-63];
   assign out_block[48] = inp_block[64-31];   
   assign out_block[47] = inp_block[64-38];
   assign out_block[46] = inp_block[64-6];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-14];   
   assign out_block[43] = inp_block[64-54];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-62];
   assign out_block[40] = inp_block[64-30];   
   assign out_block[39] = inp_block[64-37];
   assign out_block[38] = inp_block[64-5];
   assign out_block[37] = inp_block[64-45];
   assign out_block[36] = inp_block[64-13];
   assign out_block[35] = inp_block[64-53];
   assign out_block[34] = inp_block[64-21];   
   assign out_block[33] = inp_block[64-61];
   assign out_block[32] = inp_block[64-29];   
   assign out_block[31] = inp_block[64-36];
   assign out_block[30] = inp_block[64-4];
   assign out_block[29] = inp_block[64-44];
   assign out_block[28] = inp_block[64-12];
   assign out_block[27] = inp_block[64-52];
   assign out_block[26] = inp_block[64-20];
   assign out_block[25] = inp_block[64-60];   
   assign out_block[24] = inp_block[64-28];   
   assign out_block[23] = inp_block[64-35];
   assign out_block[22] = inp_block[64-3];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-11];
   assign out_block[19] = inp_block[64-51];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-59];
   assign out_block[16] = inp_block[64-27];   
   assign out_block[15] = inp_block[64-34];
   assign out_block[14] = inp_block[64-2];   
   assign out_block[13] = inp_block[64-42];
   assign out_block[12] = inp_block[64-10];   
   assign out_block[11] = inp_block[64-50];
   assign out_block[10] = inp_block[64-18];
   assign out_block[9] = inp_block[64-58];
   assign out_block[8] = inp_block[64-26];   
   assign out_block[7] = inp_block[64-33];
   assign out_block[6] = inp_block[64-1];
   assign out_block[5] = inp_block[64-41];   
   assign out_block[4] = inp_block[64-9];
   assign out_block[3] = inp_block[64-49];    
   assign out_block[2] = inp_block[64-17];
   assign out_block[1] = inp_block[64-57];
   assign out_block[0] = inp_block[64-25];  

endmodule // FP

module S1_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd14;             
	  6'd1  : out_bits = 4'd4;             
	  6'd2  : out_bits = 4'd13;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd2;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd10;             
	  6'd10 : out_bits = 4'd6;             
	  6'd11 : out_bits = 4'd12;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd9;             
	  6'd14 : out_bits = 4'd0;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd0;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd7;             
	  6'd19 : out_bits = 4'd4;             
	  6'd20 : out_bits = 4'd14;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd10;             
	  6'd25 : out_bits = 4'd6;             
	  6'd26 : out_bits = 4'd12;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd9;             
	  6'd29 : out_bits = 4'd5;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd1;             
	  6'd34 : out_bits = 4'd14;             
	  6'd35 : out_bits = 4'd8;             
	  6'd36 : out_bits = 4'd13;             
	  6'd37 : out_bits = 4'd6;             
	  6'd38 : out_bits = 4'd2;             
	  6'd39 : out_bits = 4'd11;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd12;             
	  6'd42 : out_bits = 4'd9;             
	  6'd43 : out_bits = 4'd7;             
	  6'd44 : out_bits = 4'd3;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd0;             
	  6'd48 : out_bits = 4'd15;             
	  6'd49 : out_bits = 4'd12;             
	  6'd50 : out_bits = 4'd8;             
	  6'd51 : out_bits = 4'd2;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd1;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd5;        
	  6'd57 : out_bits = 4'd11;        
	  6'd58 : out_bits = 4'd3;       
	  6'd59 : out_bits = 4'd14;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd13;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S1_Box

module S2_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})             
	  6'd0  : out_bits = 4'd15;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd11;             
	  6'd6  : out_bits = 4'd3;             
	  6'd7  : out_bits = 4'd4;             
	  6'd8  : out_bits = 4'd9;             
	  6'd9  : out_bits = 4'd7;             
	  6'd10 : out_bits = 4'd2;             
	  6'd11 : out_bits = 4'd13;             
	  6'd12 : out_bits = 4'd12;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd10;             
	  6'd16 : out_bits = 4'd3;             
	  6'd17 : out_bits = 4'd13;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd15;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd8;             
	  6'd23 : out_bits = 4'd14;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd1;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd6;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd11;             
	  6'd31 : out_bits = 4'd5;             
	  6'd32 : out_bits = 4'd0;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd7;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd4;             
	  6'd38 : out_bits = 4'd13;             
	  6'd39 : out_bits = 4'd1;             
	  6'd40 : out_bits = 4'd5;             
	  6'd41 : out_bits = 4'd8;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd6;             
	  6'd44 : out_bits = 4'd9;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd2;             
	  6'd47 : out_bits = 4'd15;             
	  6'd48 : out_bits = 4'd13;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd10;             
	  6'd51 : out_bits = 4'd1;             
	  6'd52 : out_bits = 4'd3;             
	  6'd53 : out_bits = 4'd15;            
	  6'd54 : out_bits = 4'd4;             
	  6'd55 : out_bits = 4'd2;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd6;        
	  6'd58 : out_bits = 4'd7;       
	  6'd59 : out_bits = 4'd12;       
	  6'd60 : out_bits = 4'd0;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd14;      
	  6'd63 : out_bits = 4'd9;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S2_Box

module S3_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd10;             
	  6'd1  : out_bits = 4'd0;             
	  6'd2  : out_bits = 4'd9;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd3;             
	  6'd6  : out_bits = 4'd15;             
	  6'd7  : out_bits = 4'd5;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd12;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd4;             
	  6'd14 : out_bits = 4'd2;             
	  6'd15 : out_bits = 4'd8;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd7;             
	  6'd18 : out_bits = 4'd0;             
	  6'd19 : out_bits = 4'd9;             
	  6'd20 : out_bits = 4'd3;             
	  6'd21 : out_bits = 4'd4;             
	  6'd22 : out_bits = 4'd6;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd2;             
	  6'd25 : out_bits = 4'd8;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd12;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd15;             
	  6'd31 : out_bits = 4'd1;             
	  6'd32 : out_bits = 4'd13;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd9;             
	  6'd36 : out_bits = 4'd8;             
	  6'd37 : out_bits = 4'd15;             
	  6'd38 : out_bits = 4'd3;             
	  6'd39 : out_bits = 4'd0;             
	  6'd40 : out_bits = 4'd11;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd2;             
	  6'd43 : out_bits = 4'd12;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd14;             
	  6'd47 : out_bits = 4'd7;             
	  6'd48 : out_bits = 4'd1;             
	  6'd49 : out_bits = 4'd10;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd0;             
	  6'd52 : out_bits = 4'd6;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd4;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd14;       
	  6'd59 : out_bits = 4'd3;       
	  6'd60 : out_bits = 4'd11;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd12;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S3_Box

module S4_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd7;             
	  6'd1  : out_bits = 4'd13;             
	  6'd2  : out_bits = 4'd14;            
	  6'd3  : out_bits = 4'd3;             
	  6'd4  : out_bits = 4'd0;             
	  6'd5  : out_bits = 4'd6;             
	  6'd6  : out_bits = 4'd9;             
	  6'd7  : out_bits = 4'd10;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd2;             
	  6'd10 : out_bits = 4'd8;             
	  6'd11 : out_bits = 4'd5;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd12;             
	  6'd14 : out_bits = 4'd4;             
	  6'd15 : out_bits = 4'd15;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd8;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd5;             
	  6'd20 : out_bits = 4'd6;             
	  6'd21 : out_bits = 4'd15;             
	  6'd22 : out_bits = 4'd0;             
	  6'd23 : out_bits = 4'd3;             
	  6'd24 : out_bits = 4'd4;             
	  6'd25 : out_bits = 4'd7;             
	  6'd26 : out_bits = 4'd2;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd1;             
	  6'd29 : out_bits = 4'd10;             
	  6'd30 : out_bits = 4'd14;             
	  6'd31 : out_bits = 4'd9;             
	  6'd32 : out_bits = 4'd10;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd9;             
	  6'd35 : out_bits = 4'd0;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd11;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd13;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd3;             
	  6'd43 : out_bits = 4'd14;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd2;             
	  6'd46 : out_bits = 4'd8;             
	  6'd47 : out_bits = 4'd4;             
	  6'd48 : out_bits = 4'd3;             
	  6'd49 : out_bits = 4'd15;             
	  6'd50 : out_bits = 4'd0;             
	  6'd51 : out_bits = 4'd6;             
	  6'd52 : out_bits = 4'd10;             
	  6'd53 : out_bits = 4'd1;            
	  6'd54 : out_bits = 4'd13;             
	  6'd55 : out_bits = 4'd8;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd4;        
	  6'd58 : out_bits = 4'd5;       
	  6'd59 : out_bits = 4'd11;       
	  6'd60 : out_bits = 4'd12;       
	  6'd61 : out_bits = 4'd7;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd14;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S4_Box

module S5_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd2;             
	  6'd1  : out_bits = 4'd12;             
	  6'd2  : out_bits = 4'd4;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd7;             
	  6'd5  : out_bits = 4'd10;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd6;             
	  6'd8  : out_bits = 4'd8;             
	  6'd9  : out_bits = 4'd5;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd15;             
	  6'd12 : out_bits = 4'd13;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd14;             
	  6'd15 : out_bits = 4'd9;             
	  6'd16 : out_bits = 4'd14;             
	  6'd17 : out_bits = 4'd11;             
	  6'd18 : out_bits = 4'd2;             
	  6'd19 : out_bits = 4'd12;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd7;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd5;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd15;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd3;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd2;             
	  6'd34 : out_bits = 4'd1;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd13;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd8;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd9;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd5;             
	  6'd44 : out_bits = 4'd6;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd0;             
	  6'd47 : out_bits = 4'd14;             
	  6'd48 : out_bits = 4'd11;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd12;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd14;            
	  6'd54 : out_bits = 4'd2;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd6;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd9;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd4;       
	  6'd62 : out_bits = 4'd5;      
	  6'd63 : out_bits = 4'd3;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S5_Box

module S6_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd12;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd10;            
	  6'd3  : out_bits = 4'd15;             
	  6'd4  : out_bits = 4'd9;             
	  6'd5  : out_bits = 4'd2;             
	  6'd6  : out_bits = 4'd6;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd0;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd4;             
	  6'd12 : out_bits = 4'd14;             
	  6'd13 : out_bits = 4'd7;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd11;             
	  6'd16 : out_bits = 4'd10;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd2;             
	  6'd20 : out_bits = 4'd7;             
	  6'd21 : out_bits = 4'd12;             
	  6'd22 : out_bits = 4'd9;             
	  6'd23 : out_bits = 4'd5;             
	  6'd24 : out_bits = 4'd6;             
	  6'd25 : out_bits = 4'd1;             
	  6'd26 : out_bits = 4'd13;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd9;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd15;             
	  6'd35 : out_bits = 4'd5;             
	  6'd36 : out_bits = 4'd2;             
	  6'd37 : out_bits = 4'd8;             
	  6'd38 : out_bits = 4'd12;             
	  6'd39 : out_bits = 4'd3;             
	  6'd40 : out_bits = 4'd7;             
	  6'd41 : out_bits = 4'd0;             
	  6'd42 : out_bits = 4'd4;             
	  6'd43 : out_bits = 4'd10;             
	  6'd44 : out_bits = 4'd1;             
	  6'd45 : out_bits = 4'd13;             
	  6'd46 : out_bits = 4'd11;             
	  6'd47 : out_bits = 4'd6;             
	  6'd48 : out_bits = 4'd4;             
	  6'd49 : out_bits = 4'd3;             
	  6'd50 : out_bits = 4'd2;             
	  6'd51 : out_bits = 4'd12;             
	  6'd52 : out_bits = 4'd9;             
	  6'd53 : out_bits = 4'd5;            
	  6'd54 : out_bits = 4'd15;             
	  6'd55 : out_bits = 4'd10;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd14;        
	  6'd58 : out_bits = 4'd1;       
	  6'd59 : out_bits = 4'd7;       
	  6'd60 : out_bits = 4'd6;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd8;      
	  6'd63 : out_bits = 4'd13;	  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S6_Box

module S7_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd4;             
	  6'd1  : out_bits = 4'd11;             
	  6'd2  : out_bits = 4'd2;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd15;             
	  6'd5  : out_bits = 4'd0;             
	  6'd6  : out_bits = 4'd8;             
	  6'd7  : out_bits = 4'd13;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd12;             
	  6'd10 : out_bits = 4'd9;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd10;             
	  6'd14 : out_bits = 4'd6;             
	  6'd15 : out_bits = 4'd1;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd0;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd9;             
	  6'd22 : out_bits = 4'd1;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd14;             
	  6'd25 : out_bits = 4'd3;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd2;             
	  6'd29 : out_bits = 4'd15;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd1;             
	  6'd33 : out_bits = 4'd4;             
	  6'd34 : out_bits = 4'd11;             
	  6'd35 : out_bits = 4'd13;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd3;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd14;             
	  6'd40 : out_bits = 4'd10;             
	  6'd41 : out_bits = 4'd15;             
	  6'd42 : out_bits = 4'd6;             
	  6'd43 : out_bits = 4'd8;             
	  6'd44 : out_bits = 4'd0;             
	  6'd45 : out_bits = 4'd5;             
	  6'd46 : out_bits = 4'd9;             
	  6'd47 : out_bits = 4'd2;             
	  6'd48 : out_bits = 4'd6;             
	  6'd49 : out_bits = 4'd11;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd8;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd4;            
	  6'd54 : out_bits = 4'd10;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd5;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd15;       
	  6'd60 : out_bits = 4'd14;       
	  6'd61 : out_bits = 4'd2;       
	  6'd62 : out_bits = 4'd3;      
	  6'd63 : out_bits = 4'd12;  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S7_Box

module S8_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd13;             
	  6'd1  : out_bits = 4'd2;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd4;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd1;             
	  6'd8  : out_bits = 4'd10;             
	  6'd9  : out_bits = 4'd9;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd14;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd12;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd1;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd13;             
	  6'd19 : out_bits = 4'd8;             
	  6'd20 : out_bits = 4'd10;             
	  6'd21 : out_bits = 4'd3;             
	  6'd22 : out_bits = 4'd7;             
	  6'd23 : out_bits = 4'd4;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd5;             
	  6'd26 : out_bits = 4'd6;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd14;             
	  6'd30 : out_bits = 4'd9;             
	  6'd31 : out_bits = 4'd2;             
	  6'd32 : out_bits = 4'd7;             
	  6'd33 : out_bits = 4'd11;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd1;             
	  6'd36 : out_bits = 4'd9;             
	  6'd37 : out_bits = 4'd12;             
	  6'd38 : out_bits = 4'd14;             
	  6'd39 : out_bits = 4'd2;             
	  6'd40 : out_bits = 4'd0;             
	  6'd41 : out_bits = 4'd6;             
	  6'd42 : out_bits = 4'd10;             
	  6'd43 : out_bits = 4'd13;             
	  6'd44 : out_bits = 4'd15;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd8;             
	  6'd48 : out_bits = 4'd2;             
	  6'd49 : out_bits = 4'd1;             
	  6'd50 : out_bits = 4'd14;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd10;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd15;        
	  6'd57 : out_bits = 4'd12;        
	  6'd58 : out_bits = 4'd9;       
	  6'd59 : out_bits = 4'd0;       
	  6'd60 : out_bits = 4'd3;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd11;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S8_Box

module DES (input logic [63:0] key, input logic [63:0] plaintext, 
	    input logic [1:0] encrypt, input logic [63:0] IV, output logic [63:0] ciphertext);

   logic [47:0] 	SubKey1, SubKey2, SubKey3, SubKey4;   
   logic [47:0] 	SubKey5, SubKey6, SubKey7, SubKey8;   
   logic [47:0] 	SubKey9, SubKey10, SubKey11, SubKey12;
   logic [47:0] 	SubKey13, SubKey14, SubKey15, SubKey16;
	logic [47:0]	mux1, mux2, mux3, mux4, mux5, mux6, mux7, mux8, mux9, mux10, mux11, mux12, mux13, mux14, mux15, mux16;
   logic [63:0] 	ip_out;
   logic [63:0] 	r1_out, r2_out, r3_out, r4_out, r5_out, r6_out, r7_out, r8_out, r9_out, r10_out, r11_out, r12_out, r13_out, r14_out, r15_out, r16_out;
   logic [63:0]		IV_out; 
   logic [63:0]		IV_out2;
   logic [63:0]		ip_in;
   logic [63:0]		FP_out;

	

   // SubKey generation
   GenerateKeys k1 (key, SubKey1, SubKey2, SubKey3, SubKey4,
		    SubKey5, SubKey6, SubKey7, SubKey8,
		    SubKey9, SubKey10, SubKey11, SubKey12,
		    SubKey13, SubKey14, SubKey15, SubKey16);
   // encrypt (encrypt=1) or decrypt (encrypt=0) 

	assign mux1 = encrypt[0]? (SubKey1):(SubKey16);
	assign mux2 = encrypt[0]? (SubKey2):(SubKey15);
	assign mux3 = encrypt[0]? (SubKey3):(SubKey14);
	assign mux4 = encrypt[0]? (SubKey4):(SubKey13);
	assign mux5 = encrypt[0]? (SubKey5):(SubKey12);
	assign mux6 = encrypt[0]? (SubKey6):(SubKey11);
	assign mux7 = encrypt[0]? (SubKey7):(SubKey10);
	assign mux8 = encrypt[0]? (SubKey8):(SubKey9);
	assign mux9 = encrypt[0]? (SubKey9):(SubKey8);
	assign mux10 = encrypt[0]? (SubKey10):(SubKey7);
	assign mux11 = encrypt[0]? (SubKey11):(SubKey6);
	assign mux12 = encrypt[0]? (SubKey12):(SubKey5);
	assign mux13 = encrypt[0]? (SubKey13):(SubKey4);
	assign mux14 = encrypt[0]? (SubKey14):(SubKey3);
	assign mux15 = encrypt[0]? (SubKey15):(SubKey2);
	assign mux16 = encrypt[0]? (SubKey16):(SubKey1);

	assign IV_out = encrypt[1]? (plaintext ^ IV):(plaintext);
	assign ip_in = encrypt[0]? (IV_out):(plaintext);

   // Initial Permutation (IP)
   IP b1 (ip_in, ip_out);
   // round 1
   round q1 (ip_out, mux1, r1_out);
   // round 2
   round q2 (r1_out, mux2, r2_out);
   // round 3
	round q3 (r2_out, mux3, r3_out);
   // round 4
	round q4 (r3_out, mux4, r4_out);
   // round 5
	round q5 (r4_out, mux5, r5_out);
   // round 6
	round q6 (r5_out, mux6, r6_out);
   // round 7
	round q7 (r6_out, mux7, r7_out);
   // round 8
	round q8 (r7_out, mux8, r8_out);
   // round 9
	round q9 (r8_out, mux9, r9_out);
   // round 10
   round q10 (r9_out, mux10, r10_out);
   // round 11
   round q11 (r10_out, mux11, r11_out);
   // round 12
   round q12 (r11_out, mux12, r12_out);
   // round 13
   round q13 (r12_out, mux13, r13_out);
   // round 14
   round q14 (r13_out, mux14, r14_out);
   // round 15
   round q15 (r14_out, mux15, r15_out);
   // round 16
   round q16(r15_out, mux16, r16_out);
   // Final Permutation (IP^{-1}) (swap output of round16)
   FP FP({r16_out[31:0], r16_out[63:32]}, FP_out);


	assign IV_out2 = encrypt[1]? (IV ^ FP_out):(FP_out);
   	assign ciphertext = encrypt[0]? (FP_out):(IV_out2);

endmodule // DES


