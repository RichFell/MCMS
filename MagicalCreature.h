//
//  MagicalCreature.h
//  MCMS
//
//  Created by Richard Fellure on 5/20/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MagicalCreature : NSObject
@property NSString *name;
@property NSString *description;
@property UIImage *picture;

-(MagicalCreature *)initWithName: (NSString *)name description: (NSString *)description picture: (UIImage *) picture;

@end
