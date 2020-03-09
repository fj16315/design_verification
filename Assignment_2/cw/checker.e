<'

extend instruction_s {

    when ADD'cmd_in instruction_s {

        check_response(ins : instruction_s) is only {
	
	    if 4294967296-ins.din1 <= ins.din2 {
	       check that ins.resp == 2 else
	       dut_error(appendf("[R==>Port %d invalid response.<==R]\n \
	                          Instruction %s %d %d,\n \
				  expected 2,\n \
				  received %d.\n",
				  ins.port+1, ins.cmd_in, ins.din1, ins.din2, ins.resp));
	    } else {
	      check that ins.resp == 01 else
	       dut_error(appendf("[R==>Port %d invalid response.<==R]\n \
	                          Instruction %s %d %d,\n \
				  expected 1,\n \
				  received %d.\n",
				  ins.port+1, ins.cmd_in, ins.din1, ins.din2, ins.resp));
	    check that ins.dout == (ins.din1 + ins.din2) else
	    dut_error(appendf("[R==>Port %d invalid output.<==R]\n \
	                       Instruction %s %032.32b\n \
			                       %032.32b,\n \
			       expected        %032.32b \t %d,\n \
			       received        %032.32b \t %d.\n",
			       ins.port+1, ins.cmd_in, ins.din1, ins.din2,
			       (ins.din1 + ins.din2),
			       (ins.din1 + ins.din2),
			       ins.dout,ins.dout));
	   };
        
        };

    };

    when SUB'cmd_in instruction_s {

        check_response(ins : instruction_s) is only {

	    if ins.din1<ins.din2 {
	       check that ins.resp == 2 else
	       dut_error(appendf("[R==>Port %d invalid response.<==R]\n \
	                          Instruction %s %d %d,\n \
				  expected 2,\n \
				  received %d.\n",
				  ins.port+1, ins.cmd_in, ins.din1, ins.din2, ins.resp));
	    } else {
	      check that ins.resp == 01 else
	       dut_error(appendf("[R==>Port %d invalid response.<==R]\n \
	                          Instruction %s %d %d,\n \
				  expected 1,\n \
				  received %d.\n",
				  ins.port+1, ins.cmd_in, ins.din1, ins.din2, ins.resp));
	    check that ins.dout == (ins.din1 - ins.din2) else
	    dut_error(appendf("[R==>Port %d invalid output.<==R]\n \
	                       Instruction %s %032.32b\n \
			                       %032.32b,\n \
			       expected        %032.32b \t %d,\n \
			       received        %032.32b \t %d.\n",
			       ins.port+1, ins.cmd_in, ins.din1, ins.din2,
			       (ins.din1 - ins.din2),
			       (ins.din1 - ins.din2),
			       ins.dout,ins.dout));
	   };
        
        };

    };

    when SHL'cmd_in instruction_s {

        check_response(ins : instruction_s) is only {
	
	    check that ins.resp == 01;
	    check that ins.dout == (ins.din1 << ins.din2) else
	    dut_error(appendf("[R==>Port %d invalid output.<==R]\n \
	                       Instruction %s %032.32b %d,\n \
			       expected        %032.32b \t %d,\n \
			       received        %032.32b \t %d.\n",
			       ins.port+1, ins.cmd_in, ins.din1, ins.din2,
			       (ins.din1 << ins.din2),
			       (ins.din1 << ins.din2),
			       ins.dout,ins.dout));
        
        };

    };

    when SHR'cmd_in instruction_s {

        check_response(ins : instruction_s) is only {
	
	    check that ins.resp == 01;
	    check that ins.dout == (ins.din1 >> ins.din2) else
	    dut_error(appendf("[R==>Port %d invalid output.<==R]\n \
	                       Instruction %s %032.32b %d,\n \
			       expected        %032.32b \t %d,\n \
			       received        %032.32b \t %d.\n",
			       ins.port+1, ins.cmd_in, ins.din1, ins.din2,
			       (ins.din1 >> ins.din2),
			       (ins.din1 >> ins.din2),
			       ins.dout,ins.dout));
        
        };

    };

    when INV'cmd_in instruction_s {
    	 check_response(ins : instruction_s) is only {

	       check that ins.resp == 2 else
	       dut_error(appendf("[R==>Port %d invalid response.<==R]\n \
	                          Instruction %s %d %d,\n \
				  expected 2,\n \
				  received %d.\n",
				  ins.port+1, ins.cmd_in, ins.din1, ins.din2, ins.resp));

	    check that ins.dout == 0 else
	    dut_error(appendf("[R==>Port %d invalid output.<==R]\n \
	                       Instruction %s %d %d,\n \
			       expected        %032.32b \t %d,\n \
			       received        %032.32b \t %d.\n",
			       ins.port+1, ins.cmd_in, ins.din1, ins.din2,
			       0,
			       0,
			       ins.dout,ins.dout));
	};
    };

    when INV1'cmd_in instruction_s {
    	 check_response(ins : instruction_s) is only {

	       check that ins.resp == 2 else
	       dut_error(appendf("[R==>Port %d invalid response.<==R]\n \
	                          Instruction %s %d %d,\n \
				  expected 2,\n \
				  received %d.\n",
				  ins.port+1, ins.cmd_in, ins.din1, ins.din2, ins.resp));

	    check that ins.dout == 0 else
	    dut_error(appendf("[R==>Port %d invalid output.<==R]\n \
	                       Instruction %s %d %d,\n \
			       expected        %032.32b \t %d,\n \
			       received        %032.32b \t %d.\n",
			       ins.port+1, ins.cmd_in, ins.din1, ins.din2,
			       0,
			       0,
			       ins.dout,ins.dout));
	};
    };
};

extend driver_u {
       check_reset() is only {
	    check that (out_data1_p$ == 0 && out_data2_p$ == 0 && out_data3_p$ == 0 && out_data4_p$ == 0) else
	    dut_error(appendf("[R==>Reset output invalid.<==R]\n"));
	    check that (out_resp1_p$ == 0 && out_resp2_p$ == 0 && out_resp3_p$ == 0 && out_resp4_p$ == 0) else
	    dut_error(appendf("[R==>Reset output invalid.<==R]\n"));
      };
};

'>