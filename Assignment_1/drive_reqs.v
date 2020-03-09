   task drive_reqs_1;
	input [0:3] req_cmd_in;
	input [0:31] req_first_data_in;
	input [0:31] req_second_data_in;

	begin
		@(negedge c_clk);
	   	req1_cmd_in = req_cmd_in;
	   	req1_data_in = req_first_data_in;

	   	@(negedge c_clk);
	   	req1_cmd_in = 0;
	   	req1_data_in = req_second_data_in;
	end
   endtask

   task drive_reqs_2;
	input [0:3] req_cmd_in;
	input [0:31] req_first_data_in;
	input [0:31] req_second_data_in;

	begin
		@(negedge c_clk);
	   	req2_cmd_in = req_cmd_in;
	   	req2_data_in = req_first_data_in;

	   	@(negedge c_clk);
	   	req2_cmd_in = 0;
	   	req2_data_in = req_second_data_in;
	end
   endtask

   task drive_reqs_3;
	input [0:3] req_cmd_in;
	input [0:31] req_first_data_in;
	input [0:31] req_second_data_in;

	begin
		@(negedge c_clk);
	   	req3_cmd_in = req_cmd_in;
	   	req3_data_in = req_first_data_in;

	   	@(negedge c_clk);
	   	req3_cmd_in = 0;
	   	req3_data_in = req_second_data_in;
	end
   endtask

   task drive_reqs_4;
	input [0:3] req_cmd_in;
	input [0:31] req_first_data_in;
	input [0:31] req_second_data_in;

	begin
		@(negedge c_clk);
	   	req4_cmd_in = req_cmd_in;
	   	req4_data_in = req_first_data_in;

	   	@(negedge c_clk);
	   	req4_cmd_in = 0;
	   	req4_data_in = req_second_data_in;
	end
   endtask
