//
//  BHBlockPickerView.m
//  SunSmart
//
//  Created by Ashemah Harrison on 1/14/13.
//
//

#import "BHSimplePicker.h"

@implementation BHSimplePicker

- (void)layoutSubviews {
    // Move ourselves off the screen
    self.frame = CGRectMake(0, self.superview.frame.size.height-_totalH, self.superview.frame.size.width, _totalH);
    self.transform = CGAffineTransformMakeTranslation(0, _totalH);
}

+ (id)pickerWithParentView:(UIView*)parentView {
    NSAssert(NO, @"Not implemented");
    return nil;
}

- (id)initWithParentView:(UIView*)parentView
{
    
    self = [super init];
    
    if (self) {
        // Add ourselves to the parent
        [parentView addSubview:self];
        
        _totalH = kPickerHeight + kNavBarHeight;
        
        // Add the toolbar
        self.navBar             = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, parentView.frame.size.width, kNavBarHeight)];
        self.navItem            = [[UINavigationItem alloc] init];
        [self.navBar pushNavigationItem:self.navItem animated:NO];
        [self addSubview:self.navBar];
        
        self.doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(internalDoneTapped)];
        
        [self internalSetupPicker];
    }
    
    return self;
}

- (void)internalSetupPicker {    
    NSAssert(NO, @"Not implemented");
}

- (void)internalDoneTapped {
    
    if (self.doneTappedForPicker) {
        self.doneTappedForPicker(self);
    }
}

- (void)hidePicker {
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformMakeTranslation(0, _totalH);
    }];
}

- (void)showPicker {
    [self refreshPicker];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformIdentity;
    }];
}

- (void)refreshPicker {
    
    if (self.navBarForPicker) {
        self.navBarForPicker(self, self.navItem);
    }
    else {
        self.navItem.rightBarButtonItem = self.doneButton;
    }
}

@end
