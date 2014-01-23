//
//  HySampleTwoDropZoneWrapper.m
//  Hydrogen_DragAndDrop
//
//  Created by Rick Boykin on 1/21/14.
//  Copyright (c) 2014 Mondo Robot. All rights reserved.
//

#import "HySampleTwoDropZoneWrapper.h"
#import "HyDragAndDrop.h"

@interface HySampleTwoDropZoneWrapper()

@property (nonatomic, retain) UIColor *savedBackgroundColor;

@end

@implementation HySampleTwoDropZoneWrapper

- (id)initWithView:(UIView *)view
{
    self = [super init];
    if(self)
    {
        self.view = view;
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    
}

- (BOOL)isActive:(HyDragAndDropManager *)manager point:(CGPoint)point
{
    return [self.view isActiveDropZone:manager point:point];
}

- (BOOL)dragStarted:(HyDragAndDropManager *)manager
{
    self.savedBackgroundColor = self.view.backgroundColor;
    return YES;
}

- (BOOL)isInterested:(HyDragAndDropManager *)manager
{
    //NSLog(@"HySampleOneDropZoneView.dragStarted");
    
    BOOL ret = NO;
    UIPasteboard *pastebaord = manager.pasteboard;
    NSString *tagValue = [NSString stringWithFormat:@"val-%ld", (long)self.view.tag];
    NSString *pasteboardString = pastebaord.string;
    
    if([tagValue isEqualToString:pasteboardString])
        ret = YES;
    
    if(ret)
    {
        self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    }
    else
    {
        self.view.backgroundColor = [UIColor redColor];
    }
    
    return ret;
}

- (void)dragEnded:(HyDragAndDropManager *)manager
{
    //NSLog(@"HySampleOneDropZoneView.dragEnded");
    [self performSelector:@selector(delayEnd) withObject:nil afterDelay:0.2];
}

- (void)delayEnd
{
    self.view.backgroundColor = self.savedBackgroundColor;
}

- (void)dragEntered:(HyDragAndDropManager *)manager point:(CGPoint)point
{
    //NSLog(@"HySampleOneDropZoneView.dragEntered");
    self.view.backgroundColor = [UIColor orangeColor];
}

- (void)dragExited:(HyDragAndDropManager *)manager point:(CGPoint)point
{
    //NSLog(@"HySampleOneDropZoneView.dragExited");
    self.view.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
}

- (void)dragMoved:(HyDragAndDropManager *)manager point:(CGPoint)point
{
    //NSLog(@"HySampleOneDropZoneView.dragMoved");
}

- (void)dragDropped:(HyDragAndDropManager *)manager point:(CGPoint)point
{
    //NSLog(@"HySampleOneDropZoneView.dragDropped");
    self.view.backgroundColor = [UIColor magentaColor];
}

@end
