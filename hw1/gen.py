imgPath = './'

web_start = open('../web_start').read();
print web_start
print '<h3> Computer Vision HW1 </h3>'

print '<table class="image">'
print '<tr><td>'
print '<img src=' + imgPath + 'imgBlur.jpg width=300>'
print '<img src=' + imgPath + 'gaussian.jpg width=100>'
print '</td></tr>'
print '<tr><td class="caption"> Gaussian Blur with tho = 6 </td></tr>'
print '</table>'
print '<hr>'


tho = ['1', '3', '6']
theta = ['0', 'pi/6', 'pi/4', 'pi/3', 'pi/2', '2pi/3', '3pi/4', '5pi/6']
for i in range(1,4):
    for j in range(1,9):
        print '<table class="image">'
        print '<tr><td>'
        caption = 'left: Re right: Im tho = '+tho[i-1]+' theta = '+theta[j-1]
        for k in range(2):
            filename = 'img_'+str(k)+'_'+str(i)+'_'+str(j)+'.jpg'
            print '<img src="' + imgPath + filename+'" width=300>'
        for k in range(2):
            filename = 'flt_'+str(k)+'_'+str(i)+'_'+str(j)+'.jpg'
            print '<img src="' + imgPath + filename+'" width=100>'
        print '</td></tr>'
        print '<tr><td class="caption">' + caption + '</td></tr>'
        print '</table>'
        print '<hr>'

web_end = open('../web_end').read();

print '<h3> Code </h3>'

print '<pre>'
code = open(imgPath + 'hw1.m').read();
print code;
print '<hr>'
code = open(imgPath + 'double2gray.m').read();
print code
print '<hr>'
print '</pre>'

print web_end
