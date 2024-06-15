relaunch_sim
 ******************** End of testcase *****************
Command: launch_simulation -step compile -simset sim_1 -mode behavioral
INFO: [Vivado 12-12493] Simulation top is 'top'
WARNING: [Vivado 12-13340] Unable to auto find GCC executables from simulator install path! (path not set)
INFO: [Vivado 12-5682] Launching behavioral simulation in 'F:/lession/TapVivado/Router/Router.sim/sim_1/behav/xsim'
INFO: [SIM-utils-51] Simulation object is 'sim_1'
INFO: [SIM-utils-72] Using boost library from 'F:/app/Vivado/Xilinx/Vivado/2023.2/tps/boost_1_72_0'
INFO: [SIM-utils-54] Inspecting design source files for 'top' in fileset 'sim_1'...
INFO: [USF-XSim-97] Finding global include files...
INFO: [USF-XSim-100] Fetching design files from 'sources_1'...(this may take a while)...
INFO: [USF-XSim-101] Fetching design files from 'sim_1'...
INFO: [USF-XSim-2] XSim::Compile design
INFO: [USF-XSim-61] Executing 'COMPILE and ANALYZE' step in 'F:/lession/TapVivado/Router/Router.sim/sim_1/behav/xsim'
"xvlog --incr --relax -L uvm -prj top_vlog.prj"
ECHO is off.
ECHO is off.
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/DUT/Router.sv" into library xil_defaultlib
INFO: [VRFC 10-311] analyzing module Router
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/DUT/Logic_out.sv" into library xil_defaultlib
INFO: [VRFC 10-311] analyzing module Logic_out
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/DUT/Logic_in.sv" into library xil_defaultlib
INFO: [VRFC 10-311] analyzing module Logic_in
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/Top/Top.sv" into library xil_defaultlib
INFO: [VRFC 10-311] analyzing module top
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/TestBench/Global.sv" into library xil_defaultlib
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/TestBench/Interface.sv" into library xil_defaultlib
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/TestBench/Scoreboard.sv" into library xil_defaultlib
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/TestBench/Enviroment.sv" into library xil_defaultlib
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/TestBench/Packet.sv" into library xil_defaultlib
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/TestBench/TestCase.sv" into library xil_defaultlib
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/TestBench/Receiver.sv" into library xil_defaultlib
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/TestBench/Driver.sv" into library xil_defaultlib
INFO: [VRFC 10-2263] Analyzing SystemVerilog file "F:/lession/TapVivado/Router/Router.srcs/sources_1/Top/test16.sv" into library xil_defaultlib
INFO: [VRFC 10-311] analyzing module test
INFO: [USF-XSim-69] 'compile' step finished in '2' seconds
Command: launch_simulation -step elaborate -simset sim_1 -mode behavioral
INFO: [Vivado 12-12493] Simulation top is 'top'
WARNING: [Vivado 12-13340] Unable to auto find GCC executables from simulator install path! (path not set)
INFO: [Vivado 12-5682] Launching behavioral simulation in 'F:/lession/TapVivado/Router/Router.sim/sim_1/behav/xsim'
INFO: [SIM-utils-51] Simulation object is 'sim_1'
INFO: [USF-XSim-3] XSim::Elaborate design
INFO: [USF-XSim-61] Executing 'ELABORATE' step in 'F:/lession/TapVivado/Router/Router.sim/sim_1/behav/xsim'
"xelab --incr --debug typical --relax --mt 2 -L xil_defaultlib -L uvm -L unisims_ver -L unimacro_ver -L secureip --snapshot top_behav xil_defaultlib.top xil_defaultlib.glbl -log elaborate.log"
ECHO is off.
ECHO is off.
Vivado Simulator v2023.2
Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
Running: F:/app/Vivado/Xilinx/Vivado/2023.2/bin/unwrapped/win64.o/xelab.exe --incr --debug typical --relax --mt 2 -L xil_defaultlib -L uvm -L unisims_ver -L unimacro_ver -L secureip --snapshot top_behav xil_defaultlib.top xil_defaultlib.glbl -log elaborate.log 
Using 2 slave threads.
Starting static elaboration
Pass Through NonSizing Optimizer
Completed static elaboration
Starting simulation data flow analysis
Completed simulation data flow analysis
Time Resolution for simulation is 1ps
Compiling package xil_defaultlib.$unit_Router_sv_446723558
Compiling package std.std
Compiling module xil_defaultlib.cb
Compiling module xil_defaultlib.input_interface
Compiling module xil_defaultlib.cb
Compiling module xil_defaultlib.output_interface
Compiling module xil_defaultlib.testcase
Compiling module xil_defaultlib.Logic_in
Compiling module xil_defaultlib.Logic_out
Compiling module xil_defaultlib.Router_default
Compiling module xil_defaultlib.top
Compiling module xil_defaultlib.glbl
Built simulation snapshot top_behav
INFO: [USF-XSim-69] 'elaborate' step finished in '4' seconds
Time resolution is 1 ps
 ******************* Start of testcase ****************
 0 : Environment : created env object
 0 : Environment : start of run() method
 0 : Environment : start of build() method
 0 : Environment : end of build() method
 0 : Environment : start of reset() method
 30 : Environment : end of reset() method
 30 : Environment : start of cfg_dut() method
 30 : Environment : end of cfg_dut() method
 30 : Environment : start of start() method

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: f, Destination Address: 4
Payload: 
  3 : 7c 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: e, Destination Address: 4
