module Memory(CS, WE, CLK, ADDR, Mem_Bus);
    
    input CS, WE, CLK;
    input [31:0] ADDR;
    inout [31:0] Mem_Bus;
    reg [31:0] data_out;
    reg [31:0] RAM [0:127];
    integer i;
    reg[6:0] counter;
    initial begin
        for (i=0; i<128; i=i+1)
        begin
            RAM[i] = 32'd0; //initialize all locations to 0
        end
        $readmemh("mips_instructions.txt", RAM);
        // this optional statement can be inserted to read initial values
        // from a file
    end

    assign Mem_Bus = ((CS == 1'b0) || (WE == 1'b1)) ? 32'bZ : data_out;
    always @(negedge CLK) begin
        if((CS == 1'b1) && (WE == 1'b1))
        RAM[ADDR] <= Mem_Bus[31:0];
        data_out <= RAM[ADDR];
    end

endmodule
