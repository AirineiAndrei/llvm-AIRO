#include <stdio.h>

int main() {

    for(int i=0;i<=10;i++)
    {
        for(int j=0;j<=10;j+=2)
        {
            printf("Hello, World %d %d!\n",i,j);
        }
        
    }

    return 0;
}
