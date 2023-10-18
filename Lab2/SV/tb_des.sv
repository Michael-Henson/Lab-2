`timescale 1ns/1ps
module stimulus;

   logic [63:0]  key;
   logic [63:0]  plaintext;
   logic [1:0]	 encrypt;
   logic [63:0]  ciphertext;
   logic [63:0]  IV;
   //assign IV = 64'h1111_1111_1111_1111;

   logic 	 clk;
   logic [31:0]  errors;
   logic [31:0]  vectornum;
   logic [63:0]  result;
   logic [7:0] 	 op;   
   logic [263:0] testvectors[511:0];
     
   
   integer 	 handle3;
   integer 	 desc3;

   DES dut (key, plaintext, encrypt, IV, ciphertext);

   // 1 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

   initial
     begin
	handle3 = $fopen("des.out");
	$readmemh("des.tv", testvectors);	
	vectornum = 0;
	errors = 0;		
	desc3 = handle3;
     end

   // apply test vectors on rising edge of clk
   always @(posedge clk)
     begin
	#1; {plaintext, op, key, IV, result} = testvectors[vectornum];
	#0 encrypt = op[1:0];		  
     end  

   // check results on falling edge of clk
  always @(negedge clk)
    begin
       if (result != ciphertext)
	 begin
	    errors = errors + 1;
	 end
       $fdisplay(desc3, "%h %h %b || %h || %h %b", 
		 plaintext, key, encrypt, ciphertext, result, (result == ciphertext));
       vectornum = vectornum + 1;
       if (testvectors[vectornum] === 200'bx) 
	 begin 
	    $display("%d tests completed with %d errors", 
		     vectornum, errors);
	    $finish;
	 end
    end

endmodule // stimulus
