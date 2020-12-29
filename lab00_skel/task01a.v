module task01a(
	output out,
	input in0,
	input in1,
	input in2,
	input in3
);

	wire aux1;
	or(aux1, in1, in2);
	wire aux2;
	or(aux2, in1, in3);
	wire aux3;
	wire aux4;
	not(aux3, in0);
	and(aux4, in3, aux2);
	wire aux5;
	nand(aux5, in3, aux1);
	and(out, aux5, aux4);

endmodule

