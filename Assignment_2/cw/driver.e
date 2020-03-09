
   Sample driver.e file
   --------------------
   This file provides the basic structure for the calc1 testbench 
   driver. 

   The driver interacts directly with the DUV by driving test data into
   the DUV and collecting the response from the DUV. It also invokes the
   instruction specific response checker. 

<'

unit driver_u {

   clk_p : inout simple_port of bit is instance; // can be driven or read by sn
   keep clk_p.hdl_path() == "~/calc1_sn/c_clk";

   reset_p : out simple_port of uint(bits:7) is instance; // driven by sn
   keep reset_p.hdl_path() == "~/calc1_sn/reset";

   req1_cmd_in_p : out simple_port of uint(bits:4) is instance; // driven by sn
   keep req1_cmd_in_p.hdl_path() == "~/calc1_sn/req1_cmd_in";

   req1_data_in_p : out simple_port of uint(bits:32) is instance; // driven by sn
   keep req1_data_in_p.hdl_path() == "~/calc1_sn/req1_data_in";

   out_resp1_p : in simple_port of uint(bits:2) is instance; // read by sn
   keep out_resp1_p.hdl_path() == "~/calc1_sn/out_resp1";

   out_data1_p : in simple_port of uint(bits:32) is instance; // read by sn
   keep out_data1_p.hdl_path() == "~/calc1_sn/out_data1";

   req2_cmd_in_p : out simple_port of uint(bits:4) is instance; // driven by sn
   keep req2_cmd_in_p.hdl_path() == "~/calc1_sn/req2_cmd_in";

   req2_data_in_p : out simple_port of uint(bits:32) is instance; // driven by sn
   keep req2_data_in_p.hdl_path() == "~/calc1_sn/req2_data_in";

   out_resp2_p : in simple_port of uint(bits:2) is instance; // read by sn
   keep out_resp2_p.hdl_path() == "~/calc1_sn/out_resp2";

   out_data2_p : in simple_port of uint(bits:32) is instance; // read by sn
   keep out_data2_p.hdl_path() == "~/calc1_sn/out_data2";

   req3_cmd_in_p : out simple_port of uint(bits:4) is instance; // driven by sn
   keep req3_cmd_in_p.hdl_path() == "~/calc1_sn/req3_cmd_in";

   req3_data_in_p : out simple_port of uint(bits:32) is instance; // driven by sn
   keep req3_data_in_p.hdl_path() == "~/calc1_sn/req3_data_in";

   out_resp3_p : in simple_port of uint(bits:2) is instance; // read by sn
   keep out_resp3_p.hdl_path() == "~/calc1_sn/out_resp3";

   out_data3_p : in simple_port of uint(bits:32) is instance; // read by sn
   keep out_data3_p.hdl_path() == "~/calc1_sn/out_data3";

   req4_cmd_in_p : out simple_port of uint(bits:4) is instance; // driven by sn
   keep req4_cmd_in_p.hdl_path() == "~/calc1_sn/req4_cmd_in";

   req4_data_in_p : out simple_port of uint(bits:32) is instance; // driven by sn
   keep req4_data_in_p.hdl_path() == "~/calc1_sn/req4_data_in";

   out_resp4_p : in simple_port of uint(bits:2) is instance; // read by sn
   keep out_resp4_p.hdl_path() == "~/calc1_sn/out_resp4";

   out_data4_p : in simple_port of uint(bits:32) is instance; // read by sn
   keep out_data4_p.hdl_path() == "~/calc1_sn/out_data4";
  

   instructions_to_drive : list of instruction_s;


   event clk is fall(clk_p$)@sim;
   event resp1 is change(out_resp1_p$)@sim;
   event resp2 is change(out_resp2_p$)@sim;
   event resp3 is change(out_resp3_p$)@sim;
   event resp4 is change(out_resp4_p$)@sim;
   check_reset() is empty;


   drive_reset() @clk is {
      var i : int;

      for { i=0; i<=8; i+=1 } do {

         reset_p$ = 1111111;
         wait cycle;

      }; // for

      reset_p$ = 0000000;
      check_reset();

   }; // drive_reset


   drive_instruction(ins : instruction_s, i : int) @clk is {

      // display generated command and data
      outf("Command %s = %s\n", i, ins.cmd_in);
      out("Op1     = ", ins.din1);
      out("Op2     = ", ins.din2);
      out("Port    = ", ins.port+1);
      out();

      // drive data into calculator port 1
      if ins.port==0 {
         req1_cmd_in_p$  = pack(NULL, ins.cmd_in);
         req1_data_in_p$ = pack(NULL, ins.din1);

	 wait cycle;

         req1_cmd_in_p$  = 0000;  
         req1_data_in_p$ = pack(NULL, ins.din2);
      } else if ins.port==1 {
         req2_cmd_in_p$  = pack(NULL, ins.cmd_in);
         req2_data_in_p$ = pack(NULL, ins.din1);

	 wait cycle;

         req2_cmd_in_p$  = 0000;  
         req2_data_in_p$ = pack(NULL, ins.din2);
      } else if ins.port==2 {
         req3_cmd_in_p$  = pack(NULL, ins.cmd_in);
         req3_data_in_p$ = pack(NULL, ins.din1);

	 wait cycle;

         req3_cmd_in_p$  = 0000;  
         req3_data_in_p$ = pack(NULL, ins.din2);
      } else if ins.port==3 {
         req3_cmd_in_p$  = pack(NULL, ins.cmd_in);
         req3_data_in_p$ = pack(NULL, ins.din1);

	 wait cycle;

         req1_cmd_in_p$  = 0000;  
         req1_data_in_p$ = pack(NULL, ins.din2);
      };
         
   }; // drive_instruction


   collect_response(ins : instruction_s) @clk is {
      var i : int;
      
      //wait @resp1; -- wait for the response
      if ins.port==0 {
         for {i=0; i<10; i+=1} do {
	     wait cycle;
	     if (out_resp1_p$==1 || out_resp1_p$==2 || out_resp1_p$==3) {
	     	ins.resp = out_resp1_p$;
		ins.dout = out_data1_p$;
		ins.check_response(ins);
		i = 10;
	     };
	     check i!=9 else dut_error(appendf("[R==>Port 1 timed out.<==R]\n \
	     Instruction %s %d %d,\n \
	     expected %032.32b \t %d,\n",
	     ins.cmd_in, ins.din1, ins.din2,
	     (ins.din1 + ins.din2),
	     (ins.din1 + ins.din2)));
	 };
      } else if ins.port==1 {
         for {i=0; i<10; i+=1} do {
	     wait cycle;
	     if (out_resp2_p$==1 || out_resp2_p$==2 || out_resp2_p$==3) {
	     	ins.resp = out_resp2_p$;
		ins.dout = out_data2_p$;
		ins.check_response(ins);
		i = 10;
	     };
	     check i!=9 else dut_error(appendf("[R==>Port 2 timed out.<==R]\n \
	     Instruction %s %d %d,\n \
	     expected %032.32b \t %d,\n",
	     ins.cmd_in, ins.din1, ins.din2,
	     (ins.din1 + ins.din2),
	     (ins.din1 + ins.din2)));
	 };
      } else if ins.port==2 {
         for {i=0; i<10; i+=1} do {
	     wait cycle;
	     if (out_resp3_p$==1 || out_resp3_p$==2 || out_resp3_p$==3) {
	     	ins.resp = out_resp3_p$;
		ins.dout = out_data3_p$;
		ins.check_response(ins);
		i = 10;
	     };
	     check i!=9 else dut_error(appendf("[R==>Port 3 timed out.<==R]\n \
	     Instruction %s %d %d,\n \
	     expected %032.32b \t %d,\n",
	     ins.cmd_in, ins.din1, ins.din2,
	     (ins.din1 + ins.din2),
	     (ins.din1 + ins.din2)));
	 };
      } else if ins.port==3 {
      	 wait cycle;
         for {i=0; i<10; i+=1} do {
	     if (out_resp4_p$==1 || out_resp4_p$==2 || out_resp4_p$==3) {
	     	ins.resp = out_resp4_p$;
		ins.dout = out_data4_p$;
		ins.check_response(ins);
		i = 10;
	     };
	     check i!=9 else dut_error(appendf("[R==>Port 4 timed out.<==R]\n \
	     Instruction %s %d %d,\n \
	     expected %032.32b \t %d,\n",
	     ins.cmd_in, ins.din1, ins.din2,
	     (ins.din1 + ins.din2),
	     (ins.din1 + ins.din2)));
	 };
      };

   }; // collect_response


   drive() @clk is {

      drive_reset();

      for each (ins) in instructions_to_drive do {
       
         drive_instruction(ins, index);
         collect_response(ins);
         //ins.check_response(ins);
         wait cycle;

      }; // for each instruction

      wait [10] * cycle;
      stop_run();

   }; // drive


   run() is also {
      start drive();        // spawn
   }; // run

}; // unit driver_u


'>

