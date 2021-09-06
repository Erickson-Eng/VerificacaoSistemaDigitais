module fourBitUpDownCounter(
  input CLK,
  input UD,
  output reg [7:0] Count,
  input Clear);
 	always @(Clear)
 	if (Clear == 0)
   		Count = 8'b00000000;            // Clear (asíncrono)
 	always @(negedge CLK)
 	case ({UD,Clear})               // Concatenar es {}
   		2'b01 : Count= Count+1;     // Count Up
   		2'b11 : Count= Count-1;     // Count Down
  	endcase
endmodule