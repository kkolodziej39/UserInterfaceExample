//
//  ImageModel.m
//  UserInterfaceExample
//
//  Created by Eric Larson on 9/2/20.
//  Copyright © 2020 Eric Larson. All rights reserved.
//

#import "ImageModel.h"
@interface ImageModel()
@property (strong, nonatomic) NSMutableDictionary * imageNames;
@end

@implementation ImageModel
@synthesize imageNames = _imageNames;

+(ImageModel*)sharedInstance{
    static ImageModel* _sharedInstance = nil;
    static dispatch_once_t predicate;
    
    dispatch_once(&predicate, ^{
        _sharedInstance = [[ImageModel alloc] init];
    } );
    return _sharedInstance;
}

-(NSMutableDictionary*) imageNames{
    if(!_imageNames){
        UIImage * image1 = [UIImage imageNamed: @"Bill"];
        UIImage * image2 = [UIImage imageNamed: @"Eric"];
        UIImage * image3 = [UIImage imageNamed: @"Jeff"];
    
        _imageNames = [NSMutableDictionary dictionaryWithObjectsAndKeys: image1, @"Bill", image2, @"Eric", image3, @"Jeff" , nil];
    }
    
    return _imageNames;
}


-(UIImage*)getImageWithName:(NSString*)name{
    UIImage* image = nil;
    
    image = self.imageNames[name];
    
    return image;
}

-(UIImage*)getImageWithIndex:(NSInteger)index{
    @try {
        NSArray * keys = [self.imageNames allKeys]; //get an array of the keys
        id specificKey = [keys objectAtIndex:index]; //get the key at the index
        return [self.imageNames objectForKey:specificKey]; //get the image associated with the key
        
    }@catch (NSException * exception){
        NSLog(@"Caught %@: %@", [exception name], [exception reason]);
    }
}

-(NSInteger)numberOfImages{
    if(!self.imageNames){
        //if not created then return 0
        return 0;
    }
    
    return self.imageNames.count; //else return the dictionary size
}

-(NSString*)getImageNameForIndex:(NSInteger)index{
    @try {
        NSArray * keys = [self.imageNames allKeys]; //get an array of the keys
        return [keys objectAtIndex:index]; //return the image name at that index
        
    }@catch (NSException * exception){
        NSLog(@"Caught %@: %@", [exception name], [exception reason]);
    }
}

@end
