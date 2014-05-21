//
//  MagicalCreature.m
//  MCMS
//
//  Created by Richard Fellure on 5/20/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import "MagicalCreature.h"

@implementation MagicalCreature

-(MagicalCreature *)initWithName: (NSString *)name description: (NSString *)description picture:(UIImage *)picture
{
    self.name = name;
    self.description = description;
    self.picture = picture;
    return self;
}
@end
