module contador (clock, reset,key ,load, entrada, counter_out);
  input bit clock, reset, key, load;
  input bit[7:0] entrada;
  output bit[7:0] counter_out;
  
  always @ (negedge clock or negedge reset) begin //clock ascendente
  if (!reset) begin
    counter_out <= 0;
  end else begin
    if (load) begin
      counter_out <= entrada;
    end else begin
      if (key) begin
        counter_out <= counter_out + 1;
      end else begin
        counter_out <= counter_out - 1;
      end
    end
  end
  end
endmodule