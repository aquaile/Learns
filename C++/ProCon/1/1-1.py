# -*- codeing: utf-8 -*- 

import re

def checkUniqueString(str):
    cnt_result = []
    for c in range(len(str)):
        pattern = str[c]
        cnt = 0
        for x in range(len(str)):
            if pattern == str[x]:
                cnt += 1
        cnt_result.append(cnt)
    r = 0
    for c in range(len(str)):
        if cnt_result[c] > 1:
            r += 1
    if r == 0:
        print "True"
    else:
        print "False"
    
            
def main():
    str = "abcdef"
    checkUniqueString(str)

if __name__ == '__main__':
    main()

