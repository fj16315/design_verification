<'

import calc1_sn_env.e;

extend instruction_s {
       keep cmd_in == SHL;
       //keep din2 in [0 .. 15];
       keep port in [0 .. 2];
       //keep port == 2;
       keep din2 >= 32;
};

extend driver_u {
       keep instructions_to_drive.size() == 10;
};

'>