`timescale 1ns / 1ps

module SquareWaveSimulation();

    localparam T = 10;
    
    logic clk;
    logic [3:0]m, n;
    //logic reset;
    logic squareWave;
    
    SquareWave uut(.*);
    
    always
    begin
        clk = 1'b0;
        #(T/2)
        clk = 1'b1;
        #(T/2);
    end
    
    initial
    begin
        //reset = 1;
        //#1 reset = 0;
        #1 m = 4'b0001; n = 4'b0001;
    end
    
endmodule
