//
//  main.c
//  HomeWork10
//
//  Created by Duger on 13-8-26.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, const char * argv[])
{

    //1、输入一个数组长度，动态创建数组，所有元素随机生成，输出元素中的最大值。
//    int b;
//    int *max;
//    printf("请输入数组长度：");
//    scanf("%d",&b);
//    int (*a)[b] = calloc(b, sizeof(int));
//    max = a[0];
//    for (int i = 0; i < b; i++) {
//        *a[i] = arc4random()%100;
//        if (*a[i] > *max ) {
//            max = a[i];
//        }
//    }
//    for (int i = 0; i < b; i++) {
//        printf("%d ",*a[i]);
//    }
//    printf("\n");
//    printf("最大值%d\n",*max);
//    free(*a);
    
    
    //2、有一段文本，将文本中的所有单词，存放到一个字符串数组中。
    char *chr1 = "If there's one lesson to be drawn from the salacious, five-day trial of fallen Chinese princeling-politician Bo Xilai, which concluded on Aug. 26, it's this: the Chinese government gets this whole Internet thing. Displaying a media savvy at odds with the leaden propaganda statements usually released in Communist Party–run publications, court officials in the eastern city of Jinan have provided an eager public with a slew of online transcripts of China's most riveting courtroom drama in decades.";
    
    int count = 0,count1 = 0,count2 = 0,count3 = 0;
    unsigned long len = strlen(chr1);
    char *chr = malloc(sizeof(char)*len);
    printf("%lu\n",len);
    char (*chr2)[50] = malloc(sizeof(char) * (50));
    for (int i = 0; i < len; i++) {
        if (((*(chr1 + i) > 64 && *(chr1 + i) < 91) || (*(chr1 + i) > 96 && *(chr1 + i) < 123))|| (*(chr1 + i) == 39)) {
            memcpy(chr + i, (chr1 + i), 1);
            count++;
            count1++;
        }else
        {
            memcpy(chr + i, " ", 1);
            
            memcpy(chr2 + count3, chr + i - count1 , count1);
            count3++;
            count2++;
            count1 = 0;
        }
    }
    
    printf("%s\n",chr);
    printf("zimu%d\n",count);
    
//    for (int i = 0;  i < len; i++) {
//        count2++;
//        if (*(chr + i) == ' ') {
//            memcpy(chr2 + count3, chr + i+1 - count2 , count2);
//            
//            count3++;
//            count2 = 0;
//            
//        }
//        if (*(chr + i) == \0) {
//            break;
//        }
//    if (count2 > 40) {
//        int s = 50;
//        s += count2;
//        chr2 = realloc(chr2, sizeof(char) * s );
//        count2 = 0;
//    }
    
    
    for (int i = 0; i < len - count; i++) {
        printf("%s\n",chr2[i]);
    }
    
    
    
//    int count = 0,count2 = 0 ,j = 0;
//    unsigned long len = strlen(chr1);
//    char *chr = malloc(sizeof(char)*len);
//    
//    printf("%lu\n",len);
//    for (int i = 0; i < len; i++) {
//        if (((*(chr1 + i) > 64 && *(chr1 + i) < 91) || (*(chr1 + i) > 96 && *(chr1 + i) < 123))) {
//            memcpy(chr + i, (chr1 + i), 1);
//            count++;
//        }else
//        {
//            memcpy(chr + i, " ", 1);
//        }
//    }
//    
//    printf("%s\n",chr);
//    
//    char *ch[3] = { "iphone","cenle","havede"};
//    printf("%s\n",*ch);
    
    
    return 0;
}

