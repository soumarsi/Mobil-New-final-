//
//  UzysGridViewCell.m
//  UzysGridView
//
//  Created by Uzys on 11. 11. 7..
//  Copyright (c) 2011 Uzys. All rights reserved.
//

#import "UzysGridViewCell.h"
#import "UzysGridView.h"

@interface UzysGridViewCell (private)
- (void)BtnActionDelete;                                //Cell Delete Action Handler
- (void)moveByOffset:(CGPoint)offset;                   //Cell Moving by offset
//- (void)SetPosition:(CGPoint) point;                    //Cell moving absolute position
- (void)movePagesTimer:(NSTimer*)timer;                 //Page Move Timer
@end
@implementation UzysGridViewCell

@synthesize index=_index;
//@synthesize gridView;
@synthesize ButtonDelete,ButtonDelete1;
@synthesize page;
@synthesize deletable;
@synthesize cellInitFrame;
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         // Initialization code       
        deletable = YES;
        
        ButtonDelete1 = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [ButtonDelete1 addTarget:self action:@selector(BtnActionDelete) forControlEvents:UIControlEventTouchUpInside];
        [ButtonDelete1 setImage:[UIImage imageNamed:@"Cross-Back.png"] forState:UIControlStateNormal];
        [ButtonDelete1 setImage:[UIImage imageNamed:@"Cross-Back.png"] forState:UIControlStateHighlighted];
        [ButtonDelete1 setHidden:YES];
        [self addSubview:ButtonDelete1];
        self.exclusiveTouch =YES;
        
        ButtonDelete = [UIButton buttonWithType:UIButtonTypeCustom] ;
        [ButtonDelete addTarget:self action:@selector(BtnActionDelete) forControlEvents:UIControlEventTouchUpInside];
        [ButtonDelete setImage:[UIImage imageNamed:@"icon_del.png"] forState:UIControlStateNormal];
        [ButtonDelete setImage:[UIImage imageNamed:@"icon_del.png"] forState:UIControlStateHighlighted];
        [ButtonDelete setHidden:YES];
        [self addSubview:ButtonDelete];        
        self.exclusiveTouch =YES;
        
        UILongPressGestureRecognizer *_gestureLong = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPress:)];
        _gestureLong.minimumPressDuration =1.0;
        [self addGestureRecognizer:_gestureLong];
//        [_gestureLong release];
    }
    return self;
}

- (void)dealloc {
   // NSLog(@"dealloc gridviewcell");
//    [ButtonDelete release];
//    [super dealloc];
}

-(void) handleLongPress:(UILongPressGestureRecognizer *)recognizer  {
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(gridViewCell:handleLongPress:)])
    {
        [self.delegate gridViewCell:self handleLongPress:self.index];        
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGSize imgsize = [UIImage imageNamed:@"icon_del.png"].size;
    CGRect CellBound = self.bounds;
    CGSize imgsize1 = [UIImage imageNamed:@"Cross-Back.png"].size;
    CGRect CellBound1 = self.bounds;
    
    [ButtonDelete1 setFrame:CGRectMake(CellBound1.size.width - imgsize1.width+18 ,0, imgsize1.width/2, imgsize1.height/2)];
    [ButtonDelete setFrame:CGRectMake(CellBound.size.width - imgsize.width ,3, imgsize.width-4, imgsize.height-4)];
}

- (void)setCellIndex:(NSNumber *)theIndex
{
    _index = [theIndex intValue];
}
- (void)setCellPage:(NSNumber *)thePage
{
    page = [thePage intValue];
}


#pragma Touch Event Handling

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    if(self.delegate && [self.delegate respondsToSelector:@selector(gridViewCell:touchesMoved:withEvent:)])
    {
        [self.delegate gridViewCell:self touchesBegan:touches withEvent:event];        
    }
	[super touchesBegan:touches withEvent:event];

    NSLog(@"TB");
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {

    if(self.delegate && [self.delegate respondsToSelector:@selector(gridViewCell:touchesMoved:withEvent:)])
    {
        [self.delegate gridViewCell:self touchesMoved:touches withEvent:event];        
    }
    [super touchesMoved:touches withEvent:event];
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {

    if(self.delegate && [self.delegate respondsToSelector:@selector(gridViewCell:touchesEnded:withEvent:)])
    {
        [self.delegate gridViewCell:self touchesEnded:touches withEvent:event];        
    }
    [super touchesEnded:touches withEvent:event];

}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesCancelled:touches withEvent:event];
    
    if(self.delegate && [self.delegate respondsToSelector:@selector(gridViewCell:touchesCancelled:withEvent:)])
    {
        [self.delegate gridViewCell:self touchesCancelled:touches withEvent:event];        
    }
}


- (void) BtnActionDelete;
{
    NSLog(@"Delete Button %ld",(long)self.index);

    if(self.delegate && [self.delegate respondsToSelector:@selector(gridViewCell:didDelete:)])
    {
        [self.delegate gridViewCell:self didDelete:self.index];        
    }
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)moveByOffset:(CGPoint)offset 
{
	CGRect frame = [self frame];
	frame.origin.x += offset.x;
	frame.origin.y += offset.y;
	[self setFrame:frame];
}

- (void)setEdit:(BOOL)edit
{
    if(edit == YES)
    {
        if(self.deletable == YES)
        {
            [self.ButtonDelete setHidden:NO];
            [self.ButtonDelete1 setHidden:NO];
        }
    }
    else
    {
        if(self.deletable ==YES)
        {
            [self.ButtonDelete setHidden:YES];
            [self.ButtonDelete1 setHidden:YES];
        }
        
    }
}


@end
