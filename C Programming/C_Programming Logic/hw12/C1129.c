#include <stdio.h> /* printf, scanf, puts, NULL */
#include <stdlib.h> /* srand, rand */
#include <time.h>

int main()
{
    int num[3], i, j, temp;
    char c = 'r';
    srand(time(NULL));
    while(c == 'r' || c == 'R')
    {
        for(i = 0; i < 3; i++)
        {
            num[i] = rand() % 6 + 1;
        }
        printf("��l�I�Ƭ��G%d %d %d\n", num[0], num[1], num[2]);
        printf("=======================\n");
        
        for (i = 0; i < 3; i++)
        {
            for(j = 0; j < 2; j++)
            {
                if(num[j] > num[j + 1])
                {
                    temp = num[j + 1];
                    num[j + 1] = num[j];
                    num[j] = temp;
                }
            }
        }
        printf("���G���G");
        if(num[0] == 1 && num[1] == 2 && num[2] == 3)
        {
            printf("%d-%d-%d", num[0], num[1], num[2]);
        }
        else if(num[0] == 4 && num[1] == 5 && num[2] == 6)
        {
            printf("%d-%d-%d", num[0], num[1], num[2]);
        }
        else if(num[0] == num[1] && num[0] == num[2])
        {
            printf("�\\�l(%d-%d-%d)", num[0], num[1], num[2]);
        }
        else if(num[0] == num[1] && num[1] != num[2])
        {
            printf("%d�I", num[2]);
        }
        else if(num[2] == num[1] && num[1] != num[0])
        {
            printf("%d�I", num[0]);
        }
        else
        {
            printf("����");
        }
        printf(" ����r���Ρ�R���i���Y�A����q���Ρ�Q������");
        printf("\n");
        c = getch();
    }
}

