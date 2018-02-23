#include <stdio.h>
#include <iostream>

using namespace std;

int main(void){
    int L = 10;
    int n = 3;
    int x[3] = {2,6,7};
    bool vec_min[3] = {true,true,true};
    bool vec_max[3] = {true,true,true};
    int min = 0;
    int max = 0;
    cout << L << "\n";
    //min
    for(int i=0;i<n;i++){
        int temp = x[i];
        while(temp>L/2){
            temp = 10 - x[i];
            vec_min[i] = !vec_min[i];
        }
        if(temp > min){
            min = temp;
        }
    }
    cout << min << "\n";
    for(int i=0;i<n;i++){
        cout << vec_min[i] << "\n";
    }
    //max
    for(int i=0;i<n;i++){
        int temp = x[i];
        while(temp<L/2){
            temp = 10 - x[i];
            vec_max[i] = !vec_max[i];
        }
        if(max<temp){
            max = temp;
        }
    }
    cout << max << "\n";
    for(int i=0;i<n;i++){
        cout << vec_max[i] << "\n";
    }
    return 0;
}