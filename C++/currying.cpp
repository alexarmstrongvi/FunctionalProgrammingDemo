////////////////////////////////////////////////////////////////////////////////
// Copied from https://stackoverflow.com/questions/152005/how-can-currying-be-done-in-c
#include <functional>

namespace _dtl {

    template <typename FUNCTION> struct
    _curry;

    // specialization for functions with a single argument
    template <typename R,typename T> struct
    _curry<std::function<R(T)>> {
        using
        type = std::function<R(T)>;
        
        const type
        result;
        
        _curry(type fun) : result(fun) {}
        
    };

    // recursive specialization for functions with more arguments
    template <typename R,typename T,typename...Ts> struct
    _curry<std::function<R(T,Ts...)>> {
        using
        remaining_type = typename _curry<std::function<R(Ts...)> >::type;
        
        using
        type = std::function<remaining_type(T)>;
        
        const type
        result;
        
        _curry(std::function<R(T,Ts...)> fun)
        : result (
            [=](const T& t) {
                return _curry<std::function<R(Ts...)>>(
                    [=](const Ts&...ts){ 
                        return fun(t, ts...); 
                    }
                ).result;
            }
        ) {}
    };
}

template <typename R,typename...Ts> auto
curry(const std::function<R(Ts...)> fun)
-> typename _dtl::_curry<std::function<R(Ts...)>>::type
{
    return _dtl::_curry<std::function<R(Ts...)>>(fun).result;
}

template <typename R,typename...Ts> auto
curry(R(* const fun)(Ts...))
-> typename _dtl::_curry<std::function<R(Ts...)>>::type
{
    return _dtl::_curry<std::function<R(Ts...)>>(fun).result;
}

////////////////////////////////////////////////////////////////////////////////
int add(int x, int y, int z) {
    return x + y + z;
}

auto curried_add(int x) {
    auto add_x = [x](int y) {
        auto add_x_and_y = [x,y](int z) {
            return x + y + z;
        };
        return add_x_and_y;
    };
    return add_x;
}

int main() {
    assert (add(1,2,3) == 6);
    assert (curried_add(1)(2)(3) == 6);
    auto add_1 = curried_add(1);
    auto add_1_and_2 = add_1(2);
    assert (add_1_and_2(3) == 6);
    assert (curry(add)(1)(2)(3) == 6);
    printf("SUCCESS\n");
    return 0;
}
