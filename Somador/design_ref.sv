
module somadorRef(a, b, soma, flag);
  input byte a, b;
  output bit flag;
  output byte soma;  
  byte soma;
  always_comb begin
   	soma = a + b;
   	soma = soma;
    
    if((a>0 && b>0 && soma<0)||(a<0 && b<0 && soma>0))begin
       flag=0;
     end;
    else
      flag=1;
  end;
endmodule: somadorRef