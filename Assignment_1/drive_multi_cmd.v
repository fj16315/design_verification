   task drive_multi_cmd_1;
	input [0:3] req_cmd_in;
	input [0:31] req_first_data_in, req_second_data_in;

	begin
	   for (counter1 = 0; counter1 < 8; counter1=counter1+1) begin
		fifo[counter1] = 0;
		fifo1[counter1] = 0;
	   end

	   @(negedge c_clk);
	   req1_cmd_in = req_cmd_in;
	   req1_data_in = req_first_data_in;

	   @(negedge c_clk);
	   req1_cmd_in = `CMD_NONE;
	   req1_data_in = req_second_data_in;

	   @(negedge c_clk);
	   req1_cmd_in = req_cmd_in;
	   req1_data_in = req_first_data_in;

	   @(negedge c_clk);
	   req1_cmd_in = `CMD_NONE;
	   req1_data_in = req_second_data_in+1;

	   flag_multi = 1;
	end
   endtask

   task drive_multi_cmd_2;
	input [0:3] req_cmd_in;
	input [0:31] req_first_data_in, req_second_data_in;

	begin
	   for (counter1 = 0; counter1 < 8; counter1=counter1+1) begin
		fifo[counter1] = 0;
		fifo1[counter1] = 0;
	   end

	   @(negedge c_clk);
	   req2_cmd_in = req_cmd_in;
	   req2_data_in = req_first_data_in;

	   @(negedge c_clk);
	   req2_cmd_in = `CMD_NONE;
	   req2_data_in = req_second_data_in;

	   @(negedge c_clk);
	   req2_cmd_in = req_cmd_in;
	   req2_data_in = req_first_data_in;

	   @(negedge c_clk);
	   req2_cmd_in = `CMD_NONE;
	   req2_data_in = req_second_data_in+1;

	   flag_multi = 1;
	end
   endtask

   task drive_multi_cmd_3;
	input [0:3] req_cmd_in;
	input [0:31] req_first_data_in, req_second_data_in;

	begin
	   for (counter2 = 0; counter2 < 8; counter2=counter2+1) begin
		fifo[counter2] = 0;
		fifo1[counter2] = 0;
	   end

	   @(negedge c_clk);
	   req3_cmd_in = req_cmd_in;
	   req3_data_in = req_first_data_in;

	   @(negedge c_clk);
	   req3_cmd_in = `CMD_NONE;
	   req3_data_in = req_second_data_in;

	   @(negedge c_clk);
	   req3_cmd_in = req_cmd_in;
	   req3_data_in = req_first_data_in;

	   @(negedge c_clk);
	   req3_cmd_in = `CMD_NONE;
	   req3_data_in = req_second_data_in+1;

	   flag_multi = 1;
	end
   endtask

   task drive_multi_cmd_4;
	input [0:3] req_cmd_in;
	input [0:31] req_first_data_in, req_second_data_in;

	begin
	   for (counter2 = 0; counter2 < 8; counter2=counter2+1) begin
		fifo[counter2] = 0;
		fifo1[counter2] = 0;
	   end

	   @(negedge c_clk);
	   req4_cmd_in = req_cmd_in;
	   req4_data_in = req_first_data_in;

	   @(negedge c_clk);
	   req4_cmd_in = `CMD_NONE;
	   req4_data_in = req_second_data_in;

	   @(negedge c_clk);
	   req4_cmd_in = req_cmd_in;
	   req4_data_in = req_first_data_in;

	   @(negedge c_clk);
	   req4_cmd_in = `CMD_NONE;
	   req4_data_in = req_second_data_in+1;

	   flag_multi = 1;
	end
   endtask
