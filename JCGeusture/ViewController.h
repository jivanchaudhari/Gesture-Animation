//
//  ViewController.h
//  JCGeusture
//
//  Created by Student P_05 on 23/10/16.
//  Copyright © 2016 Jivan Chaudhari. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *imageBall;

- (IBAction)zoomInAction:(id)sender;
- (IBAction)zoomOutAction:(id)sender;

@end

