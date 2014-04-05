//
//  JOEViewController.m
//  JOEMath
//
//  Created by Joseph Collins on 3/21/14.
//  Copyright (c) 2014 Joseph Collins. All rights reserved.
//

#import "JOEDivisionViewController.h"
#import "JOEMath.h"

@interface JOEDivisionViewController ()

@property (strong, nonatomic) NSSet *divisors;
@property (nonatomic, assign) int maxDividend;
@property (copy) NSString *totalFound;

@end

@implementation JOEDivisionViewController

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
        self.maxDividend = [textField.text intValue];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField isEqual:self.divisorTextField]) {
        [self.dividendTextField becomeFirstResponder];
    } else if ([textField isEqual:self.dividendTextField]) {
        [textField resignFirstResponder];
        self.totalFound = @"Found: 0 dividend(s)";
        self.resultsTextView.text = self.totalFound;
        [self performSelector:@selector(sortQuotients:) withObject:nil afterDelay:0.1];
    }
    
    return NO;
}

- (void)updateTry:(NSTimer *)timer
{
    if (self.maxDividend == 0) {
        [timer invalidate];
        return;
    }
    [UIView setAnimationsEnabled:NO];
    [self.resultsTextView setText:[NSString stringWithFormat:@"Trying: %d\n%@", _maxDividend, self.totalFound]];
    [UIView setAnimationsEnabled:YES];
}


- (IBAction)sortQuotients:(id)sender
{
    [self.activityIndicator startAnimating];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f/30.0f target:self selector:@selector(updateTry:) userInfo:nil repeats:YES];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        NSLock *locker = [[NSLock alloc] init];

        NSMutableString *resultString = [NSMutableString new];
        int totalSuccess = 0;

        for (int i = self.maxDividend; i > 0; i--) {
            _maxDividend--;
            BOOL success;
                success = [JOEMath integer:i isDivisibleByDivisorsInSet:self.divisors];

            if (success) {
                totalSuccess++;
                [locker lock];
                self.totalFound = [NSString stringWithFormat:@"Found: %d dividend(s)", totalSuccess];
                [locker unlock];
                [resultString appendString:[NSString stringWithFormat:@"\n %d", i]];
            }
        }

        
        dispatch_async(dispatch_get_main_queue(), ^{
            if ([resultString length]) {
                self.resultsTextView.text = [NSString stringWithFormat:@"%@%@", self.totalFound, resultString];
            }

            [self.activityIndicator stopAnimating];
        });
        
    });
}

@end
