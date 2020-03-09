   task drive_queue;
	input [0:3] req_cmd_in;
	input [0:31] req_first_data_in, req_second_data_in;

	begin
	   for (counter1 = 0; counter1 < 8; counter1=counter1+1) begin
		fifo[counter1] = 0;
		fifo1[counter1] = 0;
	   end

	   @(negedge c_clk);
	   req1_cmd_in = req_cmd_in;
	   req2_cmd_in = req_cmd_in;
	   req3_cmd_in = req_cmd_in;
	   req4_cmd_in = req_cmd_in;

	   req1_data_in = req_first_data_in;
	   req2_data_in = req_first_data_in;
	   req3_data_in = req_first_data_in;
	   req4_data_in = req_first_data_in;

	   @(negedge c_clk);
	   req1_cmd_in = `CMD_NONE;
	   req2_cmd_in = `CMD_NONE;
	   req3_cmd_in = `CMD_NONE;
	   req4_cmd_in = `CMD_NONE;

	   req1_data_in = req_second_data_in;
	   req2_data_in = req_second_data_in+1;
	   req3_data_in = req_second_data_in+2;
	   req4_data_in = req_second_data_in+3;

	   @(negedge c_clk);
	   req1_cmd_in = req_cmd_in;
	   req2_cmd_in = req_cmd_in;
	   req3_cmd_in = req_cmd_in;
	   req4_cmd_in = req_cmd_in;

	   req1_data_in = req_first_data_in;
	   req2_data_in = req_first_data_in;
	   req3_data_in = req_first_data_in;
	   req4_data_in = req_first_data_in;

	   @(negedge c_clk);
	   req1_cmd_in = `CMD_NONE;
	   req2_cmd_in = `CMD_NONE;
	   req3_cmd_in = `CMD_NONE;
	   req4_cmd_in = `CMD_NONE;

	   req1_data_in = req_second_data_in+4;
	   req2_data_in = req_second_data_in+5;
	   req3_data_in = req_second_data_in+6;
	   req4_data_in = req_second_data_in+7;

	   flag_queue = 1;
	end
   endtask

   task check_queue;
      input [0:20] test_no;

      reg [0:31] min;
	begin
	   min = (2**32)-1;
	   for (counter1 = 0; counter1 < 80; counter1=counter1+1) begin
		@(negedge c_clk);
		for (counter2 = 0; counter2 < 8; counter2=counter2+1) begin
		   if (~fifo[counter2]) begin
			if (counter1==79) begin
			   $display("Test %d failed due to a timeout with the queue\n", test_no);
			   counter2 = 8;
			end
		   end
		end
		if (fifo[0] && fifo[1] && fifo[2] && fifo[3] && fifo[4] && fifo[5] && fifo[6] && fifo[7]) begin
		   counter1 = 80;
		end
	   end
	   if (counter1!=80) begin
	      for (counter1 = 4; counter1 < 8; counter1=counter1+1) begin
		   if (fifo[counter1]<min) begin
		      min = fifo[counter1];
		   end
	      end
	      for (counter1 = 0; counter1 < 4; counter1=counter1+1) begin
		   if (fifo[counter1]>min) begin
		        $display("Test %d failed due to a line proccessing out of order \n", test_no);
			counter1 = 4;
		   end
	      end
	   end
	   flag_queue = 0;
	end
   endtask
