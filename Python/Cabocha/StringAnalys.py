# _*_ coding: utf-8 _*_

import CaboCha
import codecs
from graphviz import Digraph
import sys

args = sys.argv

'''
    cabochaを利用する為の最低限の準備をする関数群
'''
# 文章データ（utf-8に限る）をロード data(ファイルパス、データ格納先)
def loadFile(filePath):
    data = []
    # sig指定すると謎のfeff文字化けしなくなる
    with codecs.open(filePath, 'r','utf-8-sig') as lines:
        for line in lines:
            _line = line.rstrip("\r\n")
            data.append(_line)
        lines.close
    return data

'''
    cabochaを利用したルールベースの分析をする関数群
'''

'''
    cabochaを利用した統計ベースの分析をする関数群
'''

'''
    とりあえず色々可視化してみる関数群
'''

# 名詞、形容詞、動詞の抽出
def get_word(tree, chunk):
    surface = ''
    for i in range(chunk.token_pos, chunk.token_pos + chunk.token_size):
        token = tree.token(i)
        features = token.feature.split(',')
        if features[0] == '名詞':
            surface += token.surface
        elif features[0] == '形容詞':
            surface += features[6]
            break
        elif features[0] == '動詞':
            surface += features[6]
            break
    return surface

# 単語同士の依存関係の抽出
def get_2_words(line):
    cp = CaboCha.Parser('-f1')
    tree = cp.parse(line)
    chunk_dic = {}
    chunk_id = 0
    for i in range(0, tree.size()):
        token = tree.token(i)
        if token.chunk:
            chunk_dic[chunk_id] = token.chunk
            chunk_id += 1

    tuples = []
    for chunk_id, chunk in chunk_dic.items():
        if chunk.link > 0:
            from_surface =  get_word(tree, chunk)
            to_chunk = chunk_dic[chunk.link]
            to_surface = get_word(tree, to_chunk)
            tuples.append((from_surface, to_surface))
    return tuples

# 段落単位で係り受けの関係を分析する
def paragraph_token_relation(data, name, _type):
    for i, paragraph in enumerate(data):
        print( '****************** ' + str(i+1) + '段落目' + ' ******************' )
        tuples = get_2_words(paragraph)
        visualize_relation(tuples, i, name, _type)

# 文章単位で係り受けの関係を分析する
def sentence_token_relation(data):
    for i, paragraph in enumerate(data):
        sentences = paragraph.split('．')
        for j, sentence in enumerate(sentences):
            print( '****************** ' + str(i+1) + '-' + str(j+1) + '行目' + ' ******************' )
            tuples = get_2_words(sentence)
            visualize_relation(tuples)

# 係り受け関係の可視化
def  visualize_relation(tuples, num, name, type):
    G = Digraph(format="png")
    G.attr("node", shape="square", style="filled")
    for t in tuples:
        G.edge(t[0],t[1])
    if type == 0:
        G.render('data/' + name + '/visualize_sentence/graphs_' + str(num))
    elif type == 1:
        G.render('data/' + name + '/visualize_paragraph/graphs_' + str(num))


if __name__ == '__main__' :
    name = args[1]
    analysType = 1
    if analysType == 0:
        filePath = 'data/' + name + '/' + name + '_lines.txt'
    else:
        filePath = 'data/' + name + '/' + name + '_paragraph.txt'
    data = loadFile(filePath) # データの読み込み
    paragraph_token_relation(data, name, analysType)