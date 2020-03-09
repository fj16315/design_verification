<'

import calc1_sn_env.e;

extend instruction_s {
       keep cmd_in == ADD;
       keep port in [0 .. 2];
       keep soft din2 == select {
       	    100 : [0 .. 4294967296-din1];
       };
};

extend driver_u {
       keep instructions_to_drive.size() == 100;
};

'>