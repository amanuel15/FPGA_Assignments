module Num1A(a,b,f);
input a,b;
output f;
wire n1,n2,n3,n4;
nor Nor1(n1, a ,b );
nor Not1(n2,a);
nor Not2(n3,b);
nor Nor2(n4,n2,n3);
nor Nor3(f,n1,n4);
endmodule
