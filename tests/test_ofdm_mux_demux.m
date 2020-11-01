% Constants
mode1.K         = 1536;
mode1.L         = 76;
mode1.Tnull     = 2656;
mode1.Tu        = 2048;
mode1.Tg        = 504;
mode1.Ts        = mode1.Tu + mode1.Tg;
mode1.Tf        = mode1.Tnull + mode1.L * mode1.Ts;
mode1.mask      = [257:1024,1026:1793];

% X -> OFDM Mux -> OFDM Demux -> X
X_in = randn([mode1.L, mode1.Tu]) + 1j*randn([mode1.L, mode1.Tu]);
X_out = ofdm_demux(ofdm_mux(X_in));

e = X_in - X_out;

fprintf("Max Error = %e\n", sum(sum(e)));

% X -> OFDM Demux -> OFDM Mux -> X
X_in = randn([mode1.L, mode1.Tu]) + 1j*randn([mode1.L, mode1.Tu]);
X_out = ofdm_mux(ofdm_demux(X_in));

e = X_in - X_out;

fprintf("Max Error = %e\n", sum(sum(e)));