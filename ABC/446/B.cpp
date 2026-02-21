#include <bits/stdc++.h>
using namespace std;

int main() {
    int N, M;
    cin >> N >> M;
    vector<vector<int>> LX(N, vector<int>(0));
    for(int i = 0; i < N; i++) {
        int m;
        cin >> m;
        for(int j = 0; j < m; j++) {
            int a;
            cin >> a;
            LX[i].push_back(a);
        }
    }

    vector<bool> is_choosed(M);
    for(int i = 0; i < N; i++) {
        for(int j = 0; j < LX[i].size(); j++) {
            if(!is_choosed[LX[i][j]]) {
                is_choosed[LX[i][j]] = true;
                cout << LX[i][j] << endl;
                break;
            }
            if(is_choosed[LX[i][j]] && j == LX[i].size()-1) {
                cout << "0" << endl;
            }
        }
    }
}