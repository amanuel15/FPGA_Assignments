// testbench for assignment3Part2 
module testbench;
reg clk,rst;
reg [1:0] in;
wire out;
// instantiate the UUT unit under test
Assignment3Part2 uut(
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
		$dumpfile ("Assignment3Part2.vcd");
		$dumpvars ("0,testbench");
		end

always #5 clk=~clk;

endmodule








