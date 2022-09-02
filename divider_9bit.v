`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////
module divider_9bit(Q,R,C_Dsr,Dvd,Dsr,clear
    );
     input [3:0]Dvd,Dsr;
     input clear;
     output [3:0]Q,R;
     output [4:0]C_Dsr;
     wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11,w12,w13,w14,w15,w16,w17,w18,w19,w20,w21,w22,w23,w24,w25,w26,w27,w28,w29,w30,w31,w32,w33;


     comp_2s t1 (C_Dsr,Dsr,clear);
     
	  fa_pin_4bit fa1 (w5,w4,w3,w2,w1,C_Dsr[3],C_Dsr[2],C_Dsr[1],C_Dsr[0],0,0,0,Dvd[3],clear);
     buf(Q[3],w5);
     mux_2x1 m1 (w6,0,w3,w5);
     mux_2x1 m2 (w7,0,w2,w5);
     mux_2x1 m3 (w8,Dvd[3],w1,w5);

     fa_pin_4bit fa2 (w13,w12,w11,w10,w9,C_Dsr[3],C_Dsr[2],C_Dsr[1],C_Dsr[0],w6,w7,w8,Dvd[2],clear);
     buf(Q[2],w13);
     mux_2x1 m4 (w14,w7,w11,w13);
     mux_2x1 m5 (w15,w8,w10,w13);
     mux_2x1 m6 (w16,Dvd[2],w9,w13);

     fa_pin_4bit fa3 (w21,w20,w19,w18,w17,C_Dsr[3],C_Dsr[2],C_Dsr[1],C_Dsr[0],w14,w15,w16,Dvd[1],clear);
     buf(Q[1],w21);
     mux_2x1 m7 (w22,w15,w19,w21);
     mux_2x1 m8 (w23,w16,w18,w21);
     mux_2x1 m9 (w24,Dvd[1],w17,w21);

     fa_pin_4bit fa4 (w29,w28,w27,w26,w25,C_Dsr[3],C_Dsr[2],C_Dsr[1],C_Dsr[0],w22,w23,w24,Dvd[0],clear);
     buf(Q[0],w29);
     mux_2x1 m10 (w30,w22,w28,w29);
     mux_2x1 m11 (w31,w23,w27,w29);
     mux_2x1 m12 (w32,w24,w26,w29);
     mux_2x1 m13 (w33,Dvd[0],w25,w29);

     and(R[3],w30,clear);
     and(R[2],w31,clear);
     and(R[1],w32,clear);
     and(R[0],w33,clear);

endmodule