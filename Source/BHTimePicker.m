//
//  BHTimePicker.m
//  SunSmart
//
//  Created by Ashemah Harrison on 1/14/13.
//
//

#import "BHTimePicker.h"

@implementation BHTimePicker

+ (id)pickerWithParentView:(UIView*)parentView {
    return [[BHTimePicker alloc] initWithParentView:parentView];
}

- (void)internalSetupPicker {
    
    // Add the picker
    self.timePicker         = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, kNavBarHeight, self.timePicker.frame.size.width, self.timePicker.frame.size.height)];
    [self addSubview:self.timePicker];
}

@end
