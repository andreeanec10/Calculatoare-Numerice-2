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
				/*	 ldi 	r20, 255 		*/
		0:		value = 16'b1110111101001111;
		/*	 out 	0x01, r20 		*/
		1:		value = 16'b1011100101000001;
		/*	 ldi 	r19, 1 		*/
		2:		value = 16'b1110000000110001;
		/*	 out 	0x02, r19 		*/
		3:		value = 16'b1011100100110010;
		/*	 ldi 	r19, 2 		*/
		4:		value = 16'b1110000000110010;
		/*	 out 	0x02, r19 		*/
		5:		value = 16'b1011100100110010;
		/*	 ldi 	r19, 4 		*/
		6:		value = 16'b1110000000110100;
		/*	 out 	0x02, r19 		*/
		7:		value = 16'b1011100100110010;
		/*	 ldi 	r19, 8 		*/
		8:		value = 16'b1110000000111000;
		/*	 out 	0x02, r19 		*/
		9:		value = 16'b1011100100110010;
		/*	 ldi 	r19, 16 		*/
		10:		value = 16'b1110000100110000;
		/*	 out 	0x02, r19 		*/
		11:		value = 16'b1011100100110010;
		/*	 ldi 	r19, 32 		*/
		12:		value = 16'b1110001000110000;
		/*	 out 	0x02, r19 		*/
		13:		value = 16'b1011100100110010;
		/*	 ldi 	r19, 64 		*/
		14:		value = 16'b1110010000110000;
		/*	 out 	0x02, r19 		*/
		15:		value = 16'b1011100100110010;
		/*	 ldi 	r19, 128 		*/
		16:		value = 16'b1110100000110000;
		/*	 out 	0x02, r19 		*/
		17:		value = 16'b1011100100110010;
		default:		value = 16'b0000000000000000;

        endcase
    end

    always @(negedge clk) begin
        data <= value;
    end

endmodule
