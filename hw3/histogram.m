function [h, edge] = histogram(data, binNum)
mi = min(data);
ma = max(data);
gap = (ma - mi)/binNum;
edge = mi:gap:ma-gap;
h = histc(data,edge);
end
