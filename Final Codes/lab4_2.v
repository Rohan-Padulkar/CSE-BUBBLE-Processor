module veda_new(clk,rst,write_en,mode,data_in,addr_a,addr_b,data_out);
input clk,rst,write_en,mode;
input [4:0] addr_a;
input [4:0] addr_b;
input [31:0] data_in;
output reg [31:0] data_out;
integer i;
reg [31:0] veda_mem [31:0];

always @(posedge clk or posedge rst)
begin
    if(rst & write_en)begin
        for(i=0;i<32;i=i+1)begin
            veda_mem[i] <= 32'bx;
        end
    end
    else if(!rst & write_en)begin
        if(write_en & !mode) begin
            veda_mem[addr_a] = data_in;
            data_out = data_in;
        end
        else if(write_en & mode) begin
            data_out = veda_mem[addr_b];
        end
    end

end

endmodule


module tb;
reg clk,rst,write_en,mode;
reg [31:0] data_in;
wire [31:0] data_out;
reg [4:0] addr_a;
reg [4:0] addr_b;

veda_new uut(clk,rst,write_en,mode,data_in,addr_a,addr_b,data_out);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
always@(negedge clk)
begin
    if(mode == 1 & $time<50) $display($time-5," Read operation : Value stored = %d",data_out);
    else if(mode == 0) $display($time-5," Write Operation : Value written = %d",data_out);
end
initial begin
    // $monitor("time =",$time," data_out = %d data_in = %d mode = %b addra = %b addrb = %b",data_out,data_in,mode,addr_a,addr_b);
    rst = 0;
    write_en = 1;
    mode = 0;
   
    #5 data_in = 231; 
    addr_a = 5'b0;
    // #6 $display($time," ",data_in," ",data_out," ",addr," ",rst);
    #10 data_in = 423;
    addr_a = 5'b00001;

    #10 mode = 1;
     addr_b = 5'b0;

    #10 addr_b = 5'b00001;
    // #1 addr = 5'b00001;
    // #1 $display($time," ",data_in," ",data_out," ",addr," ",rst);
    #40 $finish;
end
endmodule



