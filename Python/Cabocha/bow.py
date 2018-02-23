# _*_ coding: utf-8 _*_

import sqlite3
import numpy as np
import MeCab as mc
from sklearn.feature_extraction.text import CountVectorizer

t = mc.Tagger('-Ochasen -d /usr/local/lib/mecab/dic/mecab-ipadic-neologd/')
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
c.execute(u"SELECT DISTINCT screen_name FROM %s" %table)
cnt = 0
#print acount
count = CountVectorizer()
docs = np.array([])
c.execute(u"select*from %s" %table)
for row in c:
	#print u"tweet_id: %d" %row[0]
	#print u"screen_id: %s" %row[1]
	#print u"user_name: %s" %row[2]
	#print u"user_description: %s" %row[3]
	#print u"text: %s" %row[4]
	#print u"created_at: %s" %row[5]
	text = row[4].encode("utf-8")
	node = t.parseToNode(text)

	# 形態素解析しまーす
	while(node):
		if node.surface != "":
			word_type = node.feature.split(",")
			if word_type[0] == '名詞' or word_type[0] == '形容詞' or word_type[0] == '動詞':
				print node.surface +"\t"+ node.feature
		node = node.next
		if node is None:
			break

	if cnt< 1:
		docs = np.append(docs, np.array(row[4]))

	cnt+=1
bag = count.fit_transform(docs)
print(count.vocabulary_)
print(bag.toarray())
print(count.get_feature_names())
print cnt
# c.execute(u"select*from %s where tweet_id=%s" %(table, tweet_id))
# print c
# for row in c:
# 	print row[0],row[1],row[2]

c.execute(u"SELECT DISTINCT screen_name FROM %s" %table)
cnt = 0
print cnt