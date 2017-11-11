//
// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
#import <Foundation/Foundation.h>

// Bridged as `enum Foo: UInt`
typedef NS_ENUM(NSUInteger, PetType) {
    // Swift assumes ObjC enum constants prefixed with enum tag
    PetTypeDog,  // Bridged as `dog`
    PetTypeCat,  // Bridged as `cat`
    PetTypeOther // Bridged as `other`
};


// Use `nullable` and `nonnull` qualifiers to specify Optional vs. non-Optional types

@interface Toy : NSObject
// Bridged as `init(name: String?)`
- (nonnull instancetype)initWithName:(nullable NSString *)name;
+ (nonnull instancetype)toyWithName:(nullable NSString *)name;

// Bridged as `var name: String`
@property (strong, nonatomic, nonnull) NSString *name;
@end


NS_ASSUME_NONNULL_BEGIN
@interface Pet : NSObject

// Bridged as `init(name: String?, type: PetType)`
- (instancetype)initWithName:(nullable NSString *)name type:(PetType)type;
+ (instancetype)petWithName:(nullable NSString *)name type:(PetType)type;

// Bridged as `var type: PetType`
@property (nonatomic) PetType type;

// Bridged as `var name: String`
@property (strong, nonatomic) NSString *name;

// Bridged as `var toys: [Toy]`
// Note: non-parameterized arrays are bridged as `[Any]`
@property (strong, nonatomic) NSArray<Toy *> *toys;

@end
NS_ASSUME_NONNULL_END




