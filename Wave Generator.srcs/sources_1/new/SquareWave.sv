`timescale 1ns / 1ps

module SquareWave(
    input logic clk,
    input logic [3:0]m,
    input logic [3:0]n,
    output logic squareWave                     // initial value of square wave
    );
    
    logic [7:0]counter = 0, counterNext = 0;    // initial value for counter
    logic squareWaveNext;
    
    always_ff @(posedge clk)     // register circuit
    begin
        if(clk)
        begin
            counter <= counterNext;
            squareWave <= squareWaveNext;
        end
    end
    
    always_comb                                 // combinational circuit
    begin
        case(squareWave)                         // if square wave is off
            1'b0:
            begin
                if (counter == (n*10))              // and has been off for n period
                begin
                    squareWaveNext = 1;             // turn square wave on
                    counterNext = 1;                // reset counter to 1
                end
                else
                begin
                    counterNext = counter + 1;      // otherwise increment counter
                    squareWaveNext = 0;             // and keep square wave off
                end
            end
        
            1'b1:                     // if square wave is on
                begin
                if (counter == (m*10))              // and has been on for m period
                begin
                    squareWaveNext = 0;             // turn square wave off
                    counterNext = 1;                // reset counter to 1
                end
                else
                begin
                    counterNext = counter + 1;      // otherwise increment counter
                    squareWaveNext = 1;             // abd keep squareWave on
                end
            end
        endcase
    end
    
endmodule