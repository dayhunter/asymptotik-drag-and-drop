//
//  AtkSampleTwoDragSourceWrapper.h
//  Atkdrogen_DragAndDrop
//
//  Created by Rick Boykin on 1/21/14.
//  Copyright (c) 2014 Asymptotik Limited. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AtkDragAndDrop.h"

@interface AtkSampleTwoDragSourceWrapper : NSObject<AtkDragSourceProtocol>

@property (nonatomic, strong) UIView *view;

- (id)initWithView:(UIView *)view;

@end
