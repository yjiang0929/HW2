// define gates with delays
`define AND and #50
`define OR or #50
`define NOT not #50
`define NAND nand #50
`define NOR nor #50
`define XOR xor #50

// Adder circuit

module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Your adder code here
    wire xorab;
    wire andab, andc;

    `XOR xorgate0(xorab, a, b);
    `XOR xorgate1(sum, xorab, carryin);

    `AND andgate0(andab, a, b);
    `AND andgate1(andc, xorab, carryin);
    `OR orgate(carryout, andab, andc);
endmodule
