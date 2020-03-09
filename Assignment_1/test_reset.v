   task drive_reset;
	begin
	   reset[1] = 1;
	   #800
	   reset[1] = 0;
	end
   endtask

   task check_reset;
	begin
	   if (out_resp1) begin
		$display("Test failed on line 1 as response out after reset is: %d \n", out_resp1);
	   end
	   if (out_resp2) begin
		$display("Test failed on line 2 as response out after reset is: %d \n", out_resp2);
	   end
	   if (out_resp3) begin
		$display("Test failed on line 3 as response out after reset is: %d \n", out_resp3);
	   end
	   if (out_resp4) begin
		$display("Test failed on line 4 as response out after reset is: %d \n", out_resp4);
	   end
	   if (out_data1) begin
		$display("Test failed on line 1 as data out after reset is: %d \n", out_data1);
	   end
	   if (out_data2) begin
		$display("Test failed on line 2 as data out after reset is: %d \n", out_data2);
	   end
	   if (out_data3) begin
		$display("Test failed on line 3 as data out after reset is: %d \n", out_data3);
	   end
	   if (out_data4) begin
		$display("Test failed on line 4 as data out after reset is: %d \n", out_data4);
	   end
	   if (req1_cmd_in) begin
		$display("Test failed on line 1 as command in after reset is: %d \n", req1_cmd_in);
	   end
	   if (req2_cmd_in) begin
		$display("Test failed on line 2 as command in after reset is: %d \n", req2_cmd_in);
	   end
	   if (req3_cmd_in) begin
		$display("Test failed on line 3 as command in after reset is: %d \n", req3_cmd_in);
	   end
	   if (req4_cmd_in) begin
		$display("Test failed on line 4 as command in after reset is: %d \n", req4_cmd_in);
	   end
	   if (req1_data_in) begin
		$display("Test failed on line 1 as data in after reset is: %d \n", req1_data_in);
	   end
	   if (req2_data_in) begin
		$display("Test failed on line 2 as data in after reset is: %d \n", req2_data_in);
	   end
	   if (req3_data_in) begin
		$display("Test failed on line 3 as data in after reset is: %d \n", req3_data_in);
	   end
	   if (req4_data_in) begin
		$display("Test failed on line 4 as data in after reset is: %d \n", req4_data_in);
	   end
	end
   endtask
