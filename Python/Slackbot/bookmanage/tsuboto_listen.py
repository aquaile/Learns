# -*- coding: utf-8 -*-

from slackbot.bot import listen_to

@listen_to(u'あきらめたら')
@listen_to(u'諦めたら')
def anzai(message):
    message.send(u'そこで試合終了ですよ。')

@listen_to(u'いいですか')
def reaction(message):
    message.react(u'+1')