module ULA(
           input [3:0] X1,X2,  // ALU 8-bit Inputs                 
           input [2:0] CNTRL,// ALU Selection
           output [7:0] Y, // ALU 8-bit Output
           output CarryOut // Carry Out Flag
    );
    reg [7:0] ALU_Result;
    wire [4:0] tmp;
    assign Y = ALU_Result; // ALU out
    assign tmp = {4'b0000,X1} + {4'b0000,X2};
    assign CarryOut = tmp[4]; // Carryout flag
    always @(*)
    begin
        case(CNTRL)
        3'b000: // Addition
           ALU_Result = X1 + X2 ; 
        3'b001: // Subtraction
           ALU_Result = X1 - X2 ;
        3'b010: // Multiplication
           ALU_Result = X1 * X2;
        3'b011: //  Logical and 
           ALU_Result = X1 & X2;
        3'b100: //  Logical or
           ALU_Result = X1 | X2;
          default: ALU_Result = X1 + X2 ; 
        endcase
    end

endmodule


module maquina_de_estados( reset, comando);
	
	input [4:0] comando;
	reg [4:0] estadoAtual;
	reg [2:0] saida;
  
	//acho que falta mudar esse 4' pra 5'
	parameter S2 = 4'd0, S1 = 4'd1, S8 = 4'd2, S3 = 4'd3,
	S7 = 4'd4, S0 = 4'd5, S4 = 4'd6, S3I = 4'd7, S6 = 4'd8,
	blank = 4'd9;
	
	always @ (*)
		begin
			
			else
				case (estadoAtual)
					S0:
						if (comando == 5'b00000)
							estadoAtual <= S1;
						else if (comando == 5'b00001)
							estadoAtual <= S2;
						else if (comando == 5'b00010)
							estadoAtual <= S3;
						else if (comando == 5'b00011)
							estadoAtual <= S4;
						else if (comando == 5'b00100)
							estadoAtual <= S5
							
					S1:
						estadoAtual <= S0;
					
					S2:	
						estadoAtual <= S0;
					
					S3:	
						estadoAtual <= S0;
						
					S4:	
						estadoAtual <= S0;
					
					S5:	
						estadoAtual <= S0;
					
					default: estadoAtual <= 4'BXXXX;
				endcase
		end
		
		always @ (estadoAtual)
		begin
			case (estadoAtual)
				S1:
					saida = 3'b000;
				S2:
					saida = 3'b001;
				S3:
					saida = 3'b010;
				S4:
					saida = 3'b011;
				S5:
					saida = 3'b100;
				
			endcase
		end	
	//n sei pra que serve isso ainda	
	display_verilog display1(.W(saida[3]), .X(saida[2]), .Y(saida[1]), .Z(saida[0]), .saida(display));
	temporizador t1(.clockin(clock_placa), .clockout(clock_dividido));
	
endmodule
	
