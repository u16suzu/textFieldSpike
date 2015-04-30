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
    self.count = 0;
    
    // Notifications
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification object:nil];

}

-(void)keyboardWillShow:(NSNotification*)note{
    // キーボードの表示開始時の場所と大きさを取得します。
    CGRect keyboardFrameBegin = [[note.userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue];
    
    // キーボードの表示完了時の場所と大きさを取得します。
    CGRect keyboardFrameEnd = [[note.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
}

#pragma mark - Delegate Methods

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]) {
        if( self.count < 3 ){
            self.count++;
            self.textViewHeightConstraint.constant += 20;
        }
    }
    
    return YES;
}

#pragma mark -

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
