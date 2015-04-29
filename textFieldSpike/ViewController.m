//
//  ViewController.m
//  textFieldSpike
//
//  Created by u16suzu on 2015/04/29.
//  Copyright (c) 2015年 u16suzu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textViewHeightConstraint;
@property (nonatomic) NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count=1;
}

#pragma mark - Delegate Methods

- (void)textViewDidChange:(UITextView *)textView{
//    NSLog(@"%@", textView.text );
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    NSLog(@"%@", text );
    
    if ([text isEqualToString:@"\n"]) {
        self.count++;
        NSLog(@"%@", @"OK" );

        NSLog(@"%@", self.textView.constraints );
        
        self.textViewHeightConstraint.constant = self.count*30;
    }
    
    return YES;
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
