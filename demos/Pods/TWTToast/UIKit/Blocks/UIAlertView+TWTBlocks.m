//
//  UIAlertView+TWTBlocks.m
//  Toast
//
//  Based on SXYAlertView, created by Jeremy Ellison on 2/9/12.
//  Created by Andrew Hershberger on 6 February 2013
//  Copyright (c) 2015 Ticketmaster Entertainment, Inc. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import "UIAlertView+TWTBlocks.h"
#import <objc/runtime.h>

static char kTapHandlerKey;
static char kDismissHandlerKey;

@implementation UIAlertView (TWTBlocks)

- (void)twt_setTapHandler:(TWTAlertBlock)tapHandler
{
    self.delegate = (tapHandler || self.twt_dismissHandler) ? self : nil;
    
    objc_setAssociatedObject(self, &kTapHandlerKey, tapHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TWTAlertBlock)twt_tapHandler
{
    return objc_getAssociatedObject(self, &kTapHandlerKey);
}

- (void)twt_setDismissHandler:(TWTAlertBlock)dismissHandler
{
    self.delegate = (dismissHandler || self.twt_tapHandler) ? self : nil;
    
    objc_setAssociatedObject(self, &kDismissHandlerKey, dismissHandler, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (TWTAlertBlock)twt_dismissHandler
{
    return objc_getAssociatedObject(self, &kDismissHandlerKey);
}

#pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    TWTAlertBlock tapHandler = self.twt_tapHandler;
    if (tapHandler) {
        tapHandler(self, buttonIndex);
    }
    
    self.twt_tapHandler = nil;
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    TWTAlertBlock dismissHandler = self.twt_dismissHandler;
    if (dismissHandler) {
        dismissHandler(self, buttonIndex);
    }
    
    self.twt_dismissHandler = nil;
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
    self.twt_tapHandler = nil;
    self.twt_dismissHandler = nil;
}

@end
