//
//  SuitabilityViewController.m
//  InvestShare
//
//  Created by Danilo Batata on 11/11/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#import "SuitabilityViewController.h"
#import "Helper.h"

#define kRiskTag        1
#define kTimeTag        2
#define kIncomeTag      3
#define kInvestmentTag  4

@interface SuitabilityViewController ()

@property (weak, nonatomic) IBOutlet UILabel *riskLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *incomeLabel;
@property (weak, nonatomic) IBOutlet UILabel *investmentLabel;
@property (weak, nonatomic) IBOutlet UISlider *riskSlider;
@property (weak, nonatomic) IBOutlet UISlider *timeSlider;
@property (weak, nonatomic) IBOutlet UISlider *incomeSlider;
@property (weak, nonatomic) IBOutlet UISlider *investmentSlider;

@end

@implementation SuitabilityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault animated:YES];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions
- (IBAction)cancelTouchUpInside:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate suitabilityDidCancel];
    }];
}

- (IBAction)doneTouchUpInside:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        [self.delegate suitabilityDidDismissWithRisk:(NSInteger)self.riskSlider.value
                                                time:(NSInteger)self.timeSlider.value
                                              income:(NSInteger)self.incomeSlider.value
                                               value:(NSInteger)self.investmentSlider.value];
    }];
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    switch (sender.tag) {
        case kRiskTag:
            [sender setValue:roundf(sender.value) animated:NO];
            self.riskLabel.text = [self formatRiskFromValue:(long)sender.value];
            break;
            
        case kTimeTag:
            self.timeLabel.text = [NSString stringWithFormat:@"%ld meses", (long)sender.value];
            break;
            
        case kIncomeTag:
            [sender setValue:((int)((sender.value + 2.5) / 5) * 5) animated:NO];
            self.incomeLabel.text = [NSString stringWithFormat:@"%ld%%", (long)sender.value];
            break;
            
        case kInvestmentTag:
            [sender setValue:((int)((sender.value + 500) / 1000) * 1000) animated:NO];
            self.investmentLabel.text = [Helper formatCurrencyFromValue:(long)sender.value];
            break;
            
        default:
            break;
    }
}

#pragma mark - Helper Methods
- (NSString *)formatRiskFromValue:(NSInteger)value {
    switch (value) {
        case 1:
            return @"Risco A";
            
        case 2:
            return @"Risco B";
            
        case 3:
            return @"Risco C";
            
        case 4:
            return @"Risco D";
            
        default:
            NSLog(@"value out of bounds (1-4): %ld", (long)value);
            return nil;
    }
}

#pragma mark - Table view data source
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
}

@end
