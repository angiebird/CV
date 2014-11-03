web_start = open('../web_start').read();
print web_start
print '<h3> Computer Vision HW2</h3>'

imgPath = './'

print '<table class="image">'
print '<tr><td>'
print '<img src=' + imgPath + 'l0.jpg >'
print '</td></tr>'
print '<tr><td class="caption"> Gaussian Blur with tho = 6 </td></tr>'
print '</table>'
print '<hr>'


tho = ['1', '3', '6']
theta = ['0', 'pi/6', 'pi/3', 'pi/2', '2pi/3', '5pi/6']
print '<table class="image">'
print '<tr>'
print '<td></td>'
for i in range(len(tho)):
    print '<td> tho = ' + tho[i] + '</td>'
print '</tr>'
for j in range(1,len(theta)+1):
    print '<tr>'
    print '<td>'
    print ' theta = ' + theta[j-1]
    print '</td>'
    for i in range(1,len(tho)+1):
        print '<td>'
        filename = 'l1_'+str(i)+'_'+str(j)+'.jpg'
        print '<img src="' + imgPath + filename+'">'
        print '</td>'
    print '</tr>'
print '</table>'


print '<h3> Code </h3>'
print '<pre>'
print open('hw2.m').read()
print '<hr>'
print open('Gaussian.m').read()
print '<hr>'
print open('Morlet.m').read()
print '<hr>'
print open('double2gray.m').read()
print '</pre>'

web_end = open('../web_end').read();
print web_end