Payload: 
  3 : ff 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: d, Destination Address: 4
Payload: 
  3 : 9d 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: c, Destination Address: 4
Payload: 
  3 : e1 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: b, Destination Address: 4
Payload: 
  3 : 3f 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: a, Destination Address: 4
Payload: 
  3 : d3 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: 9, Destination Address: 4
Payload: 
  3 : 97 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: 8, Destination Address: 4
Payload: 
  3 : e4 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: 7, Destination Address: 4
Payload: 
  3 : 68 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: 6, Destination Address: 4
Payload: 
  3 : d8 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: 5, Destination Address: 4
Payload: 
  3 : 69 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: 4, Destination Address: 4
Payload: 
  3 : 9d 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: 3, Destination Address: 4
Payload: 
  3 : ce 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: 2, Destination Address: 4
Payload: 
  3 : a4 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: 1, Destination Address: 4
Payload: 
  3 : 37 
		-------- END PACKET ---------- 

------ 50 : Driver : Randomization Successes full. ------
		-------- PACKET ---------- 
Name: Driver, Source Address: 0, Destination Address: 4
Payload: 
  3 : d7 
		-------- END PACKET ---------- 
------ 350 : Driver : Finished Driving the packet with length 8 ------

 350 : Environment : end of start() method
 350 : Environment : start of wait_for_end() method

------ 370 : Receiver : Received Successes full. ------
------ 390 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----390 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: 0, Destination Address: 4
Payload: 
  3 : d7 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: 0, Destination Address: 4
Payload: 
  3 : d7 
		-------- END PACKET ---------- 
 390 : Scoreboard :Packet Matched

------ 590 : Driver : Finished Driving the packet with length 8 ------


------ 610 : Receiver : Received Successes full. ------
------ 630 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----630 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: 1, Destination Address: 4
Payload: 
  3 : 37 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: 1, Destination Address: 4
Payload: 
  3 : 37 
		-------- END PACKET ---------- 
 630 : Scoreboard :Packet Matched

------ 830 : Driver : Finished Driving the packet with length 8 ------


------ 850 : Receiver : Received Successes full. ------
------ 870 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----870 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: 2, Destination Address: 4
Payload: 
  3 : a4 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: 2, Destination Address: 4
Payload: 
  3 : a4 
		-------- END PACKET ---------- 
 870 : Scoreboard :Packet Matched

------ 1070 : Driver : Finished Driving the packet with length 8 ------


------ 1090 : Receiver : Received Successes full. ------
------ 1110 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----1110 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: 3, Destination Address: 4
Payload: 
  3 : ce 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: 3, Destination Address: 4
Payload: 
  3 : ce 
		-------- END PACKET ---------- 
 1110 : Scoreboard :Packet Matched

------ 1310 : Driver : Finished Driving the packet with length 8 ------


------ 1330 : Receiver : Received Successes full. ------
------ 1350 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----1350 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: 4, Destination Address: 4
Payload: 
  3 : 9d 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: 4, Destination Address: 4
Payload: 
  3 : 9d 
		-------- END PACKET ---------- 
 1350 : Scoreboard :Packet Matched

------ 1550 : Driver : Finished Driving the packet with length 8 ------


------ 1570 : Receiver : Received Successes full. ------
------ 1590 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----1590 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: 5, Destination Address: 4
Payload: 
  3 : 69 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: 5, Destination Address: 4
