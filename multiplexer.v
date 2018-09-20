// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define NAND nand #50
`define NOR nor #50
`define XOR xor #50

// Multiplexer circuit

module behavioralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Join single-bit inputs into a bus, use address as index
    wire[3:0] inputs = {in3, in2, in1, in0};
    wire[1:0] address = {address1, address0};
    assign out = inputs[address];
endmodule


module structuralMultiplexer
(
    output out,
    input address0, address1,
    input in0, in1, in2, in3
);
    // Your multiplexer code here
    wire naddr0;
    wire naddr1;
    wire signal0, signal1, signal2, signal3;
    wire out0, out1, out2, out3;
    wire preout0, preout1;

    `NOT addr0inv(naddr0, address0);
    `NOT addr1inv(naddr1, address1);

    `AND gate0(signal0, naddr0, naddr1);
    `AND gate1(signal1, address0, naddr1);
    `AND gate2(signal2, naddr0, address1);
    `AND gate3(signal3, address0, address1);

    `AND nextgate0(out0, signal0, in0);
    `AND nextgate1(out1, signal1, in1);
    `AND nextgate2(out2, signal2, in2);
    `AND nextgate3(out3, signal3, in3);

    `OR orgate0(preout0, out0, out1);
    `OR orgate1(preout1, out2, out3);

    `OR orgate3(out, preout0, preout1);
endmodule
