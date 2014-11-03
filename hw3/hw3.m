[ DL s ] = parsePfm('Piano-perfect/disp0.pfm');
[ DR s ] = parsePfm('Piano-perfect/disp1.pfm');

ImL = im2double(rgb2gray(imread('Piano-perfect/im0.png')));
ImR = im2double(rgb2gray(imread('Piano-perfect/im1.png')));

%len = 100;
%DL = DL(1:len, 1:len);
%ImL = ImL(1:len, 1:len);
%ImR = ImR(1:len, 1:len);

% occlusion
s = size(DL)
h = s(1);
w = s(2);
O = occlusion(DL, DR);

% pixel error
EP = pixel_error(ImL, ImR, DL);

% feature error
ES = feature_error(ImL, ImR, DL);

O_vec = reshape(O, 1, h*w);

EP_vec = reshape(EP, 1, h*w);
EP_vec_noO = EP_vec(O_vec == 1);
%hist(EP_vec, 20);

ES_vec = reshape(ES, 1, h*w);
ES_vec_noO = ES_vec(O_vec == 1);
%hist(ES_vec, 20);

EP_vec_sort = sort(EP_vec);
ES_vec_sort = sort(ES_vec);

len = floor(length(EP_vec_sort) * 0.9);
EP_vec_sort = EP_vec_sort(1:len);
ES_vec_sort = ES_vec_sort(1:len);

[EP_h edge] = histogram(EP_vec_sort, 20);
[ES_h edge] = histogram(ES_vec_sort, 20);
%bar(edge, EP_h, 'BarWidth', 1);
%bar(edge, ES_h, 'BarWidth', 1);

[EP_m EP_tho] = statistic(EP_h, edge)
[ES_m ES_tho] = statistic(ES_h, edge)

% error with disparity change
DLR = DL + round(rand(h,w))*4 - 2;

EPR = pixel_error(ImL, ImR, DLR);
ESR = feature_error(ImL, ImR, DLR);

EPR_vec = reshape(EPR, 1, h*w);
ESR_vec = reshape(ESR, 1, h*w);

EPR_vec_sort = sort(EPR_vec);
ESR_vec_sort = sort(ESR_vec);

len = floor(length(EPR_vec_sort) * 0.9);
EPR_vec_sort = EPR_vec_sort(1:len);
ESR_vec_sort = ESR_vec_sort(1:len);

[EPR_h edge] = histogram(EPR_vec_sort, 20);
[ESR_h edge] = histogram(ESR_vec_sort, 20);

[EPR_m EPR_tho] = statistic(EPR_h, edge)
[ESR_m ESR_tho] = statistic(ESR_h, edge)
