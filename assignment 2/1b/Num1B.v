module Num1B(a,b,c,d,f);
input a,b,c,d;
output f;
wire n1,n2,n3,n4,n5,n6,n7;
nor Nor1(n1,a);
nor Nor2(n2,b,c);
nor Nor3(n3,n1,n2);

nor Nor4(n4,n3);

nor Nor5(n5,d);
nor Nor6(N6,n5,e);
nor Nor7(f,n4,n6);
endmodule