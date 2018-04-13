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
        
//checking time with array
        double startTime = CACurrentMediaTime();
        NSLog(@"index of object is %lu, search time: %f",
              (unsigned long)[mutArray indexOfObject:[NSNumber numberWithInteger:74]],
              CACurrentMediaTime() - startTime);
//on my mac time was 0.000109 seconds
        
        
//checking time with set
        NSSet* set2 = [[NSSet setWithArray:mutArray] copy];

        startTime = CACurrentMediaTime();
        NSLog(@"Is set2 contain 74? - %@, search time: %f",
              [set2 containsObject:[NSNumber numberWithInteger:74]] ? @"YES": @"NO",
              CACurrentMediaTime() - startTime);
//on my mac time was 0.000026 seconds
// NSSet is much faster then NSMutableArray
        
        //releasing mutable array and set
        [set2 release];
        [mutArray release];
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
