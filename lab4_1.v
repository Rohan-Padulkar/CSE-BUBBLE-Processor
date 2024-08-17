module veda(clk,rst,write_en,mode,data_in,addr,data_out);
input clk,rst,write_en,mode;
input [4:0] addr;
input [31:0] data_in;
output reg [31:0] data_out;
integer i;
reg [31:0] veda_mem [31:0];

always @(posedge clk or posedge rst)
begin
    if(rst)begin
        for(i=0;i<32;i=i+1)begin
            veda_mem[i] <= 32'bx;
        end
    end
    else if(!rst)begin
        if(write_en & !mode) begin
            veda_mem[addr] = data_in;
            data_out = data_in;
        end
        else if(write_en & mode) begin
            data_out = veda_mem[addr];
        end
    end

end

endmodule

module tb;

reg clk,rst,write_en,mode;
reg [31:0] data_in;
wire [31:0] data_out;
reg [4:0] addr;

veda uut(clk,rst,write_en,mode,data_in,addr,data_out);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    $monitor("time =",$time," data_out = %d data_in = %d mode = %b addr = %b",data_out,data_in,mode,addr);
    rst = 0;
    write_en = 1;
    mode = 0;
   
    #3 data_in = 231; 
    addr = 5'b0;
    // #6 $display($time," ",data_in," ",data_out," ",addr," ",rst);
    #7 data_in = 423;
    addr = 5'b00001;

    #10 mode = 1;
     addr = 5'b0;

    #20 addr = 5'b00001;
    // #1 addr = 5'b00001;
    // #1 $display($time," ",data_in," ",data_out," ",addr," ",rst);
    #40 $finish;
end
endmodule