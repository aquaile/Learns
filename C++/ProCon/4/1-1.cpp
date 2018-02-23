#include <stdio.h>
#include <iostream>

using namespace std;
int min_coins(int value);

int c1 = 1;
int c5 = 5;
int c10 = 10;
int c50 = 50;
int c100 = 100;
int c500 = 500;
int value = 620;
int coins[] = {2,0,3,1,2,3}; 


int main(void){
    int result = min_coins(value);
    cout << result << "\n" ;
    return 0;
}

int min_coins(int _value){ 
    int count = 0;
    while(_value > 0){
        if( _value >= c500 && coins[0] > 0){
            _value = _value - c500;
            count++;
            coins[0]--;
        }else if(_value < 500 && _value >= 100 && coins[1] > 0){
             _value = _value - c100;
             count++;
             coins[1]--;
        }else if(_value < 100 && _value >= 50 && coins[2] > 0){
             _value = _value - c50;
            count++;
            coins[2]--;
        }else if(_value < 50 && _value >= 10 && coins[3] > 0){
             _value = _value - c10;
             count++;
             coins[3]--;
        }else if(_value < 10 && _value >= 5 && coins[4] > 0){
             _value = _value - c5;
             count++;
             coins[4]--;
        }else{
             count+=_value;
             _value = 0;
        }
    }

    return count;
}