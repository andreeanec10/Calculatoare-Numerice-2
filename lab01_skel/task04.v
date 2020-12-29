module task04 (
        input  wire clk,        // clock
        input  wire rst,        // reset
        input  wire [3:0] address,
        output wire [7:0] data
    );
 
	reg [1:0]  state;
	reg [1:0]  next_state;
	
	/* Memory params */
	reg we, oe, cs;
	
	// TODO: Define other required params
	wire [7:0] buffer_rom;
	wire [7:0] buffer_sram;
	reg [7:0] buffer_out;
 
	localparam TRUE = 1'b1,
				  FALSE = 1'b0,
				  STATE_IDLE = 2'd0,
				  STATE_SRAM_READ_INIT = 2'b01,
				  STATE_SRAM_READ = 2'b10;
 
	// TODO: Implement transition from state to next state
	always @(clk) begin
		if (rst)
			state <= STATE_IDLE; 
		else
			state <= next_state;
	end
 
	// TODO: Implement the process of reading/writing data
	//                 how to change the state
	// Hint: Pay attention to the list of signals which trigger the block.
	//       When do we want it to run?
	always @(*) begin
		case (state)
			STATE_IDLE: begin
			we = 0;
			oe = 0;
			cs = 0;
			if (address !== 4'dz)
				next_state = STATE_SRAM_READ_INIT;
			else
				next_state = STATE_IDLE;
				
			end
			STATE_SRAM_READ_INIT: begin
			oe = 1;
			we = 0;
			cs = 1;
			next_state = STATE_SRAM_READ;
			
			end
			STATE_SRAM_READ: begin
				if (buffer_sram !== 8'dx) begin
					buffer_out = buffer_sram;
					next_state = STATE_IDLE;
				end else begin
					buffer_out = buffer_rom;
					we = 1;
					oe = 0;
					next_state = STATE_IDLE;
				end
			end
		endcase
	end
	
	// TODO: Assign a value to data bus
	assign data = buffer_out;
	assign buffer_sram = (we == 1) ? buffer_out : 0'dz;
	
	// TODO: Create an instance for each memory module
	// Hint: Pay attention to the address width
	task01 rom(address, buffer_rom);
	task03 sram(clk, oe, cs, we, {3'd0, address}, buffer_sram);
endmodule