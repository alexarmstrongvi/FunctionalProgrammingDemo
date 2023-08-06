
#include <functional>
using std::function;
using std::bind;
using std::placeholders::_1;
#include <cstdio> // printf
#include <cassert> // assert
#include <cmath> // M_PI, pow, sqrt, exp, round, abs

float roundTo(float x, int n) {
    return round(x * pow(10,n)) / pow(10,n);
}
bool isClose(float x, float y, float epsilon = 1e-9) {
    return abs(x - y) < epsilon;
}

float normalProb(float mu, float sig, float x) {
    float n = 1 / (sig * sqrt(2*M_PI));
    float z = (x-mu)/sig;
    return n * exp(-(pow(z,2)/2));
}

function<float(float)> zProb = bind(normalProb, 0, 1, _1);

int main() {
    assert (isClose(zProb(1), zProb(-1)));
    assert (isClose(roundTo(zProb(2), 2), 0.05));
    printf("SUCCESS\n");
    return 0;
}



