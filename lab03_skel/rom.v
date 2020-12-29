module rom #(
        parameter   DATA_WIDTH = 16,
        parameter   ADDR_WIDTH = 8          // 2 * 1024 bytes of ROM
    )(
        input  wire                  clk,
        input  wire [ADDR_WIDTH-1:0] addr,  // here comes the program counter
        output  reg [DATA_WIDTH-1:0] data   // here goes the instruction
    );

    reg [DATA_WIDTH-1:0] value;

    /* TODO: de scris niste instructiuni valide */
    always @* begin
        case (addr)
            0:		        value = 16'b1110000011011010;  // ldi r29, 10
            1:		        value = 16'b1010100011011010;  // sts r29, 10
            2:		        value = 16'b1110000011010000;  // ldi r29, 0
            3:		        value = 16'b1110100011001010;  // ldi r28, 138
            4:		        value = 16'b1000000110111000;  // ld 	r27, y
            5:		        value = 16'b1010000011001010;  // lds r28, 10 
            6:		        value = 16'b0010111110111100;  // mov r27, r28
            default:    value = 16'b0000000000000000;
        endcase
    end

    always @(negedge clk) begin
        data <= value;
    end

endmodule
