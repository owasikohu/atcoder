#include <bits/stdc++.h>
using namespace std;

int main() {
    int T;
    cin >> T;
    while(T--) {
        int N, D;
        cin >> N >> D;
        vector<int> A(N);
        vector<int> B(N);
        for(int i = 0; i < N; i++) {
            cin >> A[i];
        }
        for(int i = 0; i < N; i++) {
            cin >> B[i];
        }

        int sum = 0;
        for(int i = 0; i < N; i++) {
            sum += A[i];
            sum -= B[i];
        }
    }
}