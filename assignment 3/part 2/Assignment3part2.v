module Assignment3part2(clk,rst,in,out);
input clk,rst;
input[1:0] in;
output reg[1:0] out;

// list the number of states here excluding state 3 because it's impossible to represent through 0 and 1 under binary digits of 4 possibilities 
parameter S0= 2'b00;   // state 0  0 cents
parameter S1= 2'b01;   // state 1  25 cents
parameter S2= 2'b10;   // state 2  50 cents
parameter S4= 2'b11;   // state 4  1 birr coin

reg[1:0] current_state,next_state;
always @(posedge clk)
		begin
				if(rst==1)
				begin
				current_state=0;
				next_state=0; 
				end
				else
				begin
					current_state=next_state;
						case(current_state)
						S0:if(in==0)   // reset state
								begin     // next_state goes to the state 0
								next_state=S0;
								out=0;
								end
								else if(in==2'b01)
								begin      // next_state goes to the state 1
								next_state=S1;
								out=0; 
								end
								else if(in==2'b10)
								begin     // next_state goes to the state 2
								next_state=S2;
								out=0;
								end
								else if(in==2'b11)
								begin     // next_state goes to the state 4
								next_state=S4;
								out=0;
								end
						
						// end of state 0
							S1:if(in==0) // 25 cent state
									begin     // next_state goes to the state 0
									next_state=S0;
									out=0;
									end
									else if(in==2'b01)
									begin     //next_state goes to the state 2
									next_state=S2;
									out=0; 
									end
									else if(in==2'b10)
									begin       //next_state goes to the state 4
									next_state=S4;
									out=0;
									end
									else if(in==2'b11)
									begin     //next_state goes to the state 0
									next_state=S0;
									out=1;
									end
						
						// end of state 1
							S2:if(in==0) // 50 cent state
									begin     //next_state goes to the state 0
									next_state=S0;
									out=0;
									end
									else if(in==2'b01)
									begin       //next_state goes to the state 4
									next_state=S4;
									out=0; 
									end
									else if(in==2'b10)
									begin     //next_state goes to the state 0
									next_state=S0;
									out=1;
									end
									else if(in==2'b11)
									begin    //next_state goes to the state 0
									next_state=S0;
									out=1;
									end
						
						// end of state 2
							S4:if(in==0)     // 1 birr state
									begin     // next_state goes to the state 0
									next_state=S0;
									out=0;
									end
									else if(in==2'b01)
									begin          //next_state goes to the state 4
									next_state=S4; 
									out=0; 
									end
									else if(in==2'b10)
									begin       //next_state goes to the state 0
									next_state=S0;
									out=1;
									end
									else if(in==2'b11)
									begin           //next_state goes to the state 0
									next_state=S0;
									out=1;
									end
						
						// end of state 4
						endcase
					end
end
endmodule





// testbench for assignment3 
module testbench;
reg clk,rst;
reg [1:0] in;
wire out;
// instantiate the UUT unit under test
Assignment3 uut(
.clk(clk),
.rst(rst),
.in(in),
.out(out)
);

initial
		begin
		clk=0;
		rst=1;
		#6 rst=0;
		in=1;
		#20 in=2;
		$dumpfile ("Assignment3.vcd");
		$dumpvars ("0,testbench");
		end

always #5 clk=~clk;

endmodule

















