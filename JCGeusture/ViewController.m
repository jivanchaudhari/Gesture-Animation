//
//  ViewController.m
//  JCGeusture
//
//  Created by Student P_05 on 23/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UISwipeGestureRecognizer *rightGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleRightGesture)];
    
    [rightGesture setDirection:UISwipeGestureRecognizerDirectionRight];
    
    [self.view addGestureRecognizer:rightGesture];
    
    ///////////////////////////////////////////////////////////////////////////
    
    UISwipeGestureRecognizer *leftGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleLeftGesture)];
    [leftGesture setDirection:UISwipeGestureRecognizerDirectionLeft];
    
    [self.view addGestureRecognizer:leftGesture];
    
    //////////////////////////////////////////////////////////////////////////////////
    
    UISwipeGestureRecognizer *upGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleUpGesture)];
    
    [upGesture setDirection:UISwipeGestureRecognizerDirectionUp];
    
    [self.view addGestureRecognizer:upGesture];
    
    //////////////////////////////////////////////////////////////////////////////////
    
    UISwipeGestureRecognizer *downGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleDownGesture)];
    [downGesture setDirection:UISwipeGestureRecognizerDirectionDown];
    
    
    [self.view addGestureRecognizer:downGesture];
    
    /////////////////////////////////////////////////////////////////////////////////
    
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture)];
    
    tapGesture.numberOfTapsRequired = 1;
    
    self.view.userInteractionEnabled = YES;
    
    [self.imageBall addGestureRecognizer:tapGesture];
    
    
    /////////////////////////////////////////////////////////////////////////////////
    
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(handlePanGesture:)];
    
    self.imageBall.userInteractionEnabled = YES;
    
    [self.imageBall addGestureRecognizer:panGesture];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tranistionDimentionFor_X: (CGFloat) xOriginChange
                              Y: (CGFloat) yOriginChange {
    
    [UIView transitionWithView: self.imageBall duration:0.5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        
        
        CGPoint point = self.imageBall.frame.origin;
        
        CGFloat width = self.imageBall.frame.size.width;
        
        CGFloat height = self.imageBall.frame.size.height;
        
        [self.imageBall setFrame:CGRectMake(point.x + xOriginChange, point.y + yOriginChange, width, height)];
        
        
    } completion:^(BOOL finished) {
       
        if (finished) {
            NSLog(@"Transition Finish");
        }
    }];
}
-(void)zoomActionForDimention_X : (CGFloat)zoomInChange
                               Y: (CGFloat)zoomOutChange {
    
    [UIView transitionWithView:self.imageBall duration:0.5 options:UIViewAnimationOptionCurveEaseIn animations:^{
        
        CGPoint point = self.imageBall.frame.origin;
        
        CGFloat width = self.imageBall.frame.size.width;
        
        CGFloat height = self.imageBall.frame.size.height;
        
        [self.imageBall setFrame:CGRectMake(point.x, point.y, width + zoomInChange, height + zoomOutChange)];
        
        
    } completion:^(BOOL finished) {
        
        if (finished) {
            NSLog(@"Animation Finished");
        }
    }];
}

-(void)handleRightGesture {

    [self tranistionDimentionFor_X:100 Y:0];
    
}
-(void)handleLeftGesture {
    
    [self tranistionDimentionFor_X:-100 Y:0];
}
-(void)handleUpGesture {
    
    [self tranistionDimentionFor_X:0 Y:-100];
    
}
-(void)handleDownGesture {
    [self tranistionDimentionFor_X:0 Y:100];
    
}
-(void)handleTapGesture {
    [self rotatedImage];
    
}
-(void)rotatedImage {
    
    [UIView transitionWithView:self.imageBall duration:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
        
        for (int a=1; a<=10; a++)
            self.imageBall.transform = CGAffineTransformMakeRotation(a * 2);
        self.imageBall.animationRepeatCount =  10;
        
    } completion:nil];
    
}
-(void)handlePanGesture:(UIPanGestureRecognizer *)gesture {
    
    CGRect originalFrame;
    
    if ([gesture isKindOfClass:[UIPanGestureRecognizer class]]) {
        
        if (gesture.state == UIGestureRecognizerStateBegan) {
            
            originalFrame = gesture.view.frame;
            
        }
        else if (gesture.state == UIGestureRecognizerStateChanged) {
           
            CGPoint delta = [gesture locationInView:self.view];
            
            gesture.view.center = delta;
        }
        else if (gesture.state == UIGestureRecognizerStateEnded) {
            
        }
    }
        else {
            NSLog(@"Pan Gesture Not Detected");
            
    }
    
}
- (IBAction)zoomInAction:(id)sender {
    
    [self zoomActionForDimention_X:50 Y:50];
    
}

- (IBAction)zoomOutAction:(id)sender {
    
    [self zoomActionForDimention_X:-50 Y:-50];
}
@end
