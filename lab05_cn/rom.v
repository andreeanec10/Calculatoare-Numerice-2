module rom #(
        parameter   DATA_WIDTH = 16,
        parameter   ADDR_WIDTH = 8          // 2 * 1024 bytes of ROM
    )(
        input  wire                  clk,
        input  wire [ADDR_WIDTH-1:0] addr,  // here comes the program counter
        output  reg [DATA_WIDTH-1:0] data   // here goes the instruction
    );

    reg [DATA_WIDTH-1:0] value;

    
    always @* begin
        case (addr)
				/*	 rcall 	loadfun 		*/
		0:		value = 16'b1101000000000001;
		/*	 ret 	 		*/
		1:		value = 16'b1001010100001000;
		/*	 ldi 	r20, 66 		*/
		2:		value = 16'b1110010001000010;
		/*	 ret 	 		*/
		3:		value = 16'b1001010100001000;
		default:		value = 16'b0000000000000000;
        endcase
    end

    always @(negedge clk) begin
        data <= value;
    end

endmodule
