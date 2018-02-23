# _*_ coding: utf-8 _*_

import sqlite3
import re
import numpy as np
import matplotlib.pyplot as plt

db = "tweet.db"
con = sqlite3.connect(db)
table = "shadow_tweets"

# sql = u"""
# create table test(
#  name varchar(10),
#  age integer,
#  sex varchar(10)
# );
# """

# con.execute(sql)

#sql = u"insert into yugioh_tweets values('fukuchi',20,'male')"

#con.execute(sql)
c = con.cursor()
acount = {}
c.execute(u"SELECT DISTINCT screen_name FROM %s" %table)
cnt = 0
for row in c:
	#print u"text: %s" %row[1]
	name = row[0]
	acount[name] = 0
print cnt

#print acount

c.execute(u"select*from %s" %table)
cnt = 0
count = np.zeros(7)
leaders = [u'エルフ',u'ネクロ',u'ドラゴン',u'ウィッチ',u'ビショップ',u'ヴァン',u'ロイヤル']
for row in c:
	#print u"tweet_id: %d" %row[0]
	#print u"screen_id: %s" %row[1]
	#print u"user_name: %s" %row[2]
	#print u"user_description: %s" %row[3]
	#print u"text: %s" %row[4]
	#print u"created_at: %s" %row[5]

	# 環境はどうよ
	for x in xrange(0,len(leaders)):
		temp = re.search(leaders[x],row[4])
		if temp != None:
			count[x]+=1
			pass
		pass

	acount[row[1]] += 1
	# for x in xrange(0,len(row)):
	# 	if acount['%s' %row[1]] == None:
	# 		acount['%s' %row[1]] = 1
	# 	else:
	# 		acount['%s' %row[1]] += 1
	cnt+=1
for x in xrange(0,len(leaders)):
	print leaders[x]
	print count[x]
	pass
print cnt
# c.execute(u"select*from %s where tweet_id=%s" %(table, tweet_id))
# print c
# for row in c:
# 	print row[0],row[1],row[2]

c.execute(u"SELECT DISTINCT screen_name FROM %s" %table)
cnt = 0
for row in c:
	#print u"text: %s" %row[1]
	if acount[row[0]] > 100:
		print row[0]
		print acount['%s' %row[0]]
print cnt