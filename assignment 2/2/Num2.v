module Num2(w1,w2,z);
input w1,w2;
output integer z;
integer count;
always @ (count or w1 or w2 or z)
		for(count=0; count < 4 ; count=count+1)
		begin
		if(w1==w2)
			z=1;
		else
		  z=0;
		  end
	endmodule
			

// or we can do like this using repeat 4 times
module Num2(w1,w2,z);
input w1,w2;
output  integer z;
reg [1:0] z;
always @ (*)
		repeat(4)
		begin
		if(w1==w2)
			z=1;
		else
		  z=0;
		  end
	endmodule
			