<'

import calc1_sn_env.e;

extend instruction_s {
       keep cmd_in in [NOP, INV, INV1];
       //keep cmd_in == INV;
       //keep port in [0 .. 2];
       //keep din1 == 2;
       //keep din2 == 1;
};

extend driver_u {
       keep instructions_to_drive.size() == 20;
};

'>