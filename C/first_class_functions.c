
#include <assert.h> // assert
#include <stdio.h> // printf
 
int increment(int x) {
    return x + 1;
}

int decrement1(int y) {return y-1;}
int decrement2(int y) {return y-2;}
int decrementTo0(int y) {return y-y;}

int (* createDecrement(int x))(int) {
    switch(x) {
        case 1:
            return decrement1;
        case 2:
            return decrement2;
        default:
            return decrementTo0;
        }
}

int applyTwice(int (*f)(int), int x) {
    return (*f)( (*f)(x) );
}

int main(void) {
    int (*decrement)(int) = createDecrement(1);
    int x = 5;
    assert( applyTwice(increment, x) == 7 );
    assert( applyTwice(decrement, x) == 3 );
    // Anonymous functions not possible
    printf("SUCCESS\n");
}


