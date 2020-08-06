//
//  ViewController.m
//  KVCDemo
//
//  Created by akun on 2020/7/26.
//  Copyright © 2020 akun. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /**
     设置值
     1、先找相关方法 set<key>:, _set<key>:, setIs<key>:
     2、若没有相关方法，调用 +(BOOL)accessInsanceVariablesDirectly,判断是否可以直接方法成员变量
     3、如果为NO，直接执行KVC 的 setValue:forUndefinedKey:方法。系统抛出异常，未定义的key
     4、如果为YES，继续找相关变量_<key>,_is<key>,<key>,is<key>
     5、方法和成员变量都不存在，调用setValue:forUndefinedKey:方法。系统抛出异常，未定义的key
     
     */
    Person * p = [Person new];
    
    [p setValue:@"Tom" forKey:@"name"];
    NSLog(@"%@", [p valueForKey:@"name"]);
    
    
    [p setValue:@"18" forKey:@"age"];
    NSLog(@"%@", [p valueForKey:@"age"]);
    
    // 正确性验证
    NSString * name = @"jjj  ";
    if ([p validateValue:&name forKey:@"name" error:NULL]) {
        [p setValue:name forKey:@"name"];
    }
}


@end
