//
//  WFViewController.m
//  test
//
//  Created by Duger on 13-9-19.
//  Copyright (c) 2013年 Duger. All rights reserved.
//

#import "WFViewController.h"

@interface WFViewController ()

@end

@implementation WFViewController

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // register for keyboard notifications
    [[NSNotificationCenter defaultCenter] addObserver:self
          selector:@selector(keyboardWillShow name:UIKeyboardWillShowNotification
                                     object:self.view.window];
                                    // register for keyboard notifications
                                    [[NSNotificationCenter defaultCenter] addObserver:self
                                          selector:@selector(keyboardWillHide:)
                                          name:UIKeyboardWillHideNotification
                                          object:self.view.window];
                                    keyboardIsShown = NO;
                                    //make contentSize bigger than your scrollSize
                                    //(you will need to figure out for your own use case)
                                    CGSize scrollContentSize = CGSizeMake(320, 345);
                                    self.scrollView.contentSize = scrollContentSize;
                                    }
                                    
                                    - (void)viewDidUnload {
                                        // Release any retained subviews of the main view.
                                        // e.g. self.myOutlet = nil;
                                        
                                        // unregister for keyboard notifications while not visible.
                                        [[NSNotificationCenter defaultCenter] removeObserver:self
                                              name:UIKeyboardWillShowNotification
                                              object:nil];
                                        // unregister for keyboard notifications while not visible.
                                        [[NSNotificationCenter defaultCenter] removeObserver:self
                                              name:UIKeyboardWillHideNotification
                                              object:nil];
                                    }
                                    
                                    - (void)dealloc {
                                        // Release any retained subviews of the main view.
                                        // e.g. self.myOutlet = nil;
                                        
                                        // unregister for keyboard notifications while not visible.
                                        [[NSNotificationCenter defaultCenter] removeObserver:self
                                              name:UIKeyboardWillShowNotification
                                              object:nil];
                                        // unregister for keyboard notifications while not visible.
                                        [[NSNotificationCenter defaultCenter] removeObserver:self
                                              name:UIKeyboardWillHideNotification
                                              object:nil];
                                    }
                                    
                                    - (void)keyboardWillHide:(NSNotification *)n
    {
        NSDictionary* userInfo = [n userInfo];
        // get the size of the keyboard
        CGSize keyboardSize =
        [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey]
                  CGRectValue].size;
        // resize the scrollview
        CGRect viewFrame = self.scrollView.frame;
        // I'm also subtracting a constant kTabBarHeight because my UIScrollView
        // was offset by the UITabBar so really only the portion of the keyboard that
        // is leftover pass the UITabBar is obscuring my UIScrollView.
        viewFrame.size.height += (keyboardSize.height - kTabBarHeight);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        // The kKeyboardAnimationDuration I am using is 0.3
        [UIView setAnimationDuration:kKeyboardAnimationDuration];
        [self.scrollView setFrame:viewFrame];
        [UIView commitAnimations];
        keyboardIsShown = NO;
    }
                             
- (void)keyboardWillShow:(NSNotification *)n
    {
        // This is an ivar I'm using to ensure that we do not do the frame size 
        // adjustment on the UIScrollView if the keyboard is already shown.  
        // This can happen if the user, after fixing editing a UITextField, 
        // scrolls the resized UIScrollView to another UITextField and attempts 
        // to edit the next UITextField.  If we were to resize the UIScrollView again, 
        // it would be disastrous. NOTE: The keyboard notification will fire 
        // even when the keyboard is already shown.
        if (keyboardIsShown) {
            return;
            }
        
        NSDictionary* userInfo = [n userInfo];
        
        // get the size of the keyboard
        CGSize keyboardSize = 
        [[userInfo objectForKey:UIKeyboardFrameBeginUserInfoKey]
                  CGRectValue].size;
        
        // resize the noteView
        CGRect viewFrame = self.scrollView.frame;
        // I'm also subtracting a constant kTabBarHeight because my UIScrollView 
        // was offset by the UITabBar so really only the portion of the keyboard 
        // that is leftover pass the UITabBar is obscuring my UIScrollView.
        viewFrame.size.height -= (keyboardSize.height - kTabBarHeight);
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationBeginsFromCurrentState:YES];
        // The kKeyboardAnimationDuration I am using is 0.3
        [UIView setAnimationDuration:kKeyboardAnimationDuration];
        [self.scrollView setFrame:viewFrame];
        [UIView commitAnimations];
        keyboardIsShown = YES;
    }
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
