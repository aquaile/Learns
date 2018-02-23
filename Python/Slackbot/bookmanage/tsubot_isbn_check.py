# -*- coding: utf-8 -*-

from slackbot.bot import respond_to
import csv
import urllib
from bs4 import BeautifulSoup
import MySQLdb

@respond_to('info (.*)')
def buy(message, params):
    args = [row for row in csv.reader([params], delimiter=' ')][0]
    url = ""
    if len(args) < 1:
        message.reply('使用方法: info link')
        return
    
    #urlの解析と本情報の取得
    url = args[0] 
    info = take_book_info(url)
    title = 'この本の詳細'
    options = []
    options.append("ISBN :" + info[0])

    purchase_existance = check_book_db(info[0])

    if info[0] == "0000000000000":
        options.append(u"ISBNを取得できませんでした。")
    elif purchase_existance == 1:
        options.append(u"この本はすでに購入済みです。")
    else:
        options.append(u"この本はまだ購入されていません。")

    send_user = message.channel._client.users[message.body['user']][u'name']
    post = {
        'pretext': '{}さんが先ほど挙げていた本の詳細'.format(send_user),
        'title': title,
        'author_name': send_user,
        'text': '\n'.join(options),
        'image_url':info[1],
        'color': 'good'
    }

    ret = message._client.webapi.chat.post_message(
        message._body['channel'],
        '',
        username=message._client.login_data['self']['name'],
        as_user=True,
        attachments=[post]
    )


def take_book_info( url ):
    html = urllib.urlopen(url)
    bsObj = BeautifulSoup(html, "html.parser")
    isbn = ""
    imgURL = ""
    book_info = bsObj.find_all(id="detail_bullets_id")
    book_img = bsObj.find_all(id="img-canvas")
    for info in book_info:
        for data in info.find_all('li')[4]:
            isbn = data
    for img in book_img:
        for url in img.find_all('img'):
            imgURL = url['src']
 
    isbn = isbn.replace('-',' ')
    list_isbn = isbn.split(" ")
    print list_isbn
    if len(list_isbn) == 3:
        isbn = list_isbn[1] + list_isbn[2]
    else :
        isbn = "0000000000000"

    list_info = []
    list_info.append(isbn)
    list_info.append(imgURL)
    return list_info

def check_book_db(isbn):
    #db = MySQLdb.connect(host="localhost",db="XXXXXXX",user="XXXXXXX",passwd="XXXXXXX",charset="utf8")
    db = MySQLdb.connect(host="localhost", db="test_db", user="root", passwd="XXXXXXX", charset="utf8")
    cursor = db.cursor()

    order = "select * from isbn where isbn = " + isbn
    cursor.execute(order)
    numrows = int(cursor.rowcount)
    
    cursor.close()
    db.close()

    return numrows

