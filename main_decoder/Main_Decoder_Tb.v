`timescale 1ns / 1ps

module Main_Decoder_tb;

    // Inputs
    reg [6:0] Op;

    // Outputs
    wire RegWrite, ALUSrc, MemWrite, ResultSrc, Branch;
    wire [1:0] ImmSrc, ALUOp;

    Main_Decoder uut (
        .Op(Op),
        .RegWrite(RegWrite),
        .ImmSrc(ImmSrc),
        .ALUSrc(ALUSrc),
        .MemWrite(MemWrite),
        .ResultSrc(ResultSrc),
        .Branch(Branch),
        .ALUOp(ALUOp)
    );

    initial begin
        $display("------ Main_Decoder Testbench ------");

        // Test 1: LW (load word) - opcode: 0000011
        Op = 7'b0000011;
        #10;
        $display("LW: RegWrite=%b, ImmSrc=%b, ALUSrc=%b, MemWrite=%b, ResultSrc=%b, Branch=%b, ALUOp=%b", 
            RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

        // Test 2: SW (store word) - opcode: 0100011
        Op = 7'b0100011;
        #10;
        $display("SW: RegWrite=%b, ImmSrc=%b, ALUSrc=%b, MemWrite=%b, ResultSrc=%b, Branch=%b, ALUOp=%b", 
            RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

        // Test 3: R-type (e.g., ADD/SUB) - opcode: 0110011
        Op = 7'b0110011;
        #10;
        $display("R-type: RegWrite=%b, ImmSrc=%b, ALUSrc=%b, MemWrite=%b, ResultSrc=%b, Branch=%b, ALUOp=%b", 
            RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

        // Test 4: BEQ (branch equal) - opcode: 1100011
        Op = 7'b1100011;
        #10;
        $display("BEQ: RegWrite=%b, ImmSrc=%b, ALUSrc=%b, MemWrite=%b, ResultSrc=%b, Branch=%b, ALUOp=%b", 
            RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

        // Test 5: ADDI (I-type ALU) - opcode: 0010011 (should behave like R-type ALU)
        Op = 7'b0010011;
        #10;
        $display("ADDI: RegWrite=%b, ImmSrc=%b, ALUSrc=%b, MemWrite=%b, ResultSrc=%b, Branch=%b, ALUOp=%b", 
            RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

        // Test 6: Invalid/unknown opcode
        Op = 7'b1111111;
        #10;
        $display("Invalid Op: RegWrite=%b, ImmSrc=%b, ALUSrc=%b, MemWrite=%b, ResultSrc=%b, Branch=%b, ALUOp=%b", 
            RegWrite, ImmSrc, ALUSrc, MemWrite, ResultSrc, Branch, ALUOp);

        $finish;
    end

endmodule

