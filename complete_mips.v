// integrating the processor and memory modules
module Complete_MIPS(CLK, RST, A_Out, D_Out);
    
    input CLK;
    input RST;
    output [31:0] A_Out;
    output [31:0] D_Out;
    wire CS, WE;
    wire [31:0] ADDR, Mem_Bus;
    
    assign A_Out = ADDR;
    assign D_Out = Mem_Bus;
    
    MIPS CPU(CLK, RST, CS, WE, ADDR, Mem_Bus);
    Memory MEM(CS, WE, CLK, ADDR, Mem_Bus);
    
endmodule
