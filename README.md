# MIPS Taycore
A single-cycle MIPS Core implemented in Verilog. To be used for TSwift-based MIPS assembly language.

#### Goal
MIPS Processor -> MIPSwizzle Language -> MIPSwizzle Assembler -> Run on MIPS Processor

## Single-Cycle Architecture
![Single-Cycle](./img/mipsSingleCycle.jpg)

## Register Set
![Registers](./img/registerSet.jpg)

## Notes/Personal Considerations
- Currently, instruction memory is not byte-addressable. PC still works, but this deviates from original ISA.
- Would be good exercise to fully design the ALU myself and reduce abstractions.
- SLL and SRL alu control signals are probably not correct; I made them up. Need to refer to official ISA doc.

## Stages
1. Instruction Fetch
2. Instruction Decode
3. Execution
4. Memory Access
5. Write-back

## Operations Implemented

### R-Type
- add
- sub
- and
- or
- nor
- slt
- sll
- srl

### I-Type
- addi
- beq
- bne
- lw
- sw

### J-Type
- j

## TODO
- Hard: Make the single-cycle MIPS architecture.
- Harder: Interpreter for TSwift-based MIPS assembly language.
- VERY Hard: Re-write the architecture to make pipelining work.