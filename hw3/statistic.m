function [m tho P] = statistic(H, edge)
P = H/sum(H);
len = length(P);
m = 0;
m2 = 0;
for i = 1:len
    m = m + P(i) * edge(i);
    m2 = m2 + P(i) * edge(i)^2;
end
tho = (m2 - m^2)^0.5;
end
