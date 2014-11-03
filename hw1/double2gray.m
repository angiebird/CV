function imgGray = double2gray(imgDouble)
    imgMax = max(max(imgDouble));
    imgMin = min(min(imgDouble));
    imgGray = (imgDouble-imgMin)/(imgMax-imgMin)*255;
    imgGray = uint8(imgGray);
end
