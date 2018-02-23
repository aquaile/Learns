#include <stdio.h>
#include <iostream>
#include <queue>

using namespace std;
int N = 4;
int L = 25;
int P = 10;
int A[] = {10, 14, 20, 21};
int B[] = {10, 5, 2, 4};
int C[] = {0, 0, 0, 0};
priority_queue<int> tank;

int main(void){
    int count = 0;
    for(int i=0;i<N;i++){
        if(i==0){
            C[i] = A[i];
        }else{
            C[i] = A[i] - A[i-1];
        }
        //cout << C[i] << "\n" ;
    }
    for(int i=0;i<N;i++){
        if(count != -1){
            tank.push(B[i]);
            P = P - C[i];
            while(P <= C[i+1]){
                if(tank.empty()){
                    count = -1;
                    break;
                }else{
                    P = P + tank.top();
                    //cout << P << "\n" ;
                    tank.pop();
                    count++;
                }
            }
        }else{
            break;
        }
    }
    cout << count << "\n" ;
    return 0;
}

