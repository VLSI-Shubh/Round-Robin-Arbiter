#!/usr/bin/env bash

set -e

RTL="src/rra.v"

TB1="testbench/test1/test1.v"
TB2="testbench/test2/test2.v"

SIM_EXE1="sim_test1.out"
SIM_EXE2="sim_test2.out"

SYNTH_SCRIPT="synth/synth_rra.ys"
SHOW_SCRIPT="synth/show_rra.ys"

echo "[SIM1] Compiling testbench 1 + RTL..."
iverilog -g2012 -o "$SIM_EXE1" "$RTL" "$TB1"

echo "[SIM1] Running simulation 1..."
vvp "$SIM_EXE1"

echo "[SIM2] Compiling testbench 2 + RTL..."
iverilog -g2012 -o "$SIM_EXE2" "$RTL" "$TB2"

echo "[SIM2] Running simulation 2..."
vvp "$SIM_EXE2"

echo "[SYNTH] Running Yosys synthesis..."
yosys -s "$SYNTH_SCRIPT"

echo "[SHOW] Running Yosys show to create SVG..."
yosys -s "$SHOW_SCRIPT"

echo "[DONE]"
