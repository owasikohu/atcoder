#include <bits/stdc++.h>
using namespace std;

int main() {
    string S;
    cin >> S;
    string a = "abcdefghijklmnopqrstuvwxyz";
    string A = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    for(int i = 0; i < A.length(); i++) {
        if(A[i] == S[0]) {
            S[0] = a[i];
        }
    }
    cout << "Of" << S << endl;
}