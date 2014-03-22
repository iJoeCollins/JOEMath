//
//  JOEViewController.h
//  JOEMath
//
//  Created by Joseph Collins on 3/21/14.
//  Copyright (c) 2014 Joseph Collins. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JOEViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *divisorTextField;
@property (weak, nonatomic) IBOutlet UITextField *dividendTextField;
@property (weak, nonatomic) IBOutlet UITextView *resultsTextView;
@property (weak, nonatomic) IBOutlet UIButton *sortButton;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
