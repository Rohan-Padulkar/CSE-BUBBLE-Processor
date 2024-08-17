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

input [31:0] a;
output [31:0]c;
input [4:0] b;

assign c = a >> b;

endmodule

module srl_ver(a,b,c);

input [31:0] a;
output [31:0]c;
input [4:0] b;

assign c = a << b;

endmodule

module Decode_Instruction(clk,out);
input clk;
reg [9:0] pc;
// reg clk;

reg [5:0] Opcode;
reg [5:0] Funct;

reg [4:0] rs;
reg [4:0] rd;
reg [4:0] rt;

reg [15:0] addr_const;
reg [4:0] Shamt;
reg [25:0] jump_inst;

integer i;

reg [31:0] Curr_Instruction;

reg [31:0] Risc_bubble [31:0];

reg [31:0] veda_mem [1023:0];

wire [31:0] c_sum;
wire [31:0] c_sub;
wire [31:0] c_and;
wire [31:0] c_or;
wire [31:0] c_sll;
wire [31:0] c_srl;

initial begin

    initialise memory
    veda_mem[0] = {16'b0001000000000001,16'd10}; // beq
    veda_mem[1] = {16'b0001000000000001,16'd10}; // 
    veda_mem[2] = 32'b00000000001000100000000000100100; // 
    veda_mem[3] = 32'b00000000001000100000000000100100;
    veda_mem[10] = 32'd12;
    veda_mem[2] = 32'b00000000001000100000000000100001;
    veda_mem[3] = 32'b00000000010000010000000000100011;
    veda_mem[4] = 32'b00100000001000000000001111101000;
    veda_mem[5] = 32'b00100100001000000000001111101000;
    
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

initial begin
    pc = 0;
    // $display(pc);
    Risc_bubble[0] = 32'd0;
    Risc_bubble[1] = 32'd0;
    Risc_bubble[2] = 32'd0;

 
end
output reg [31:0] out;

add_ver uut1(Risc_bubble[rs],Risc_bubble[rt],c_sum);
sub_ver uut2(Risc_bubble[rs],Risc_bubble[rt],c_sub);
and_ver uut3(Risc_bubble[rs],Risc_bubble[rt],c_and);
or_ver uut4(Risc_bubble[rs],Risc_bubble[rt],c_or);
sll_ver uut5(Risc_bubble[rt],Shamt,c_sll);
srl_ver uut6(Risc_bubble[rt],Shamt,c_srl);

always @(posedge clk)
begin

    Curr_Instruction = veda_mem[pc];
    Opcode =  Curr_Instruction[31:26];
    Funct = Curr_Instruction[5:0];
    rd = Curr_Instruction[25:21];
    rs = Curr_Instruction[20:16];
    rt = Curr_Instruction[15:11];
    addr_const =  Curr_Instruction[15:0];
    Shamt = Curr_Instruction[10:6];
    jump_inst = Curr_Instruction[25:0];
    
    case(Opcode)
        6'b000000: case(Funct)

                     6'b100000: begin
                                
                                Risc_bubble[rd] = c_sum;
                                out = c_sum;
                                pc = pc + 1;
                                end

                    6'b100010: begin
                               
                               Risc_bubble[rd] = c_sub;
                               out = c_sub;
                               pc = pc + 1;
                               end

                    6'b100001: begin
                                
                                Risc_bubble[rd] = c_sum;
                                pc = pc + 1;
                                end

                    6'b100011: begin
                               
                               Risc_bubble[rd] = c_sub;
                               pc = pc + 1;
                               end

                    6'b100100: begin

                               
                               Risc_bubble[rd] = c_and;
                               pc = pc + 1;
                               out = c_and;

                               end

                    6'b100101: begin
                               
                               Risc_bubble[rd] = c_or;
                               pc = pc + 1;
                               end

                    6'b000000: begin
                               
                               Risc_bubble[rd] = c_sll;
                               pc = pc + 1;
                               end

                    6'b000010: begin
                               
                               Risc_bubble[rd] = c_srl;
                               pc = pc + 1;
                               end

                    6'b001000: pc = Risc_bubble[rs];

                    6'b101010: begin

                               if(Risc_bubble[rs] < Risc_bubble[rt]) Risc_bubble[rd] = 1;
                               else Risc_bubble[rd] = 0;
                               pc = pc + 1;

                               end
                   endcase

        6'b001000 :     begin
                        $display("Add Immediate");
                        Risc_bubble[rt] = Risc_bubble[rs] + addr_const[15:0];
                        pc = pc + 1;
                        end

        6'b001001 :     begin  
                        $display("Add Immediate Unssigned"); 
                        Risc_bubble[rt] = Risc_bubble[rs] + addr_const[15:0];
                        pc = pc + 1;
                        end

        6'b001100 :     begin
                        $display("And Immediate "); 
                        Risc_bubble[rt] = Risc_bubble[rs] & addr_const[15:0];
                        pc = pc + 1;
                        end

        6'b001101 :     begin
                        $display("Or Immediate ");
                        Risc_bubble[rt] = Risc_bubble[rs] | addr_const[15:0];
                        pc = pc + 1;
                        end

        6'b100011 :     begin
                        $display("Data transfer - load word");
                        Risc_bubble[rt] = veda_mem[Risc_bubble[rs] +  addr_const];
                        out = Risc_bubble[rt];
                        pc = pc + 1;
                        end

        6'b101011 :     begin
                        $display("Data transfer - store word");
                        veda_mem[Risc_bubble[rs] +  addr_const] = Risc_bubble[rt];
                        pc = pc + 1;
                        end

        6'b000100 :     if(Risc_bubble[rt] == Risc_bubble[rs]) begin
                        $display(pc);
                        pc = pc + 1 + addr_const[5:0]; 
                        // pc = pc + 1;
                        $display(pc);
                        end
        6'b000101 :     if(Risc_bubble[rt] != Risc_bubble[rs]) pc = pc + 1 + addr_const[9:0];

        6'b000111 :     if(Risc_bubble[rs] > Risc_bubble[rt]) pc = pc + 1 + addr_const[9:0];

        6'b001111 :     if(Risc_bubble[rs] >= Risc_bubble[rt]) pc = pc + 1 + addr_const[9:0];

        6'b000110 :     if(Risc_bubble[rs] < Risc_bubble[rt]) pc = pc + 1 + addr_const[9:0];

        6'b011111 :     if(Risc_bubble[rs] <= Risc_bubble[rt]) pc = pc + 1 + addr_const[9:0];

        6'b000010 :     pc = jump_inst[9:0];

        6'b000011 :     begin  
                        $display("Jump and link "); 
                        Risc_bubble[5'b11111] = pc + 1;
                        pc = jump_inst[9:0];
                        end

        6'b001010 :     begin
                        $display("Set on less than immediate");
                        if(Risc_bubble[rt] < addr_const) Risc_bubble[rs] = 1;
                        else Risc_bubble[rs] = 0;
                        pc = pc + 1;
                        end


    endcase

end



endmodule


module tb;

reg clk;
wire [31:0] out;

Decode_Instruction uut (clk,out);

initial begin
clk = 0;
forever #10 clk = ~clk;
end

initial begin
// $monitor(out);
#800 $finish;

end

endmodule