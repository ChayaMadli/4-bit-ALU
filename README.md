# 4-Bit ALU — RTL Design and Verification

## Overview

This project implements a 4-bit Arithmetic Logic Unit (ALU) using Verilog RTL.

The ALU performs arithmetic and logical operations based on a 3-bit operation select input.

## Operations

| OP | Operation |
|----|-----------|
| 000 | ADD |
| 001 | SUB |
| 010 | AND |
| 011 | OR |
| 100 | XOR |
| 101 | Invalid |
| 110 | Invalid |
| 111 | Invalid |

## Inputs

- `A[3:0]` — 4-bit input A
- `B[3:0]` — 4-bit input B
- `OP[2:0]` — Operation select

## Outputs

- `RESULT[3:0]` — 4-bit ALU result
- `CARRY_BORROW` — Carry for addition and borrow for subtraction
- `ZERO` — Indicates when the result is zero

## Design

The ALU is implemented as combinational logic without a clock.

The RTL uses a `case` statement to select the required arithmetic or logical operation.

## Verification

A self-checking testbench was developed to verify the ALU.

Exhaustive verification was performed for all possible combinations of:

- 16 values of A
- 16 values of B
- 8 operation codes

Total:

**16 × 16 × 8 = 2,048 test cases**

### Verification Result

- Total Tests: 2048
- Passed: 2048
- Failed: 0
- Pass Rate: 100%

SystemVerilog assertions were also used to verify:

- ZERO flag behavior
- ADD carry behavior
- SUB borrow behavior

## Synthesis

The RTL was synthesized using Yosys.

The synthesized circuit was successfully generated and inspected as a hardware logic diagram.

The synthesized design contains arithmetic blocks, logic blocks, comparators, multiplexers, and supporting logic for the output flags.

## Tools Used

- Verilog
- SystemVerilog
- EDA Playground
- Icarus Verilog
- Yosys
- EPWave

## Project Files

```text
4-bit-ALU/
├── alu_4bit.v
├── alu_4bit_tb.sv
└── README.md