
module somador(a,b,soma,flag);
  
  input byte a,b;
  output byte soma;
  output bit flag;
  
  always @* begin
    soma <= a + b;
    if((a>0 && b>0 && soma[7]==0)||(a<0 && b<0 && soma[7]==1))begin
      flag = 1;
    end
    else
      flag = 0;
  end
endmodule: somador