include "recursive2.verifier.circom";

template Main() {
    signal input publics[43];
    signal input root1[4];
    signal input root2[4];
    signal input root3[4];
    signal input root4[4];

    signal input evals[82][3];

    signal input s0_vals1[64][12];
    signal input s0_vals3[64][3];
    signal input s0_vals4[64][79];
    signal input s0_valsC[64][23];
    signal input s0_siblings1[64][25][4];
    signal input s0_siblings3[64][25][4];
    signal input s0_siblings4[64][25][4];
    signal input s0_siblingsC[64][25][4];

    signal input s1_root[4];
    signal input s2_root[4];
    signal input s3_root[4];
    signal input s4_root[4];

    signal input s1_vals[64][48];
    signal input s1_siblings[64][21][4];
    signal input s2_vals[64][96];
    signal input s2_siblings[64][16][4];
    signal input s3_vals[64][96];
    signal input s3_siblings[64][11][4];
    signal input s4_vals[64][96];
    signal input s4_siblings[64][6][4];

    signal input finalPol[64][3];

    component sv = StarkVerifier();

    for (var i=0; i<43; i++) {
        sv.publics[i] <== publics[i];
    }

    component isOne = IsZero();
    isOne.in <== publics[42] -publics[16] -1;

    component muxKey = Num1(4);
    muxKey.s = isOne.out;
    muxKey.c[0][0] <== <% key1[0] -%>;
    muxKey.c[0][1] <== <% key1[1] -%>;
    muxKey.c[0][2] <== <% key1[2] -%>;
    muxKey.c[0][3] <== <% key1[3] -%>;
    muxKey.c[1][0] <== <% key2[0] -%>;
    muxKey.c[1][1] <== <% key2[1] -%>;
    muxKey.c[1][2] <== <% key2[2] -%>;
    muxKey.c[1][3] <== <% key2[3] -%>;

    sv.publics[43] <== muxKey.out[0];
    sv.publics[44] <== muxKey.out[1];
    sv.publics[45] <== muxKey.out[2];
    sv.publics[46] <== muxKey.out[3];

    sv.root1 <== root1;
    sv.root2 <== root2;
    sv.root3 <== root3;
    sv.root4 <== root4;

    sv.rootC[0] <== <% key2[0] -%>;
    sv.rootC[1] <== <% key2[1] -%>;
    sv.rootC[2] <== <% key2[2] -%>;
    sv.rootC[3] <== <% key2[3] -%>;

    sv.evals <== evals;

    sv.s0_vals1 <== s0_vals1;
    sv.s0_vals2 <== s0_vals2;
    sv.s0_vals3 <== s0_vals3;
    sv.s0_valsC <== s0_valsC;
    sv.s0_siblings1 <== s0_siblings1;
    sv.s0_siblings2 <== s0_siblings2;
    sv.s0_siblings3 <== s0_siblings3;
    sv.s0_siblingsC <== s0_siblingsC;

    sv.s1_root <== s1_root;
    sv.s2_root <== s2_root;
    sv.s3_root <== s3_root;
    sv.s4_root <== s4_root;

    sv.s1_vals <== s1_vals;
    sv.s1_siblings <== s1_siblings;
    sv.s2_vals <== s2_vals;
    sv.s2_siblings <== s2_siblings;
    sv.s3_vals <== s3_vals;
    sv.s3_siblings <== s3_siblings;
    sv.s4_vals <== s4_vals;
    sv.s4_siblings <== s4_siblings;

    sv.finalPol <== finalPol;
}