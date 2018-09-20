// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define NAND nand #50
`define NOR nor #50
`define XOR xor #50

// Decoder circuit

module behavioralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Uses concatenation and shift operators
    assign {out3,out2,out1,out0}=enable<<{address1,address0};
endmodule


module structuralDecoder
(
    output out0, out1, out2, out3,
    input address0, address1,
    input enable
);
    // Your decoder code here
    wire preout0;
    wire preout1;
    wire preout2;
    wire preout3;
    wire naddr0;
    wire naddr1;

    `NOT addr0inv(naddr0, address0);
    `NOT addr1inv(naddr1, address1);

    // Produce output according to input addresses
    `AND preout0gate(preout0, naddr0, naddr1);
    `AND preout1gate(preout1, address0, naddr1);
    `AND preout2gate(preout2, naddr0, address1);
    `AND preout3gate(preout3, address0, address1);

    // check ENABLE status
    `AND out0gate(out0, preout0, enable);
    `AND out1gate(out1, preout1, enable);
    `AND out2gate(out2, preout2, enable);
    `AND out3gate(out3, preout3, enable);

endmodule
