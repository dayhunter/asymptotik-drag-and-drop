//
//  AtkSampleOneDropZoneView.m
//  AtkDragAndDrop
//
//  Created by Rick Boykin on 1/17/14.
//  Copyright (c) 2014 Asymptotik Limited. All rights reserved.
//

#import "AtkSampleOneDropZoneView.h"

@interface AtkSampleOneDropZoneView ()

@property (nonatomic, strong) UIColor *savedBackgroundColor;

@end

@implementation AtkSampleOneDropZoneView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (BOOL)shouldDragStart:(AtkDragAndDropManager *)manager
{
    return YES;
}

- (BOOL)isInterested:(AtkDragAndDropManager *)manager
{
    NSLog(@"AtkSampleOneDropZoneView.isInterested");
    
    UIPasteboard *pastebaord = manager.pasteboard;
    NSString *tagValue = [NSString stringWithFormat:@"val-%ld", (long)self.tag];
    NSString *pasteboardString = pastebaord.string;
    
    return [tagValue isEqualToString:pasteboardString];
}

- (void)dragStarted:(AtkDragAndDropManager *)manager
{
    NSLog(@"AtkSampleOneDropZoneView.dragStarted");
    self.savedBackgroundColor = self.backgroundColor;

    UIPasteboard *pastebaord = manager.pasteboard;
    NSString *tagValue = [NSString stringWithFormat:@"val-%ld", (long)self.tag];
    NSString *pasteboardString = pastebaord.string;
    
    if([tagValue isEqualToString:pasteboardString])
    {
        self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
    }
    else
    {
        self.backgroundColor = [UIColor redColor];
    }
}

- (void)dragEnded:(AtkDragAndDropManager *)manager
{
    NSLog(@"AtkSampleOneDropZoneView.dragEnded");
    [self performSelector:@selector(delayEnd) withObject:nil afterDelay:0.4];
}

- (void)delayEnd
{
    self.backgroundColor = self.savedBackgroundColor;
}

- (void)dragEntered:(AtkDragAndDropManager *)manager point:(CGPoint)point
{
    NSLog(@"AtkSampleOneDropZoneView.dragEntered");
    self.backgroundColor = [UIColor orangeColor];
}

- (void)dragExited:(AtkDragAndDropManager *)manager point:(CGPoint)point
{
    NSLog(@"AtkSampleOneDropZoneView.dragExited");
    self.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1.0];
}

- (void)dragMoved:(AtkDragAndDropManager *)manager point:(CGPoint)point
{
    //NSLog(@"AtkSampleOneDropZoneView.dragMoved");
}

- (void)dragDropped:(AtkDragAndDropManager *)manager point:(CGPoint)point
{
    NSLog(@"AtkSampleOneDropZoneView.dragDropped");
    self.backgroundColor = [UIColor magentaColor];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
