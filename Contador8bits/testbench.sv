module tb;
  bit ck, rst,chave, load;
  bit[7:0] entrada;
  bit[7:0] saida;
  
  contador cont(.clock(ck),  
                .reset(rst), 
                .key(chave), 
                .load(load), 
                .entrada(entrada), 
                .counter_out(saida));
  
  
  initial begin
    
    $dumpfile("tb.vcd");
    $dumpvars(1);
    
    $display("Inicio");
    $monitor("Time = %d, Reset = %d,  load = %b, Entrada =%d, UP/Down = %b,  Contagem = %d", $time, rst,load, entrada, chave, saida);
    
    ck = 1;
    rst = 1;
    chave = 1;
    entrada = 9;
    load = 0;
    #00 rst = 0; //set = 0
    #10 load = 1; // recebe a entrada
    #30
    #10 rst = 1; // mantem contagem
    #10 load = 0; // continua a contagem
    #10 chave = 0; // contagem decrescente
    #40
    #10 chave = 1; // contagem crescente
    
    #100
    #10 load = 1; // recebe entrada
    #20
    #05 rst = 0; // set na saida 0
    #10
    #10 load = 0;// continua contagem
    #10
    #10 rst = 1; // mantem contagem
    #10 chave = 0; // contagem decrescente
    #50
    #10 chave = 1;// contagem crescente
    
    #150
    
    $display("Fim");
    $finish;
  end
  
  always #5 ck = ~ ck;
  
endmodule
    