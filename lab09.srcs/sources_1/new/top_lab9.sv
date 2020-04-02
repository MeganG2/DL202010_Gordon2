`timescale 1ns / 1ps
//Megan Gordon
//Lab 09

module top_lab9(
input btnU,
input btnD,
input [11:0]sw,
input clk,
input btnC,
output [15:0]led
    );

wire [7:0] Q1;
wire [7:0] out;
wire [7:0] Q2;   
wire [7:0] sw1;
wire [3:0] sw2;
    
assign sw1 = sw[7:0];
assign sw2 = sw[11:8];


register #(.N(8)) r1(.D(sw1), .clk(clk), 
        .en(btnD), .rst(btnC), .Q(Q1));

alu #(.N(8)) (.in0(sw1), .in1(Q1), 
        .op(sw2), .out(out));

register #(.N(8)) r2(.D(out), .clk(clk), 
        .en(btnD), .rst(btnC), .Q(Q2));
        
assign led [7:0] = Q1;
assign led [15:8] = Q2;       

  
endmodule