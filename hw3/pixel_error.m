function [EP] = pixel_error(ImL, ImR, DL)
% pixel error
s = size(DL)
h = s(1);
w = s(2);
EP = zeros(h,w);
for lr = 1:h
    lr
    for lc = 1:w
        dl = int32(round(DL(lr,lc)));
        rr = lr;
        rc = lc - dl;
        if rc > 0 && rc <= w
            left  = min(min(rc - 1, 15), min(lc - 1, 15));
            right = min(min(w - rc, 16), min(w - lc, 16));
            up    = min(min(rr - 1, 15), min(lr - 1, 15));
            down  = min(min(h - rr, 16), min(h - lr, 16));

            Patch = ImL(lr-up:lr+down, lc-left:lc+right) - ImR(rr-up:rr+down, rc-left:rc+right);
            psize = size(Patch);
            EP(lr, lc) = sum(sum(Patch.*Patch))/(psize(1)*psize(2));
        end
    end
end

end
