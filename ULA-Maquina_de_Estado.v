module ULA(
	input [3:0] X1,X2,  // ULA 8-bit de entrada, 2 numeros                
	input [2:0] CNTRL,// Contorle da ULA
	output [7:0] Y, // ULA 8-bit Output
           output CarryOut // Carry Out
    );
    reg [7:0] ALU_Result;
    wire [4:0] tmp;
    assign Y = ALU_Result; // Saida da ULA
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
	
	input [2:0] comando;
	reg [2:0] estadoAtual;
	reg [2:0] saida;
  
	//declarando os estados
	parameter S2 = 3'd0, S1 = 3'd1, S8 = 3'd2, S3 = 3'd3,
	S7 = 3'd4, S0 = 3'd5, S4 = 3'd6, S3I = 3'd7, S6 = 3'd8,
	blank = 3'd9;
	
	always @ (*)//organizando e selecionando o funciomnametno da troca de estados
		begin
			
			else
				case (estadoAtual)
					S0:
						if (comando == 3'b000)
							estadoAtual <= S1;
					else if (comando == 3'b001)
							estadoAtual <= S2;
					else if (comando == 3'b010)
							estadoAtual <= S3;
					else if (comando == 3'b011)
							estadoAtual <= S4;
					else if (comando == 3'b100)
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
		
	always @ (estadoAtual) // saida da maquina de estados mediante seu estado atual
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
	
	
endmodule


module memo_inst

	(clock, op_counter, inst_out);

	input [15:0] op_counter;
	output [15:0] inst_out;

	reg [15:0] memoria_instrucoes [99:0]; // vetor para armazenar os bits
	always @(posedge clock)

		assign inst_out = memoria_instrucoes[op_counter]; //recebe o OP counter e faz apassagem de 16 bits para a saida

endmodule


module banco_registradores

	(clock, reg1, reg2, reg3, inp, reg1valor, reg2valor, reg3valor);

input clock;

	input [1:0] reg1; // endereço dos registradores
	input [1:0] reg2;
	input [1:0] reg3;

	input [15:0] in_ula;// valor que vem da ula, armazenada no registrador 3

	reg [15:0] registradores[15:0];
	
	output [15:0] reg1vaor; // valores armazenados nos registradores
	output [15:0] reg2valor;
	output [15:0] reg3valor;

	

always @(posedge clock)
begin
	registradores[reg3] <= in_ula; 
end

	assign reg1valor = registradores[reg1];
	assign reg2valor = registradores[reg2];
	assign reg3valor = registradores[reg3];

endmodule
	
