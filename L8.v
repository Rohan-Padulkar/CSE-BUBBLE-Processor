module add_ver(a,b,c);

input [31:0] a,b;
output [31:0] c;

assign c = a + b;

endmodule

module sub_ver(a,b,c);

input [31:0] a,b;
output [31:0] c;

assign c = a - b;

endmodule


// module addunsig_ver(a,b,c);
// endmodule

// module subunsig_ver(a,b,c);
// endmodule

module and_ver(a,b,c);

input [31:0] a,b;
output [31:0] c;

assign c = a & b;


endmodule

module or_ver(a,b,c);

input [31:0] a,b;
output [31:0] c;

assign c = a | b;

endmodule

module sll_ver(a,b,c);

input [31:0] a
output c;
input [4:0] b;

assign c = a >> b;

endmodule

module srl_ver(a,b,c);

input [31:0] a;
output c;
input [4:0] b;

assign c = a << b;

endmodule

module load_word(a,b,c);
input a;
input b;

output c;

endmodule



module Decode_Instruction;

reg [4:0] pc;
reg clk;

reg [5:0] Opcode;
reg [5:0] Funct;

reg [4:0] rs;
reg [4:0] rd;
reg [4:0] rt;

reg [15:0] addr_const;
reg [4:0] Shamt;
reg [25:0] jump_inst;

integer i;
wire [31:0] Curr_Instruction;

reg [31:0] Risc_bubble [31:0];

reg [31:0] veda_mem [31:0];

initial begin

    // initialise memory
    // veda_mem[0] = 32'b00000000001000100000000000100000;
    // veda_mem[1] = 32'b00000000010000010000000000100010;
    // veda_mem[2] = 32'b00000000001000100000000000100001;
    // veda_mem[3] = 32'b00000000010000010000000000100011;
    // veda_mem[4] = 32'b00100000001000000000001111101000;
    // veda_mem[5] = 32'b00100100001000000000001111101000;
    // veda_mem[6] = 32'b00000000001000100000000000100100;
    // veda_mem[7] = 32'b00000000001000100000000000100101;
    // veda_mem[8] = 32'b00110000001000000000001111101000;
    // veda_mem[9] = 32'b00110100001000000000001111101000;
    // veda_mem[10] = 32'b00000000000000010000001010000000;
    // veda_mem[11] = 32'b00000000000000010000001010000010;
    // veda_mem[12] = 32'b10001100001000000000000000001010;
    // veda_mem[13] = 32'b10101100001000000000000000001010;
    // veda_mem[14] = 32'b00010000000000010000000000001010;
    // veda_mem[15] = 32'b00010100000000010000000000001010;
    // veda_mem[16] = 32'b00011100001000100000000000001010;
    // veda_mem[17] = 32'b00111100001000100000000000001010;
    // veda_mem[18] = 32'b00011000001000100000000000001010;
    // veda_mem[19] = 32'b01111100001000100000000000001010;
    // veda_mem[20] = 32'b00001000000000000000000000000010;
    // veda_mem[21] = 32'b00000000000000000000000000001000;
    // veda_mem[22] = 32'b00001100000000000000000000001010;
    // veda_mem[23] = 32'b00000000001000100000000000101010;
    // veda_mem[24] = 32'b00101000010000010000000001100100;
    
end

always @(posedge clk) begin
    
    // if(pc<25)begin
        Curr_Instruction = veda_mem[pc];
        // $display("%b",Curr_Instruction);
    // end
    // pc = pc + 1;
end

initial begin
    pc = 0;
    for(i = 0;i<32; i = i+1)begin
        Risc_bubble[i] = i
    end

end

// Instruction_fetch uut(pc,clk,Curr_Instruction);

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
    reg [31:0] c;

    Opcode =  Curr_Instruction[31:26];
    Funct = Curr_Instruction[5:0];
    rs = Curr_Instruction[25:21];
    rt = Curr_Instruction[20:16];
    rd = Curr_Instruction[15:11];

    Shamt = Curr_Instruction[10:6];
    jump_inst = Curr_Instruction[25:0];

    case(Opcode)
        6'b000000: case(Funct)

                    6'b100000: add_ver uut(Risc_bubble[rs],Risc_bubble[rt],c);
                               Risc_bubble[rd] = c;
                               pc = pc + 1;

                    6'b100010: sub_ver uut(Risc_bubble[rs],Risc_bubble[rt],c);
                               Risc_bubble[rd] = c;
                               pc = pc + 1;

                    6'b100001: $display("Add Unsigned of 2 registers");
                    6'b100011: $display("Sub Unsigned of 2 registers");

                    6'b100100: and_ver uut(Risc_bubble[rs],Risc_bubble[rt],c);
                               Risc_bubble[rd] = c;
                               pc = pc + 1;

                    6'b100101: or_ver uut(Risc_bubble[rs],Risc_bubble[rt],c);
                               Risc_bubble[rd] = c;
                               pc = pc + 1;

                    6'b000000: sll_ver(Risc_bubble[rt],Shamt,c);
                               Risc_bubble[rd] = c;
                               pc = pc + 1;

                    6'b000010: srl_ver uut(Risc_bubble[rt],Shamt,c);
                               Risc_bubble[rd] = c;
                               pc = pc + 1;

                    6'b001000: pc = Risc_bubble[rs];

                    6'b101010: if(Risc_bubble[rs] < Risc_bubble[rt]) Risc_bubble[rd] = 1;
                               else Risc_bubble[rd] = 0;

                   endcase

        6'b001000 :     $display("Add Immediate");       
        6'b001001 :     $display("Add Immediate Unssigned");  
        6'b001100 :     $display("And Immediate "); 
        6'b001101 :     $display("Or Immediate ");

        6'b100011 :     Risc_bubble[rt] = veda_mem[Risc_bubble[rs] +  addr_const];
                        pc = pc + 1;

        6'b101011 :     veda_mem[Risc_bubble[rs] +  addr_const] = Risc_bubble[rt];
                        pc = pc + 1;

        6'b000100 :     if(Risc_bubble[rt] == Risc_bubble[rs]) pc = pc + 1 + addr_const;
        6'b000101 :     if(Risc_bubble[rt] != Risc_bubble[rs]) pc = pc + 1 + addr_const;
        6'b000111 :     if(Risc_bubble[rs] > Risc_bubble[rt]) pc = pc + 1 + addr_const;
        6'b001111 :     if(Risc_bubble[rs] >= Risc_bubble[rt]) pc = pc + 1 + addr_const;;
        6'b000110 :     if(Risc_bubble[rs] < Risc_bubble[rt]) pc = pc + 1 + addr_const;
        6'b011111 :     if(Risc_bubble[rs] <= Risc_bubble[rt]) pc = pc + 1 + addr_const;

        6'b000010 :     pc = jump_inst;

        6'b000011 :     $display("Jump and link "); 
                        Risc_bubble(5'b11111) = pc + 1;
                        pc = jump_inst;

        6'b001010 :     $display("Set on less than immediate");
                        if(Risc_bubble(rt) < addr_const) Risc_bubble[rs] = 1;
                        else Risc_bubble[rs] = 0;



    endcase

end



endmodule