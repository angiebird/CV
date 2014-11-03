function [O] = occlusion(DL, DR)
s = size(DL);
h = s(1);
w = s(2);
O = zeros(h,w);
for r = 1:h
    for c = 1:w
        dl = DL(r,c);
        if(c - int32(round(dl)) > 0)
            dr = DR(r,c - int32(round(dl)));
            if(abs(dl - dr) > 0.3)
                O(r,c) = 0;
            else
                O(r,c) = 1;
            end
        else
            O(r,c) = 0;
        end
    end
end
end
