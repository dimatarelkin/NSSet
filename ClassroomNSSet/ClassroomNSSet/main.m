//
//  main.m
//  ClassroomNSSet
//
//  Created by Dmitriy Tarelkin on 13/4/18.
//  Copyright © 2018 Dmitriy Tarelkin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    
    @autoreleasepool {
        //1 Use NSSet to exclude duplicates from array.
        NSArray* arr = @[@1, @2, @3, @3, @23, @4, @2, @4, @2, @4, @212];  //will be autoreleased
        NSLog(@"arr %@",[arr componentsJoinedByString:@"-"]);
        
        NSSet* set = [[NSSet setWithArray:arr] copy];
        NSLog(@"set %@", [set description]);
        
        //releasing set
        [set release];
        
        
        
//2 Check what is faster: Create an array of 100 numbers. Check whether number 74 is contained inside an array. Transform array into NSSet and check whether number 74 is contained inside NSSet.
        
        NSMutableArray* mutArray = [NSMutableArray array];
        
        for (int i = 1; i < 101; i+=1) {
            [mutArray addObject:[NSNumber numberWithInteger:i]];
        }
        NSLog(@"%@", [mutArray componentsJoinedByString:@","]);
        
        
        NSLog(@"index of object is %lu",(unsigned long)[mutArray indexOfObject:[NSNumber numberWithInteger:74]]);
        
        NSSet* set2 = [[NSSet setWithArray:mutArray] copy];
        NSLog(@"Is set2 contain 74? - %@", [set2 containsObject:[NSNumber numberWithInteger:74]] ? @"YES": @"NO");
        
        //releasing mutable array and set
        [set2 release];
        [mutArray release];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}