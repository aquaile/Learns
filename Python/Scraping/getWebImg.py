# _*_ coding:utf-8 _*_

import urllib2
from bs4 import BeautifulSoup
import re
import sys
import os.path

# url先の画像を保存する関数
def download(url):
	try:
		img = urllib2.urlopen(url)
		localfile = open(os.path.basename(url), 'wb')
		localfile.write(img.read())
		img.close()
		localfile.close()
	except:
		pass


html = urllib2.urlopen("http://devsoku.doorblog.jp/archives/11981385.html")
soup = BeautifulSoup(html)

article_body = soup.find_all("div",attrs={"class":"article_body_more"})

imgs = soup.find_all("img")

for img in imgs:
	img_url = img['src'].split('?')
	print img_url[0]
	download(img_url[0])

