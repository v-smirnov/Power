//
//  main.m
//  Power
//
//  Created by Vladimir Smirnov on 10.07.14.
//  Copyright (c) 2014 Vladimir Smirnov. All rights reserved.
//

#import <Foundation/Foundation.h>



/*
 проверяет, является ли число степенью
 двойки, в power сохраняется значение степени
*/

bool numberIsPowerOf2(int n, int *power)
{
    if ((n % 2 == 1) || (n == 0)){
        return false;
    }
    
    double pow = log2(n);
    *power = (int)pow;
    double frac = pow - *power;

    return (frac == 0);
    
}
/*
возвращает квадрат для числа, являющегося 
степенью двойки
*/
int sqrForNumberThatIsPowerOf2(int n, int power)
{
    for (int i = 0; i < power; i++){

        //n <<= 1;
        n += n;
    }
    return n;
}


/*
 формально, вспомогательные переменные кроме счетчиков 
 цикла в данном варианте функции не используются,но, 
 все-равно, такой вариант решения не выглядит особо элегантным
 */
int sqr_v1(int n)
{
    for (int i = n; i > 1; i = 0) {
        for (int j = i; j > 1; j--) {
            n += i;
        }
        
    }
    return n;
}
/*
 в данной функции используется утверждение,
 что сумма всех нечетных чисел от 1 до n
 даст квадрат числа n
 */

int sqr_v2(int n)
{
    //небольшая оптимизация для случая, когда
    //переданное число - степень двойки
    int power = 0;
    if (numberIsPowerOf2(n, &power)){
        return sqrForNumberThatIsPowerOf2(n, power);
    }
    
    //без вспомогательных переменных тут не обойтись
    int result = 0;
    int increment = 1;

    for (int i = 0; i < n; i++) {
        result = result + increment;
        increment += 2;
    }
    return result;
}

/*
 в данной функции используется утверждение,
 что квадрат числа n - есть ни что иное, как
 n, увеличенное на n, n-раз
 */

int sqr_v3(int n)
{
    //небольшая оптимизация для случая, когда
    //переданное число - степень двойки
    int power = 0;
    if (numberIsPowerOf2(n, &power)){
        return sqrForNumberThatIsPowerOf2(n, power);
    }

    //и тут нужна вспомогательная переменная
    int result = 0;
    for (int i = 0; i < n; i++) {
        result += n;
    }
    return result;
}



int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        int input_number = 1;
        while (input_number > 0) {
            if (!scanf("%d", &input_number)){
                input_number = 0;
            }
            input_number = input_number < 0 ? input_number *= -1: input_number;
            printf("v1 - %d, v2 - %d, v3 - %d", sqr_v1(input_number), sqr_v2(input_number),
                   sqr_v3(input_number));
        }
    }
    return 0;
}

