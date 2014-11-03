function [ES] = feature_error(ImL, ImR, DL)
s = size(DL)
h = s(1);
w = s(2);

% feature error
ImFL = wavelet(ImL);
ImFR = wavelet(ImR);
ES = zeros(h,w);
for lr = 1:h
    lr
    for lc = 1:w
        dl = int32(round(DL(lr,lc)));
        rr = lr;
        rc = lc - dl;
        if rc > 0 && rc <= w
            diff = ImFL(lr, lc, :) - ImFR(rr, rc, :);
            ES(lr, lc) = sum(diff.^2)/length(diff);
        end
    end
end
end
