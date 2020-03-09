   function [0:31] expected_output;
	input [0:3] operator;
	input [0:31] operand_1, operand_2;
	begin
	   case (operator)
		`CMD_ADD: expected_output = operand_1+operand_2;
		`CMD_SUB: expected_output = operand_1-operand_2;
		`CMD_LSHIFT: expected_output = operand_1<<operand_2;
		`CMD_RSHIFT: expected_output = operand_1>>operand_2;
	   endcase
	end
   endfunction
