module task03(
	output reg out,
	input [7:0] in,
	input clk,
	input reset
);

	localparam STATE_NONE	= 3'd0;
	localparam state_A = "A";
	localparam state_B = "B";
	localparam state_C = "C";
	localparam state_D = "D";

	reg [2:0] state;

	always @(posedge clk) begin
		if (reset) begin
			state <= STATE_NONE;
		end else begin
			// TODO: Implementati logica tranzitiilor intre stari.
			// TODO: Implementati logica iesirii.
			case(in)
			      state_B:
			      begin
			         state = 3'b001;
			         out = 0;
			      end
			      state_A:
			      begin
			         if (state == 3'b001)
			         begin
			             state = 3'b010;
			             out = 0;
			         end else begin
			             state = 3'b000;
			             out = 0;
			         end
			      end
			      state_D:
			      begin
			         if (state == 3'b010)
			         begin
			             state = 3'b011;
			             out = 0;
			         end else begin
			             state = 3'b000;
			             out = 0;
			         end
			      end
			      state_C:
			      begin
			         if (state == 3'b011)
			         begin
			             state = 3'b000;
			             out = 1;
			         end else begin
			             state = 3'b000;
			             out = 0;
			         end
			      end
			      default:
			      begin
			      state = 3'b000;
			      out = 0;
			      end
			endcase
		end
	end

endmodule
