module Instruction_fetch(clk,Curr_Instruction);
input clk;
output reg [31:0] Curr_Instruction;
// reg [31:0] Next_Instruction;
reg [4:0] pc = 5'b00000;
reg [31:0] veda_mem [31:0];

initial begin

    // initialise memory
    veda_mem[0] = 32'b00000000001000100000000000100000;
    veda_mem[1] = 32'b00000000010000010000000000100010;
    veda_mem[2] = 32'b00000000001000100000000000100001;
    veda_mem[3] = 32'b00000000010000010000000000100011;
    veda_mem[4] = 32'b00100000001000000000001111101000;
    veda_mem[5] = 32'b00100100001000000000001111101000;
    veda_mem[6] = 32'b00000000001000100000000000100100;
    veda_mem[7] = 32'b00000000001000100000000000100101;
    veda_mem[8] = 32'b00110000001000000000001111101000;
    veda_mem[9] = 32'b00110100001000000000001111101000;
    veda_mem[10] = 32'b00000000000000010000001010000000;
    veda_mem[11] = 32'b00000000000000010000001010000010;
    veda_mem[12] = 32'b10001100001000000000000000001010;
    veda_mem[13] = 32'b10101100001000000000000000001010;
    veda_mem[14] = 32'b00010000000000010000000000001010;
    veda_mem[15] = 32'b00010100000000010000000000001010;
    veda_mem[16] = 32'b00011100001000100000000000001010;
    veda_mem[17] = 32'b00111100001000100000000000001010;
    veda_mem[18] = 32'b00011000001000100000000000001010;
    veda_mem[19] = 32'b01111100001000100000000000001010;
    veda_mem[20] = 32'b00001000000000000000000000000010;
    veda_mem[21] = 32'b00000000000000000000000000001000;
    veda_mem[22] = 32'b00001100000000000000000000001010;
    veda_mem[23] = 32'b00000000001000100000000000101010;
    veda_mem[24] = 32'b00101000010000010000000001100100;
    
end

always @(posedge clk) begin
    
    if(pc<25)begin
        Curr_Instruction = veda_mem[pc];
        // $display("%b",Curr_Instruction);
    end
    pc = pc + 1;
end

endmodule


module Decode_Instruction;
reg clk;
reg [5:0] Opcode;
reg [5:0] Funct;



wire [31:0] Curr_Instruction;

Instruction_fetch uut(clk,Curr_Instruction);

// assign [5:0]Opcode = [31:26] Curr_Instruction;
// assign [5:0]Funct = [5:0] Curr_Instruction;

initial begin
clk = 0;
forever #10 clk = ~clk;
end

initial begin
#800 $finish;

end

always @(negedge clk)
begin

    Opcode =  Curr_Instruction[31:26];
    Funct = Curr_Instruction[5:0];

    case(Opcode)
        6'b000000: case(Funct)

                    6'b100000: $display("Addition of 2 registers");
                    6'b100010: $display("Subraction of 2 registers");
                    6'b100001: $display("Add Unsigned of 2 registers");
                    6'b100011: $display("Sub Unsigned of 2 registers");
                    6'b100100: $display("And of 2 registers");
                    6'b100101: $display("OR of 2 registers");
                    6'b000000: $display("sll of 2 registers");
                    6'b000010: $display("slright of 2 registers");
                    6'b001000: $display("Jump register");
                    6'b101010: $display("set on less than");


                   endcase

        6'b001000 :     $display("Add Immediate");       
        6'b001001 :     $display("Add Immediate Unssigned");  
        6'b001100 :     $display("And Immediate "); 
        6'b001101 :     $display("Or Immediate "); 
        6'b100011 :     $display("Load word "); 
        6'b101011 :     $display("Show word ");
        6'b000100 :     $display("branch equal to ");
        6'b000101 :     $display("branch not equal to ");
        6'b000111 :     $display("branch greater ");
        6'b001111 :     $display("branch greater than or equal to ");
        6'b000110 :     $display("branch less than ");
        6'b011111 :     $display("branch less or equal to ");
        6'b000010 :     $display("Jump to "); 
        6'b000011 :     $display("Jump and link "); 
        6'b001010 :     $display("Set on less than immediate");



    endcase

end



endmodule