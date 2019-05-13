import sys
reload(sys)
sys.setdefaultencoding('utf-8')

import re
import jieba
import jieba.posseg as psg
import matplotlib.pyplot as plt
from os import path
import urllib2
from bs4 import BeautifulSoup
from scipy.misc import imread
from wordcloud import WordCloud, ImageColorGenerator

def pick(str,file):
    words = psg.cut(str)
    for word,flag in words:
        if(flag.startswith('d')):
            continue
        if(flag.startswith('uj')):
            continue
        if(flag.startswith('x')):
            continue
        if(flag.startswith('u')):
            continue
        if(flag.startswith('c')):
            continue
        if(flag.startswith('r')):
            continue
        file.write(word + '\n')
def txtspider(url,file):
    headers = {'User-Agent':'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36'}
    page = urllib2.Request(url, headers = headers)
    page_info = urllib2.urlopen(page).read().decode('utf-8')
    soup = BeautifulSoup(page_info,'html.parser')
    titles1 = soup.find_all('li')
    titles2 = soup.find_all('strong')
    for each in titles1:
        txtlist = each.find_all('a')
        for eachs in txtlist:
            if eachs.string:
                pick(eachs.string,file)
    for each in titles2:
        if each.string:
            pick(each.string,file)
file = open(r'F:\pku_2018_summer school\the_great_work\assignment_groupwork_python_2_meiyouzazheng\sohu_news.txt','w')#should be changed
url = 'http://news.sohu.com/'
txtspider(url,file)
if file:file.close()

#separate Chinese vocabulary with jieba
d = path.dirname(__file__)
text = open(path.join(d, u'sohu_news.txt')).read()
cut_text = jieba.cut(text)
result = ' '.join(cut_text)

#set the form of wordcloud
re_color = imread(path.join(d, "logo.jpg"))
wc = WordCloud(
font_path=r'.\qkbysongti.ttf',
background_color="white",
mask=re_color,
max_font_size=30,
min_font_size=1,
width=800,
height=400,
)
wc.generate(result)
image_colors = ImageColorGenerator(re_color)

#show image without recolor
plt.imshow(wc)
plt.axis("off")
plt.figure()

#show and save final image
plt.imshow(wc.recolor(color_func=image_colors))
plt.axis("off")
plt.show()
wc.to_file(path.join(d, u"sohu_news_logo.png"))


