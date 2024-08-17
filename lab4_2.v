module veda(clk,rst,write_en,mode,data_in,addr_a,addr_b,data_out);
input clk,rst,write_en,mode;
input [4:0] addr_a;
input [4:0] addr_b;
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
            veda_mem[addr_a] = data_in;
            data_out = data_in;
        end
        else if(write_en & mode) begin
            data_out = veda_mem[addr_b];
        end
    end

end

endmodule