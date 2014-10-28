//
//  RbtOnlineManager.h
//  RedBudTek
//
//  Created by 黄川 on 13-11-10.
//  Copyright (c) 2013年 redbudtek. All rights reserved.
//

#import "RbtWebManager.h"


@interface RbtOnlineManager : RbtWebManager

- (void)getpublicprojectWithUser:(NSString *)userName andH:(NSString *)h;
- (void)getMyProjectWithUser:(NSString *)userName andH:(NSString *)h;
- (void)getrunprincipleWithP:(NSString *)p;
@end
