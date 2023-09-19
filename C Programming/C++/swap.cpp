
// ex1. 一般副函數以 swap 交換兩個數字 (無法交換)

#include <iostream>
using namespace std;
void swap(int x, int y) {
    int tmp;
    tmp = x;
    x = y;
    y = tmp;
}

// ex2. 一般副函數以 swap(兩個數字的指標變數交換)
#include <iostream>
using namespace std;
void swap_pointer(int* px, int* py) {
    int tmp;
    tmp = *px;
    *px = *py;
    *py = tmp;
}

// ex3. 一般副函數以 swap(兩個數字的取址&交換)
#include <iostream>
using namespace std;
void swap_ref(int& px, int& py) {
    int tmp;
    tmp = px;
    px = py;
    py = tmp;
}

int main()
{
    cout << "Common(Cannot exchange)" << "\n";

    int a = 5;
    int b = 10;
    cout << "變數 a 的值為" << a << "\n";
    cout << "變數 b 的值為" << b << "\n";
    cout << "變數 a 與 b 兩值進行交換" << "\n";
    swap(a, b);
    cout << "變數 a 的值為" << a << "\n";
    cout << "變數 b 的值為" << b << "\n";

    cout << "Pointer" << "\n";

    int aa = 5;
    int bb = 10;
    cout << "變數 a 的值為" << aa << "\n";
    cout << "變數 b 的值為" << bb << "\n";
    cout << "變數 a 與 b 兩值進行交換" << "\n";
    swap_pointer(&aa, &bb);
    cout << "變數 a 的值為" << aa << "\n";
    cout << "變數 b 的值為" << bb << "\n";

    cout << "Reference" << "\n";

    int a3 = 5;
    int b3 = 10;
    cout << "變數 a 的值為" << a3 << "\n";
    cout << "變數 b 的值為" << b3 << "\n";
    cout << "變數 a 與 b 兩值進行交換" << "\n";
    swap_ref(a3, b3);
    cout << "變數 a 的值為" << a3 << "\n";
    cout << "變數 b 的值為" << b3 << "\n";

    return 0;
}
