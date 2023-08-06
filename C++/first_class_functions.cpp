
#include <functional>
using std::function;
#include <cassert> // assert
 
int increment(int x) {
    return x + 1;
}

function<int(int)> createDecrement(int x) {
    auto decrement = [x](int y) -> int {
        return y - x;
    };
    return decrement;
}
int applyTwice(function<int(int)> f, int x) {
    return f(f(x));
}

int main() {
    auto decrement = createDecrement(1);
    int x = 5;
    assert( applyTwice(increment,              x) == 7 );
    assert( applyTwice(decrement,              x) == 3 );
    assert( applyTwice([](int a){return 2*a;}, x) == 20 );
    printf("SUCCESS\n");
    return 0;
}



