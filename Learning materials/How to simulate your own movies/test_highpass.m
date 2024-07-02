[opts_2p,opts_back] = get_1p_defaults();
opts_2p.ns = 100;
opts_2p.n_cell = 200;
opts_back.ns = 100;
opts_back.n_cell = 10;
opts_back.cell_radius = [20,40];


if isfile('Example_1p_movie.h5')
    delete('Example_1p_movie.h5')
end
if isfile('Example_1p_movie.mat')
    delete('Example_1p_movie.mat')
end
create_1p_movie(opts_2p,opts_back,'Example_1p_movie');

%%
M = h5read('Example_1p_movie.h5','/mov');
M = M(1:60,1:60,:);
M_proc = spatial_bandpass(M, 7, 5, inf, 0);
view_movie(M_proc)
