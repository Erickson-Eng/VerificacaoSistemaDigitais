`include "desing_ref.sv";

class Random;
  randc bit [7:0] valorAleatorio;
endclass

module tb_somador;
	byte A_tb;
	byte B_tb;
  	byte Soma;
  	bit Flag;
  
  	byte SomaRef;
  	bit FlagRef;
 	bit clk;
  	always #5 clk = ~clk;
  
  somador(.a(A_tb), .b(B_tb), .soma(Soma), .flag(Flag));
  somadorRef(.a(A_tb), .b(B_tb), .soma(SomaRef), .f(FlagRef));
	
  	
  covergroup CG_A @(posedge clk);
    coverpoint A_tb
    {
      bins a[] = {[1:127]};
      bins b[] = {[-128:0]};
    }
  endgroup
  
  covergroup CG_B @(posedge clk);
    coverpoint B_tb
    {
      bins b[] = {[-128:127]};
    }
  endgroup
  
  covergroup CG_S @(posedge clk);
    coverpoint Soma
    {
      bins s[] = {[-128:127]};
    }
  endgroup
  
  initial begin
    CG_A cg_a = new;
    CG_B cg_b = new;
    CG_S cg_s = new;
    Random a_random = new();
    Random b_random = new();
    
    $monitor("Circuito somador: %d + %d = %d, flag =%d | %b + %b = %b, flag = %b -> SomadorRef R_Decimal= %d R_Binario = %b  flag =  %b ", A_tb, B_tb, Soma, Flag, A_tb, B_tb, Soma, Flag, SomaRef, SomaRef, FlagRef);
    
    while (cg_a.get_coverage() < 100 || cg_b.get_coverage() < 100 || cg_s.get_coverage() < 100) begin
      a_random.randomize();
      b_random.randomize();

      A_tb = a_random.valorAleatorio;
      B_tb = b_random.valorAleatorio;
      
      #10 $display("CG_A = %.2f%% CG_B = %.2f%% CG_S = %.2f%%", cg_a.get_coverage(), cg_b.get_coverage(), cg_s.get_coverage());
      
      if ( Soma != SomaRef || Flag != FlagRef)begin
        $display("\nErro-=-=-=-=-=-=-=-=-=-=-=-Erro=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-Erro=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-Erro=-=-=-=-=-=-=-=-=-=-=-");
        $display("DUV: %b + %b = %b | %d + %d = %d | flag = %b |!=| MRef: Soma = %d | %bb | flag =  %b ", A_tb, B_tb, Soma, A_tb, B_tb, Soma, Flag, SomaRef, SomaRef, FlagRef);
        $display("Erro-=-=-=-=-=-=-=-=-=-=-=-Erro=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-Erro=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-Erro=-=-=-=-=-=-=-=-=-=-=-");

		break;          
      end
      
    end
    $display("\n\nSimulação concluida!");

	$finish();
  end    
endmodule



    if((a>0 && b>0 && soma[7]==0)||(a<0 && b<0 && soma[7]==1))begin
      flag = 1;
    end
    else
      flag = 0;