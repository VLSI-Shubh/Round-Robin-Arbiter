#!/usr/bin/env bash

set -e


RTL="src/rra.v"         
TB="testbench/test1/test1.v"         
SIM_EXE="sim.out"    

SYNTH_SCRIPT="synth/synth_rra.ys"
SHOW_SCRIPT="synth/show_rra.ys"


echo "[SIM] Compiling testbench + RTL..."
iverilog -g2012 -o "$SIM_EXE" "$RTL" "$TB"

echo "[SIM] Running simulation..."
vvp "$SIM_EXE"

echo "[SYNTH] Running Yosys synthesis..."
yosys -s "$SYNTH_SCRIPT"

echo "[SHOW] Running Yosys show to create SVG..."
yosys -s "$SHOW_SCRIPT"

echo "[DONE]"
