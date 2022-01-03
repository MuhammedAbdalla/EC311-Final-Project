# Whack A Mole, Nexys Artix-7 FPGA Implementation

This Verilog HDL project implements a whack-a-mole game using the LED's, buttons, and switchs from the Artix-7 FPGA board
- The hammers are representend as the 5 buttons
- Since there are 5 hammers there will be 5 moles represented by the 5 Least Significant Bits (LSB)
- The game lasts 30 seconds and there are 3 speeds: a mole every 2, 1, and 0.5 seconds
- The mode change is controlled by the last two switches of the board: 00 is 0.5hz, _01 is 1hz, and 10 is 2hz_
- There is a 5 second down count before the game begins it's 30 second duration
- Score and time are displayed on 4 of the 8 seven-segment displays

This project was designed to be very modular in the case we needed to debug or modify some functionality of the project. All components are connected by a top module and are internally wired from one module to the next as well as returning the decoded 7-segment bits and 5-bit 1-hot encoded values for LED's
