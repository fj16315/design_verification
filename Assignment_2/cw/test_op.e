
   Sample test.e file
   ----------------------
   This file provides basic test-specific constraints for the calc1 
   testbench.

<'

import calc1_sn_env;

extend instruction_s {
   keep cmd_in in [ADD,SUB,SHL,SHR];
   //keep cmd_in == ADD;
   //keep din1 < 4;
   keep soft din1 == select {
   	25 : 0;
	25 : 1;
	50 : [2 .. 4294967295];
   };
   //keep din2 < 10;
   //keep port in [0 .. 2];
   //keep port == 3;
   when ADD instruction_s {
	keep soft din2 == select {
	    10 : 0;
	    70 : [1 .. 4294967296-din1];
	    20 : [4294967297-din1 .. 4294967295];
	};
   };
   when SHL instruction_s {
   	keep soft din2 == select {
	     10 : 0;
	     10 : 1;
	     10 : 32;
	     35 : [2 .. 31];
	     35 : [33 .. 4294967295];
	};
   };
   when SHR instruction_s {
   	keep soft din2 == select {
	     10 : 0;
	     10 : 1;
	     10 : 32;
	     35 : [2 .. 31];
	     35 : [33 .. 4294967295];
	};
   };
   when SUB instruction_s {
	keep soft din2 == select {
	    10 : 0;
	    70 : [1 .. din1];
	    20 : [din1+1 .. 4294967295];
	};
   };
}; // extend instruction_s


extend driver_u {
   keep instructions_to_drive.size() == 400;
}; // extend driver_u

'>

