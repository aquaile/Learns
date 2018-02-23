# -*- coding: utf-8 -*-

from slackbot.bot import respond_to

@respond_to(u'疲れた')
@respond_to(u'つかれた')
@respond_to(u'ツカレタ')
def cheer(message):
    message.reply(u'ファイト!')