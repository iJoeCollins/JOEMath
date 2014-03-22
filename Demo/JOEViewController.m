//
//  JOEViewController.m
//  JOEMath
//
//  Created by Joseph Collins on 3/21/14.
//  Copyright (c) 2014 Joseph Collins. All rights reserved.
//

#import "JOEViewController.h"
#import "JOEMath.h"

@interface JOEViewController ()

@property (strong, nonatomic) NSSet *divisors;
@property (nonatomic, assign) int maxDividend;
@property (nonatomic, copy) NSString *totalFound;

@end

@implementation JOEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if ([textField isEqual:self.divisorTextField]) {
        self.divisors = [[NSSet alloc] initWithArray:[textField.text componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]]];
    } else if ([textField isEqual:self.dividendTextField]) {
        self.maxDividend = [textField.text integerValue];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.divisorTextField]) {
        [self.dividendTextField becomeFirstResponder];
    } else if ([textField isEqual:self.dividendTextField]) {
        [textField resignFirstResponder];
    }
    
    return NO;
}

- (void)updateTry:(NSTimer *)timer
{
    [UIView setAnimationsEnabled:NO];
    [self.sortButton setTitle:[NSString stringWithFormat:@"Trying: %d", self.maxDividend] forState:UIControlStateNormal];
    [UIView setAnimationsEnabled:YES];
    if (self.maxDividend == 0) {
        [timer invalidate];
        [self.sortButton setTitle:self.totalFound forState:UIControlStateNormal];
        
        [UIView animateWithDuration:0.5f delay:2.0f options:UIViewAnimationOptionAllowAnimatedContent animations:^{
            [self.sortButton.titleLabel setAlpha:0];
        } completion:^(BOOL finished) {
            [self.sortButton.titleLabel setAlpha:1];
            [self.sortButton setTitle:@"Start" forState:UIControlStateNormal];
        }];
    }
}


- (IBAction)sortQuotients:(id)sender
{
    [self.activityIndicator startAnimating];
    NSString *placeholder = @"Dividends divisible by divisors:";
    self.resultsTextView.text = placeholder;
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f/30.0f target:self selector:@selector(updateTry:) userInfo:nil repeats:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSMutableString *resultString = [NSMutableString new];
        int totalSuccess = 0;

        for (int i = self.maxDividend; i > 0; i--) {
            _maxDividend--;
            BOOL success;
            @autoreleasepool {
                success = [JOEMath integer:i isDivisibleByDivisorsInSet:self.divisors];
            }
            if (success) {
                totalSuccess++;
                self.totalFound = [NSString stringWithFormat:@"Found: %d dividends", totalSuccess];
                [resultString appendString:[NSString stringWithFormat:@"\n %d", i]];
            }
        }

        
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([resultString length]) {
                self.resultsTextView.text = [NSString stringWithFormat:@"%@\n%@", self.resultsTextView.text, resultString];
            }
            if ([self.resultsTextView.text isEqualToString:placeholder]) {
                self.resultsTextView.text = @"No divisible dividends found!";
            }
            [self.activityIndicator stopAnimating];
        });
        
    });
}

@end
