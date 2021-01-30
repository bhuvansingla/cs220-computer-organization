# Assignment 2

[30 points] 1. Implement a module for a 3-to-8 decoder. Implement another module for an 8-to-3 encoder. Implement a top module that instantiates a 3-to-8 decoder and an 8-to-3 encoder and connects them as follows. The decoder takes a three-bit input and feeds its outputs to the inputs of the encoder. It displays the decoder inputs and encoder outputs. Note that the displayed decoder inputs and encoder outputs must be identical. The top module must have all eight test cases.

[35 points] 2. Implement an 8-to-3 priority encoder where priority is given to the least significant input position with a 1. For example, if the input is 10010000, the output would be 100 encoding the position of the least significant 1 in the input (leftmost bit is the most significant bit). Write a top module to test your encoder. You must have at least ten test cases separated by one time unit delay.

[15 points] 3. Implement a module M with a single-bit output and clock input. The output toggles (i.e., changes from 0 to 1 or 1 to 0) every 25 thousand cycles. Initialize the output to 0 in the module. Write a top module that instantiates M and generates a clock signal of period ten time units and 50% duty cycle. Also, display the output of the module M whenever it changes. Do simulation for 310 thousand cycles.

[20 points] 4. Implement a module M with a four-bit output and clock input. The output rotates to the left by one bit position every 25 thousand cycles. Initialize the output to 1000. So, the outputs in subsequent 25 thousand cycles intervals would be 0001, 0010, 0100, 1000, 0001, ... Write a top module that instantiates M and generates a clock signal of period ten time units and 50% duty cycle. Also, display the output of the module M whenever it changes. Do simulation for 310 thousand cycles.

Submission: Submit your verilog files named clearly. For example, you could name the files as follows:

A2Q1_decoder3to8.v, A2Q1_encoder8to3.v, A2Q1_top.v  
A2Q2_priority_encoder3to8.v, A2Q2_top.v  
A2Q3_blink.v, A2Q3_top.v  
A2Q4_rotate.v, A2Q4_top.v  

Email the files as attachment to cs220spring2021submit@gmail.com. The subject line of the email MUST be the following (replace N by your group number): Assignment#2 submission for Group#N
