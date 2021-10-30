
	/*
	Derive a minimal state table and a suitable circuit for a single-input and single-output 
	Moore type FSM that produces an output of 1
	if in the input sequence it detects either 110 or 101 patterns.
	 Overlapping sequences should be detected.
	*/


module NUM3(input1,output1);
			input input1;
			output integer output1;
			 integer k;
			 integer l;
			 integer m;
          integer count=0 ;
			 // for the 110 sequences
		always @ (count or input1 or output1)

			 begin
					for(count=0; count < 2 ; count=count+1)
					begin
					
					if(input1==1 && count==0)
						 k=1;
					if(input1==1 && count==1)
					    l=1;
				   if(input1==0	&& count==2)
					   m=1;
					if(k==1 && l==1 && m==1)
						 output1=1;
					  else
					  output1=0;
					  end		 
	      end	
				
	endmodule
	
	
	module NUM101(input1,output1);
			input input1;
			output integer output1;
			 integer k;
			 integer l;
			 integer m;
          integer count=0 ;
			 // for the 101 sequences
		always @ (count or input1 or output1)

			 begin
					for(count=0; count < 2 ; count=count+1)
					begin					
					if(input1==1 && count==0)
						 k=1;
					if(input1==0 && count==1)
					    l=1;
				   if(input1==1 && count==2)
					   m=1;
					if(k==1 && l==1 && m==1)
						 output1=1;
					  else
					  output1=0;
					  end		 
	      end			
	endmodule
	
			
			