Payload: 
  3 : 69 
		-------- END PACKET ---------- 
 1590 : Scoreboard :Packet Matched

------ 1790 : Driver : Finished Driving the packet with length 8 ------


------ 1810 : Receiver : Received Successes full. ------
------ 1830 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----1830 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: 6, Destination Address: 4
Payload: 
  3 : d8 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: 6, Destination Address: 4
Payload: 
  3 : d8 
		-------- END PACKET ---------- 
 1830 : Scoreboard :Packet Matched

------ 2030 : Driver : Finished Driving the packet with length 8 ------


------ 2050 : Receiver : Received Successes full. ------
------ 2070 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----2070 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: 7, Destination Address: 4
Payload: 
  3 : 68 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: 7, Destination Address: 4
Payload: 
  3 : 68 
		-------- END PACKET ---------- 
 2070 : Scoreboard :Packet Matched

------ 2270 : Driver : Finished Driving the packet with length 8 ------


------ 2290 : Receiver : Received Successes full. ------
------ 2310 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----2310 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: 8, Destination Address: 4
Payload: 
  3 : e4 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: 8, Destination Address: 4
Payload: 
  3 : e4 
		-------- END PACKET ---------- 
 2310 : Scoreboard :Packet Matched

------ 2510 : Driver : Finished Driving the packet with length 8 ------


------ 2530 : Receiver : Received Successes full. ------
------ 2550 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----2550 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: 9, Destination Address: 4
Payload: 
  3 : 97 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: 9, Destination Address: 4
Payload: 
  3 : 97 
		-------- END PACKET ---------- 
 2550 : Scoreboard :Packet Matched

------ 2750 : Driver : Finished Driving the packet with length 8 ------


------ 2770 : Receiver : Received Successes full. ------
------ 2790 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----2790 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: a, Destination Address: 4
Payload: 
  3 : d3 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: a, Destination Address: 4
Payload: 
  3 : d3 
		-------- END PACKET ---------- 
 2790 : Scoreboard :Packet Matched

------ 2990 : Driver : Finished Driving the packet with length 8 ------


------ 3010 : Receiver : Received Successes full. ------
------ 3030 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----3030 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: b, Destination Address: 4
Payload: 
  3 : 3f 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: b, Destination Address: 4
Payload: 
  3 : 3f 
		-------- END PACKET ---------- 
 3030 : Scoreboard :Packet Matched

------ 3230 : Driver : Finished Driving the packet with length 8 ------


------ 3250 : Receiver : Received Successes full. ------
------ 3270 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----3270 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: c, Destination Address: 4
Payload: 
  3 : e1 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: c, Destination Address: 4
Payload: 
  3 : e1 
		-------- END PACKET ---------- 
 3270 : Scoreboard :Packet Matched

------ 3470 : Driver : Finished Driving the packet with length 8 ------


------ 3490 : Receiver : Received Successes full. ------
------ 3510 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----3510 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: d, Destination Address: 4
Payload: 
  3 : 9d 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: d, Destination Address: 4
Payload: 
  3 : 9d 
		-------- END PACKET ---------- 
 3510 : Scoreboard :Packet Matched

------ 3710 : Driver : Finished Driving the packet with length 8 ------


------ 3730 : Receiver : Received Successes full. ------
------ 3750 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----3750 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: e, Destination Address: 4
Payload: 
  3 : ff 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: e, Destination Address: 4
Payload: 
  3 : ff 
		-------- END PACKET ---------- 
 3750 : Scoreboard :Packet Matched

------ 3950 : Driver : Finished Driving the packet with length 8 ------


------ 3970 : Receiver : Received Successes full. ------
------ 3990 :  Receiver : Finished  Receiving the packet with length 8 ------


 -----3990 : Scorebooard : Scoreboard received a packet from receiver -----
Packets match

pkt_rcv
		-------- PACKET ---------- 
Name: Receiver, Source Address: f, Destination Address: 4
Payload: 
  3 : 7c 
		-------- END PACKET ---------- 

pkt_drv
		-------- PACKET ---------- 
Name: Driver, Source Address: f, Destination Address: 4
Payload: 
  3 : 7c 
		-------- END PACKET ---------- 
 3990 : Scoreboard :Packet Matched

relaunch_sim: Time (s): cpu = 00:00:00 ; elapsed = 00:00:10 . Memory (MB): peak = 2584.121 ; gain = 16.602
