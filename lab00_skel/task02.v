module task02(
	output reg serial_out,
	input serial_in,
	input clk,
	input reset
);
    reg [8:0] aux = 9'b000000000;
	always @(reset)
	begin
	   aux = 9'b000000000;
	end
	always @(posedge clk)
	begin
	   aux = aux << 1;
	   aux[0] = serial_in;
	   serial_out = aux[8];
	end

endmodule