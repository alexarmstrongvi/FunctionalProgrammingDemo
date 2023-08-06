
#include <assert.h> // assert
#include <stddef.h> // size_t
#include <stdio.h> // printf

int sumArray1(const int arr[], size_t size) {
    int sum = 0;
    for (size_t i = 0; i < size; i++) {
        sum += arr[i];
    }
    return sum;
}

int sumArray2(const int arr[], size_t size) {
    if (size == 0) {
        return 0;
    }
    return arr[0] + sumArray2(arr+1, size-1);
}


int fold(
    const int arr[], 
    size_t size, 
    int init, 
    int (*f)(int,int)
) {
    int acc = init;
    for (size_t i = 0; i < size; i++) {
        acc = f(acc, arr[i]);
    }
    return acc;
}
int plus(int x, int y) {
    return x + y;
}
int sumArray3(const int arr[], size_t size) {
    return fold(arr, size, 0, plus);
}

int main(void) {
    int arr[] = {1,2,3,4};
    assert( sumArray1(arr, 4) == 10 );
    assert( sumArray2(arr, 4) == 10 );
    assert( sumArray3(arr, 4) == 10 );
    printf("SUCCESS\n");
    return 0;
}


