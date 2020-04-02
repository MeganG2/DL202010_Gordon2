`timescale 1ns / 1ps
//Megan Gordon
//Lab 09

module alu_test();

reg [7:0] in0;
reg [7:0] in1;
reg [3:0] op;
wire [7:0] out;
 
alu #(.N(8)) r(.in0(in0), .in1(in1), 
        .op(op), .out(out));
        
initial begin
        in0=3; in1=2; op=0; #10;
        in0=3; in1=2; op=1; #10;
        in0=3; in1=2; op=2; #10;
        in0=3; in1=2; op=3; #10;
        in0=3; in1=2; op=4; #10;
        in0=3; in1=2; op=7; #10;

        $finish;
end

endmodule
