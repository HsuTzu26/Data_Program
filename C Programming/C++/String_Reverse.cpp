#include <iostream>
using namespace std;
using std::string;

void swap(char* str1, char* str2) {
	char tmp = *str1;
	*str1 = *str2;
	*str2 = tmp;
}

void reverse(char* first, char* last) {
	--last;
	while (first < last) {
		swap(first, last);
		++first;
		--last;
	}
}

int main()
{
	char str[50];
	cout << "請輸入字串" << endl;
	cin >> str;
	int length = strlen(str);
	reverse(&str[0], &str[length]);
	cout << str << endl;

	return 0;

}