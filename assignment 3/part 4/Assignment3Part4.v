module Assignment3Part4(SW, LEDR, HEX0, HEX1,HEX2,HEX3);
  input [17:0] SW;
  output [0:6] HEX0, HEX1,HEX2,HEX3;  // 7 seg display
  wire [2:0] M4,M3,M2,M1,M0;
  output [17:0] LEDR;
  assign LEDR = SW;

  wire [2:0] S0O,S11,S22,S33;
   // let the symbols of coca will be printed on these switch's
   // SW[14:12] C
	// SW[11:9] O
	// SW[8:6]  C
	// SW[5:3]   A 

                         // C       O            C         A             
coca  show0(SW[17:15], SW[14:12], SW[11:9],  SW[8:6],  SW[5:3],S00); // to show on hex0
coca  show1(SW[17:15], SW[14:12], SW[11:9],  SW[8:6],  SW[5:3],S11); // to show on hex1
coca  show2(SW[17:15], SW[14:12], SW[11:9],  SW[8:6],  SW[5:3],S22); // to show on hex2
coca  show3(SW[17:15], SW[14:12], SW[11:9],  SW[8:6],  SW[5:3],S33); // to show on hex3
// display the output on the 7 HEX's

char_7seg out0(show0,HEX3);
char_7seg out1(show1,HEX2);
char_7seg out2(show2,HEX1);
char_7seg out3(show3,HEX0);


// just for the always statement


  reg [4:0] current_state, next_state;  
  
  parameter S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S4 = 2'b11;
  
  always @ (current_state or next_state or SW)
		  begin
		     
			   if(SW[2:0] == 3'b000 )
				begin
				current_state=next_state; 
				end
				else
				begin
					current_state=next_state;
						case(current_state)
						S0:if(SW[2:0]==2'b00)   
								begin     // next_state goes to the state 0
								next_state=S0;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/

								end
								else if(SW==2'b01)
								begin      // next_state goes to the state 1
								next_state=S1;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
								end
								else if(SW[2:0]==2'b10)
								begin     // next_state goes to the state 2
								next_state=S2;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
								end
								else if(SW[2:0]==2'b11)
								begin     // next_state goes to the state 4
								next_state=S4;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
								end
						
						// end of state 0
							S1:if(SW[2:0]==0) // 25 cent state
									begin     // next_state goes to the state 0
									next_state=S0;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
									else if(SW[2:0]==2'b01)
									begin     //next_state goes to the state 2
									next_state=S2;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
									else if(SW[2:0]==2'b10)
									begin       //next_state goes to the state 4
									next_state=S4;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
									else if(SW[2:0]==2'b11)
									begin     //next_state goes to the state 0
									next_state=S0;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
						
						// end of state 1
							S2:if(SW[2:0]==0) // 50 cent state
									begin     //next_state goes to the state 0
									next_state=S0;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
									else if(SW[2:0]==2'b01)
									begin       //next_state goes to the state 4
									next_state=S4;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
									else if(SW[2:0]==2'b10)
									begin     //next_state goes to the state 0
									next_state=S0;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
									else if(SW[2:0]==2'b11)
									begin    //next_state goes to the state 0
									next_state=S0;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
						
						// end of state 2
							S4:if(SW[2:0]==0)     // 1 birr state
									begin     // next_state goes to the state 0
									next_state=S0;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
									else if(SW[2:0]==2'b01)
									begin          //next_state goes to the state 4
									next_state=S4; 
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
									else if(SW[2:0]==2'b10)
									begin       //next_state goes to the state 0
									next_state=S0;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
									else if(SW[2:0]==2'b11)
									begin           //next_state goes to the state 0
									next_state=S0;
								/*
								   char_7seg (show0,HEX3);
									char_7seg (show1,HEX2);
									char_7seg (show2,HEX1);
									char_7seg (show3,HEX0);
								*/
									end
						
						// end of state 4
						endcase
					end
end




 
  endmodule
  
  
  
  // let's write the word coca here
  module coca (sw,c,o,a,x,show);
  input [2:0] sw,o,c,a,x;
  output [2:0] show;
  assign show=(sw== 3'b000 )? c:
           (sw == 3'b001 )? o:
           (sw== 3'b010 )? a:x;
  endmodule
  
  
  //display on 7 segment
module char_7seg(sw,hex1);
input [2:0]sw;
output [6:0] hex1;
// the 7 segment displays = {6,5,4,3,2,1,0;

assign hex1= (sw[2:0] == 3'b000 )? 7'b100_0110: // C
             (sw[2:0]  == 3'b001 )?7'b100_0000: //O
             (sw[2:0]  == 3'b010 )?7'b000_1000:7'b111_1111 ; //A 
				 

				 /*assign hex2= (sw[2:0] == 3'b000 )? 7'b100_0110: // C
             (sw[2:0]  == 3'b001 )?7'b100_0000: //O
             (sw[2:0]  == 3'b010 )?7'b000_1000:7'b111_1111 ; //A 
				 */
				 
endmodule
  