
#include <vector>
using std::vector;
#include <cstdio> // printf
#include <cassert> // assert

int sumArray1(const vector<int>& arr) {
    int sum = 0;
    for (auto x : arr) {
        sum += x;
    }
    return sum;
}

int sumArray2A(const vector<int> arr) {
    if (arr.size() == 0) {
        return 0;
    }
    return arr[0] + sumArray2A(
        vector<int>(arr.cbegin()+1, arr.cend())
    );
}

typedef vector<int>::const_iterator const_iter;
int sumArray2B(const_iter cbegin, const_iter cend) {
    if (cbegin == cend) {
        return 0;
    }
    return *cbegin + sumArray2B(cbegin+1, cend);
}

#include <numeric>
using std::reduce;
#include <functional>
using std::plus;
int sumArray3(const vector<int>& arr) {
    return reduce(arr.cbegin(), arr.cend(), 0, plus<int>());
}

int main() {
    const vector<int> arr = {1,2,3,4};
    assert( sumArray1(arr) == 10 );
    assert( sumArray2A(arr) == 10 );
    assert( sumArray2B(arr.cbegin(), arr.cend()) == 10 );
    assert( sumArray3(arr) == 10 );
    printf("SUCCESS\n");
    return 0;
}
