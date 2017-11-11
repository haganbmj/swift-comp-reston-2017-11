//
// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//

#import "Pet.h"


@implementation Toy
- (instancetype)initWithName:(NSString *)name {
    if (!(self = [super init])) return nil;
    self.name = [name copy];
    return self;
}

+ (instancetype)toyWithName:(NSString *)name {
    return [[[self class] alloc] initWithName:name];
}

- (NSString *)description {
    return self.name;
}
@end


@implementation Pet

+ (NSArray *)dogToys
{
    return @[[Toy toyWithName:@"ball"], [Toy toyWithName:@"rope"]];
}

+ (NSArray *)catToys
{
    return @[[Toy toyWithName:@"yarn"], [Toy toyWithName:@"mousie"]];
}

- (instancetype)initWithName:(NSString *)name type:(PetType)type
{
    if (!(self = [super init])) return nil;
    
    self.name = [name copy];
    self.type = type;
    
    self.toys = type == PetTypeDog ? [self.class dogToys] : [self.class catToys];
    
    return self;
}

+ (instancetype)petWithName:(NSString *)name type:(PetType)type
{
    return [[[self class] alloc] initWithName:name type:type];
}

@end
