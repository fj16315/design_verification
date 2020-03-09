<'

import calc1_sn_env;

extend instruction_s {
   keep cmd_in in [ADD,SUB,SHL,SHR];
   keep din1 == 0;
   keep port in [0 .. 2];
};

extend driver_u {
       keep instructions_to_drive.size() == 100;
};

'>