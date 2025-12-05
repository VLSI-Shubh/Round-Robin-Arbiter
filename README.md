![RTL Design](https://img.shields.io/badge/RTL%20Design-Completed-brightgreen)
![Functional Verification](https://img.shields.io/badge/Functional%20Verification-Completed-brightgreen)
![PYUVM Verification](https://img.shields.io/badge/PYUVM%20Verification-In%20progress-yellow)
![Synthesis](https://img.shields.io/badge/Synthesis-Completed-brightgreen)
![FPGA Implementation](https://img.shields.io/badge/FPGA%20Implementation-Pending-orange)

# Round Robin Arbiter

A Round Robin Arbiter implementation in Verilog for fair and deterministic resource allocation in digital systems.

## Overview

This repository provides a synthesizable Round Robin Arbiter design that implements a rotating priority scheme to ensure equitable access among multiple requesters. The arbiter guarantees that no requester experiences indefinite starvation while maintaining predictable access patterns for shared resource management.

The design rotates priority after each completed grant cycle, allowing all active requesters to receive service over time. The implementation is fully synthesizable and compatible with standard digital design workflows including simulation, synthesis, and hardware deployment.

## Features

- Fair allocation through rotating priority mechanism
- Synthesizable RTL without non-standard constructs
- Comprehensive test benches for functional verification
- Automated simulation and synthesis flow

## Architecture

The arbiter evaluates incoming request lines and issues grant signals based on the current priority pointer. When a granted requester maintains its request signal, the arbiter preserves the grant. Upon request completion, priority advances to the next active requester, ensuring deterministic round robin behavior.

## Directory Structure

```
ROUND ROBIN ARBITER/
├── src/
│   └── rra.v                    
├── synth/
│   ├── synth_rra.ys              # Yosys synthesis script
│   └── show_rra.ys               # Yosys visualization script
├── testbench/
│   ├── test1/
│   │   ├── test1.v               
│   │   └── output-test1.png      # Reference waveform
│   └── test2/
│       ├── test2.v               
│       └── output-test2.png      # Reference waveform
└── run_sim.sh                    # Automated build and test script
```
### Testbenches

There are two main testbenches for the round-robin arbiter:

``` test1.v ```
- Simple testbench for basic functional verification  
- Provides standard request–grant sequences with minimal overlap  
- Useful for initial sanity checking of the arbiter logic  

```test2.v```
- Stress testbench designed to create simultaneous requests and extended conflicts  
- Exercises round-robin rotation under heavy contention  
- Validates correct grant cycling, fairness, and pointer updates in waveforms  

## Tools Used

- Icarus Verilog (for simulation)
- Yosys (for synthesis and visualization)
- GTKWave (optional, for waveform viewing)

## Usage

### Running Simulation and Synthesis

Execute the automated build script:

```bash
./run_sim.sh
```

This script performs the following operations:
1. Compiles RTL and test bench modules
2. Executes simulation test cases
3. Generates VCD waveform files
4. Performs logic synthesis
5. Creates schematic visualizations

Synthesis outputs are available in the `synth/` directory for reference:
- `rra_synth.v` contains the structural netlist
- `rra.svg` provides a graphical representation of the synthesized logic

## Implementation Notes

- The design uses synchronous logic with a single clock domain
- Grant signals are mutually exclusive
- Priority rotation occurs on the cycle following request deassertion
- The arbiter supports back-to-back grants to different requesters

## License
Open for educational and personal use under the [MIT License](License.txt)

## Contributing
Contributions are welcome. Please ensure that any modifications maintain synthesizability and include appropriate test coverage.
