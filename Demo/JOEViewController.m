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

#warning - place operations in a background thread as to not block the UI And update the text view on find of each dividend.
- (IBAction)sortQuotients:(id)sender
{
    [self.activityIndicator startAnimating];
    NSString *placeholder = @"Dividends divisible by divisors:";
    self.resultsTextView.text = placeholder;
    for (int i = self.maxDividend; i > 0; i--) {
        [self.sortButton setTitle:[NSString stringWithFormat:@"Trying: %d", i] forState:UIControlStateNormal];
        BOOL success = [JOEMath integer:i isDivisibleByDivisorsInSet:self.divisors];
        if (success) {
            self.resultsTextView.text = [NSString stringWithFormat:@"%@\n%d", self.resultsTextView.text, i];
        }
    }
    
    if ([self.resultsTextView.text isEqualToString:placeholder]) {
        self.resultsTextView.text = @"No divisible dividends found!";
    }
    
    [self.activityIndicator stopAnimating];
    [self.sortButton setTitle:@"Start" forState:UIControlStateNormal];
}
@end
