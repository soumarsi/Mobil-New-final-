//
//  Model.h
//  Mcoupon
//
//  Created by Anirban Tah on 06/06/14.
//  Copyright (c) 2014 Anirban Tah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Mymodel : NSObject{
    

    NSMutableArray *ImageArray;
}

@property(nonatomic,retain)NSMutableArray *ImageArray;
+(Mymodel *)getInstance;
@end
