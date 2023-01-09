`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/12/09 11:46:44
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*module top(
    output reg ld0=0,
    input clk
    );
    reg [31:0] cnt=32'b0;
    
    always @(posedge clk)
    begin
        if(cnt > 32'd125000000)
        begin  
            ld0 <= ~ld0;
            cnt <= 32'd0;
        end
        else
            cnt <= cnt+1;
    end            
endmodule*/

/*module top(
    input clk,
    input sw0,
    output reg ld0=0,
    output reg ld1=0,
    output reg ld2=0, 
    output reg ld3=0
    );
    
    reg [31:0] cnt=32'b0;
    
    always @(posedge clk)
    begin
        if(cnt > 32'd125000000)
        begin 
          cnt <= 32'd0;
          if(sw0)
          begin
               ld0 <= ~ld0;
               ld1 <= ~ld1;
               ld2 <= ~ld2;
               ld3 <= ~ld3;
           end
           else
               begin
               ld0 <= 0;
               ld1 <= 0;
               ld2 <= 0;
               ld3 <= 0;
                end
        end
        else
            cnt <= cnt+1;
     end

endmodule*/

module top(
    input clk,
    input [1:0] sw,
    output reg [3:0] ld
    );
    
    reg [31:0] cnt=32'b0;
    reg state=0;

    always @(posedge clk)
    begin
        if(cnt > 32'd125000000)
        begin 
          cnt <= 32'd0;
          state <= ~state;
        end
        else
            cnt <= cnt+1;
     end
     
     always @(sw[0] or sw[1])
     begin
        if(sw[0]==1 && sw[1]==0)
            begin
               ld <= 4'b1111;
            end
        else if(sw[0]==0 && sw[1]==1)
            if(state==1)
                begin
                   ld <= 4'b1111;
                end
            else
                begin
                   ld <= 4'b0000;
                end
        else
            begin
                   ld <= 4'b0000;
            end
     end
     
endmodule