module somador8bitsRef(a, b, soma, f);
  input bit [7:0] a, b;
  output bit [7:0] soma;
  output bit f;
  
  always_comb begin
    bit estouro;
    
    for (int i = 0; i < 8; i ++) begin
      if (i == 0) begin
        soma[i] = a[i] ^ b[i];
        estouro = a[i] & b[i];
      end
      else begin
        soma[i] = ((~a[i]) & (~b[i]) & estouro) | ((~a[i]) & b[i] & (~estouro)) | (a[i] & (~b[i]) & (~estouro)) | (a[i] & b[i] & estouro);
        estouro = (b[i] & estouro) | (a[i] & estouro) | (a[i] & b[i]);
      end
    end
    
    f = (~a[7] & ~soma[7]) | (~b[7] & ~soma[7]) | (b[7] & soma[7] & ~estouro) | (a[7] & soma[7] & ~estouro) | (a[7] & b[7] & estouro);
  end
endmodule: somador8bitsRef