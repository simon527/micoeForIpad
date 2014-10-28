//
//  RbtProjectModel.m
//  RedBudTek
//
//  Created by 黄川 on 13-11-15.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtProjectModel.h"

@implementation RbtProjectModel

+ (RbtProjectModel *)sharedInstance{
    static RbtProjectModel *sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(
                  &onceToken, ^{
                      sharedInstance = [[RbtProjectModel alloc] init];
                  });
    return sharedInstance;
}

-(void) encodeWithCoder: (NSCoder *) aCoder{
    [aCoder encodeObject:self.leixing forKey:@"leixing"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.projectid forKey:@"projectid"];
    [aCoder encodeObject:self.city forKey:@"city"];
    [aCoder encodeObject:self.citycode forKey:@"citycode"];
    [aCoder encodeObject:self.latitude forKey:@"latitude"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
}

-(id) initWithCoder: (NSCoder *) aDecoder{
    if (self = [super init]) {
        self.leixing = [[aDecoder decodeObjectForKey:@"leixing"] copy];
        self.name = [[aDecoder decodeObjectForKey:@"name"] copy];
        self.projectid = [[aDecoder decodeObjectForKey:@"projectid"] copy];
        self.city = [[aDecoder decodeObjectForKey:@"city"] copy];
        self.citycode = [[aDecoder decodeObjectForKey:@"citycode"] copy];
        self.latitude = [[aDecoder decodeObjectForKey:@"latitude"] copy];
        self.longitude = [[aDecoder decodeObjectForKey:@"longitude"] copy];
    }
    return (self);
}

@end
