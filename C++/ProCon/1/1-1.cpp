#include <stdio.h>
#include <string.h>
#include <iostream>

using namespace std;
int main(void) {
    const char *data = "hoge123123";
    string str(data); 
    int cnt[str.size()];
    for(int i=0;i<str.size();i++){
        cnt[i] = 0;
    }
    for(int i=0;i<str.size();i++){
        //cout << str[i] << "\n";
        //cout << (int)str.find(str[i]) << "\n";
        for(int j=0;j<str.size();j++){
            if(str[i] == str[j]){
            cnt[i]++;
            }
        }
        cout << cnt[i] << "\n";
    }
    int result = 0;
    for(int i=0;i<str.size();i++){
        if(cnt[i] > 1){
            result++;
        }
    }
    if(result != 0){
        cout << "fasle" << "\n";
    }else{
        cout << "true" << "\n";
    }
    return 0;
    //256の配列を用意してfalseにアクセスしたらかぶりがあると判定する
}