//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Raghav Sreeram on 6/4/21.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *defaultTipField;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    self.defaultTipField.text = [NSString stringWithFormat:@"%.0f%%", doubleValue];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onEditing:(id)sender {
    double newTip = [self.defaultTipField.text doubleValue];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:newTip forKey:@"default_tip_percentage"];
    [defaults synchronize];

}


- (IBAction)onTap:(id)sender {
    
    [self.view endEditing:YES];
}

@end
