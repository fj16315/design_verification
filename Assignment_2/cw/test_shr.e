<'

import calc1_sn_env.e;

extend instruction_s {
       keep cmd_in == SHR;
       keep port in [0 .. 2];
       //keep din2 >= 33;
       keep soft din2 == select {
       	    25 : 0;
	    25 : 1;
	    10 : [2 .. 31];
	    25 : 32;
       };
};

extend driver_u {
       keep instructions_to_drive.size() == 10;
};

'>