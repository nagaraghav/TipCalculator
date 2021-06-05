//
//  ViewController.m
//  TipCalculator
//
//  Created by Raghav Sreeram on 6/4/21.


#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    
    
    [self.tipControl setTitle: [NSString stringWithFormat:@"%.0f%%", doubleValue] forSegmentAtIndex:0];
    
    
}

- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:YES];
}


- (IBAction)onEdit:(id)sender {
    double bill = [self.billField.text doubleValue];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        NSInteger doubleValue = [defaults integerForKey:@"default_tip_percentage"];
    
    NSArray *percentages = @[@(doubleValue * .01),@(0.18),@(0.20)];
    
    double tipPercentage = [percentages[self.tipControl.selectedSegmentIndex] doubleValue];
    double tip = tipPercentage * bill;
    double total = bill+tip;
    self.tipLabel.text = [NSString stringWithFormat:@"$%.2f", tip];
    self.totalLabel.text = [NSString stringWithFormat:@"$%.2f", total];
    
}


@end
