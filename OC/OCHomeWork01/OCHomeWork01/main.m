//
//  main.m
//  OCHomeWork01
//
//  Created by Duger on 13-9-6.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyClass.h"
#import "Person.h"
#import "Teacher.h"
#import "Student.h"
#import "Zoo.h"
#import "Animal.h"
#import "People.h"
#import "Kingdom.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
    /*
     
     熟练查阅API以及类的头文件
     新建一个工程OurClass。
     包含一个MyClass类、一个Teacher类，一个Student类，一个Person类。
     其中Person是Teacher和Student的父类。
     MyClass类包含一个Teacher以及一个NSMutableArray，NSMutableArray用于存放Student对象
     自行完善工程（尽量用全所学知识）
     */
 /*       Teacher *teacher1 = [Teacher teacherWithName:@"耿明" sex:@"boy" age:34 identety:@"353534345" workSchool:@"lanou"];
        Student *student1 = [Student studentWithName:@"王超" sex:@"ladyboy" age:34 identety:@"389372398" studyclass:@"二班"];
        Student *student2 = [Student studentWithName:@"周超" sex:@"b" age:23 identety:@"3948839" studyclass:@"二班"];
        NSMutableArray *studentArry = [[NSMutableArray alloc]initWithCapacity:0];
        studentArry[0] = student1;
        
        MyClass *class1 = [MyClass myClassWithClassName:@"1班" teacher:nil students:studentArry];
        MyClass *class2 = [[MyClass alloc]initWithClassName:@"2班" teacher:teacher1 students:studentArry];
        [studentArry release];
        
        NSLog(@"class2 %@",[class2.students[0] name]);
        NSLog(@"class2 teacher %@",class2.teacher.name);

        
        [class1 addTeacher:teacher1];
        [class1 addStudents:student2];
        [class1 removeStudentsWithName:@"王超"];
        
        
        NSLog(@"student2 %@",[class1.students[0] name]);
  */
        
//        Student *arr = (Student *)[[NSMutableArray alloc]initWithCapacity:0];
        
             
//        (Student *)[class1.students arrayByAddingObject:person1];
        
    /************************************************************************************
     
     一、模拟一个动物园系统MyZoo
     
     1、动物园里面有三种动物：Panda，Elephant，Kangaroo
     
     2、三种动物都有一定的数量(不止一只)
     
     3、动物有各自不同的食量(以天为单位的食量)，并且每天都在消耗食物。
     
     4、动物园里的食物有固定的储备，而且假设三种动物都吃这一种食物。
     
     5、每个动物都有不同的生产周期，每当到了这种动物的生产周期，动物园就会出现一位新生宝宝(假设其食量和成年动物是一样的)。
     
     6、在主循环里模拟动物园的运转情况，要求在控制台上输出如下内容：第几天、动物的数量、动物园饲料的余量，直到饲料不够吃为止。
     
     7、动物的数量，食量，生产周期，饲料总量都应该是可以配置的(在同一个文件中统一配置)
     **************************************************************************************/
 
    
    Panda *panda = [Animal animalWithName:@"熊猫" eatFood:PANDEAT babyBorn:PANDABABYBORN animalCount:PANDASUM];
    Elephant *elephant = [Animal animalWithName:@"大象" eatFood:ELEPHANTEAT babyBorn:ELEPHANTBABYBORN animalCount:ELEPHANTSUM];
    Kangaroo *kangaroo = [Animal animalWithName:@"袋鼠" eatFood:KANGAROOEAT babyBorn:KANGAROOBABYBORN animalCount:KANGAROOSUM];
    Zoo *zoo = [Zoo zooWithFoods:FOODS Panda:panda elephant:elephant kangaroo:kangaroo];
   NSLog(@"************************************************************");
    for (NSInteger i = 1; 1; i++) {

        [zoo animalEat2];
        [zoo animalborth];
        
        [zoo perDayReport:i];
        if (zoo.foods < [zoo animalDayEat]){
            NSLog(@"饲料不足啊！！！让不让人活了！！！");         
            NSLog(@"************************************************************");
            break;
        }
        NSLog(@"************************************************************");
    }
  
  
 /******************************************************************
  
  二、在一个遥远的国度，有个国王叫山鲁亚尔，他有一些臣民，他们的职业分别是农民，工人和演员。农民的职责是种地，工人的职责是修理，演员的职责是演出。
  臣民们不用为了生计发愁，因为国王会每个星期给他们发工资，只是工资水平不同而已。
  国王每天的职责就是督促子民们干活。
  由于工资水平比较高，国王的积蓄有限，所以很不幸，这个可怜的国王再第四周就破产了。
  要求输出内容：
  1、当前是第几周的星期几。
  2、每一天每个子民的工作情况：包括名字、职业和工作内容。
  3、每周每个子民的收入情况，以及他们的财富总额。
  4、每周国王的支出总额，以及他的财富余额。
  5、最后宣布国王破产。
*88888888888888888888888888888888888888888888888888888888888888888***/
        People *king = [People peopleWithName:@"王甫" job:@"国王" duty:@"管理臣民" money:KINGMONEY];
        NSMutableArray *farmer = [[NSMutableArray alloc]initWithObjects:
                          [People peopleWithName:@"张三" job:@"农民" duty:@"种地" money:0],
                          [People peopleWithName:@"周超" job:@"农民" duty:@"种地" money:0],nil];
        NSMutableArray *worker = [[NSMutableArray alloc]initWithObjects:
                                  [People peopleWithName:@"李四" job:@"工人" duty:@"修理" money:0],
                                  [People peopleWithName:@"大饼" job:@"工人" duty:@"修理" money:0], nil];
        NSMutableArray *actor = [[NSMutableArray alloc]initWithObjects:
                                 [People peopleWithName:@"王五" job:@"演员" duty:@"表演" money:0],
                                 [People peopleWithName:@"王超" job:@"演员" duty:@"表演那啥" money:0],
                                 [People peopleWithName:@"小凡" job:@"演员" duty:@"表演那个" money:0],
                                 [People peopleWithName:@"吴丽" job:@"演员" duty:@"表演那个啥" money:0],nil];
        

        NSLog(@"farmer: %@",[farmer[0] name]);
        Kingdom *kingdom = [Kingdom kingdomWithKing:king farmer:farmer worker:worker actor:actor];
        [farmer release];
        [worker release];
        [actor release];
        
        NSLog(@"frmer: %@",[kingdom.actor[3] name]);
        for (NSInteger i = 1; 1 ; i++) {
            NSLog(@"\n@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
            [kingdom kingdomTime];
            [kingdom payPeople];
            [kingdom reportDuty];
            
            if (i % 7 == 0) {
                [kingdom sundayReport];
                [kingdom kingsMoney];
            }
//            NSLog(@"kingkkkk%f",kingdom.king.money);
            if (kingdom.king.money <= [kingdom payperWeek]) {
                NSLog(@"\n钱不够用了！！！下周就破产啦！！");
                break;
            }
        
        }
        
    }
    return 0;
}

