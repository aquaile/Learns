#include <stdio.h>
#include <string.h>
#include <iostream>
#include <random>
#include <algorithm>

using namespace std;

random_device rnd;     // 非決定的な乱数生成器を生成
mt19937 mt(rnd());     //  メルセンヌ・ツイスタの32ビット版、引数は初期シード値
uniform_int_distribution<> rand100(0, 99);        // [0, 99] 範囲の一様乱数
int main(void) {
    int n = 10;
    int line[n]; 
    bool triangle_flag = false;
    random_device rnd;
    
    for(int i=0;i<n;i++){
        line[i] = rand100(mt);
    }
    

    sort(line, line+n);

    for(int i=0;i<n;i++){
        cout << line[i] << "\n";
    }
    
    int cnt = n-1;
    int length = 0;
    while(!triangle_flag){
        if(cnt-2 < 0){
            break;
        }
        if(line[cnt] < (line[cnt-1] + line[cnt-2])){
            triangle_flag = true;
            length = line[cnt] + line[cnt-1] + line[cnt-2];
        }
    }
    cout << triangle_flag << "\n";
    cout << length << "\n";
    return 0
}
/*
int[] sort(int[] nums){

}
*/