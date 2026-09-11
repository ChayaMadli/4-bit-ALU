# Synthesis Report — 4-bit ALU

## Synthesis Tool

- Tool: Yosys
- Target: 4-bit ALU RTL
- Design type: Combinational logic
- Clock: None

## RTL Synthesis

The SystemVerilog RTL was synthesized using Yosys.

The synthesis flow converted the behavioral RTL into a gate-level logic representation.

### Synthesis observations

- No latches were inferred.
- No flip-flops were inferred.
- No memories were inferred.
- The ALU operation selection was implemented using multiplexing logic.
- Arithmetic and logic operations were converted into hardware logic.

## Functional Verification

The ALU was exhaustively verified using all possible combinations of:

- A: 16 values
- B: 16 values
- OP: 8 values

Total test cases:

**16 × 16 × 8 = 2048**

Verification result:

- Total Tests: 2048
- Passed: 2048
- Failed: 0
- Status: ALL TESTS PASSED

## Supported Operations

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

## Outputs

- `RESULT[3:0]` — 4-bit operation result
- `CARRY_BORROW` — carry for addition / borrow for subtraction
- `ZERO` — indicates when the result is zero

## Project Flow

```text
SystemVerilog RTL
       ↓
Functional Simulation
       ↓
Exhaustive Verification
       ↓
2048 / 2048 Tests Passed
       ↓
Yosys Synthesis
       ↓
Gate-Level Logic Representation
