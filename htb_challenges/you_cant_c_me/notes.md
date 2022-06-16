# you cant c me
└─# ltrace ./auth     
printf("Welcome!\n"Welcome!
)                                                                                                                              = 9
malloc(21)                                                                                                                                        = 0x1d566b0
fgets( 
"\n", 21, 0x7f897cf3d9a0)                                                                                                                   = 0x1d566b0
strcmp("wh00ps!_y0u_d1d_c_m3", "\n")                                                                                                              = 109
printf("I said, you can't c me!\n"I said, you can't c me!
)                                                                                                               = 24
+++ exited (status 0) +++

└─# ./auth
Welcome!
wh00ps!_y0u_d1d_c_m3
HTB{wh00ps!_y0u_d1d_c_m3}
