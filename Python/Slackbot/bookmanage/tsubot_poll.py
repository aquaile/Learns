# -*- coding: utf-8 -*-
from slackbot.bot import respond_to
import csv

import MySQLdb

EMOJIS = (
    'one',
    'two',
    'three',
    'four',
    'five',
)


@respond_to('poll (.*)')
def poll(message, params):
    args = [row for row in csv.reader([params], delimiter=' ')][0]
    if len(args) < 3:
        message.reply('使用方法: poll タイトル 質問 [質問 ...]')
        return
    db = MySQLdb.connect(host="localhost",db="test_db",user="root",passwd="XXXXXXX",charset="utf8")
    cursor =db.cursor()
    user_name_db = ""
    cursor.execute("select * from test_table")
    numrows = int(cursor.rowcount)
    for x in range(numrows):
        row = cursor.fetchone()
        #if (row):
        print row[0], row[1]
        user_name_db = row[1]
    cursor.close()
    db.close()


    title = args.pop(0)
    options = []
    for i, o in enumerate(args):
        options.append('* :{}: {}'.format(EMOJIS[i], o))

    options.append(user_name_db)
    # ref https://github.com/lins05/slackbot/issues/43
    send_user = message.channel._client.users[message.body['user']][u'name']
    post = {
        'pretext': '{}さんからアンケートがあります。'.format(send_user),
        'title': title,
        'author_name': send_user,
        'text': '\n'.join(options),
        'color': 'good'
    }

    ret = message._client.webapi.chat.post_message(
        message._body['channel'],
        '',
        username=message._client.login_data['self']['name'],
        as_user=True,
        attachments=[post]
    )
    ts = ret.body['ts']

    for i, _ in enumerate(options):
        message._client.webapi.reactions.add(
            name=EMOJIS[i],
            channel=message._body['channel'],
            timestamp=ts
        )