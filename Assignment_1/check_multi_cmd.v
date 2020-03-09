   task check_multi_cmd_1;
	input [0:20] test_no;
	input [0:2] line_no;

	reg [0:5] counter_l;
	reg flag;

	begin
	   flag = 0;
	   #1
	   for (counter_l = 0; counter_l < 20; counter_l=counter_l+1) begin
		@(negedge c_clk);
		if (fifo[0] && fifo[1]) begin
		   flag = 1;
		end
	   end
	   if (~flag) begin
		$display("Test %d failed on line %d due to timeout or incorrect result\n", test_no, line_no);
	   end
	   flag_multi = 0;
	end
   endtask

   task check_multi_cmd_2;
	input [0:20] test_no;
	input [0:2] line_no;

	reg [0:5] counter_l;
	reg flag;

	begin
	   flag = 0;
	   #1
	   for (counter_l = 0; counter_l < 20; counter_l=counter_l+1) begin
		@(negedge c_clk);
		if (fifo1[0] && fifo1[1]) begin
		   flag = 1;
		end
	   end
	   if (~flag) begin
		$display("Test %d failed on line %d due to timeout or incorrect result\n", test_no, line_no);
	   end
	   flag_multi = 0;
	end
   endtask
