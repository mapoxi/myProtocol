#import "myView.h"


@implementation myView

@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    if ((self = [super initWithFrame:frame])) {
        [self setBackgroundColor:[UIColor blackColor]];
        boxView = [[UIView alloc] initWithFrame:CGRectMake(50, 30, 220, 220)];
        [boxView setBackgroundColor:[UIColor redColor]];
        [self addSubview:boxView];
    }

    return self;
}

- (void)animate {
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationWillStartSelector:@selector(animationStarted)];
    [UIView setAnimationDidStopSelector:@selector(animationStopped)];
    CGRect newFrame = CGRectMake(boxView.frame.origin.x, boxView.frame.origin.y + 100, boxView.frame.size.width, boxView.frame.size.height);
    [boxView setFrame:newFrame];
    /*if (boxView.frame.origin.y > 230) {
        CGRect newFrame2 = CGRectMake(boxView.frame.origin.x, boxView.frame.origin.y - 400, boxView.frame.size.width, boxView.frame.size.height);
        [boxView setFrame:newFrame2];
    }*/
    [UIView commitAnimations];
}

- (void)animationStarted {
    if ([delegate respondsToSelector:@selector(animationStartedWithView:)])
    {
        [delegate animationStartedWithView:self];
    }
}

- (void)animationStopped {
    if ([delegate respondsToSelector:@selector(animationHasFinishedWithView:)])
    {
        [delegate animationHasFinishedWithView:self];
    }
}

@end
