//
//  BHBlockPicker.m
//  BeatTheQ
//
//  Created by Ashemah Harrison on 12/5/12.
//
//

#import "BHBlockPicker.h"

#define kPickerHeight 216
#define kNavBarHeight 44

@implementation BHBlockPicker

+ (id)pickerWithParentView:(UIView*)parentView {
    return [[BHBlockPicker alloc] initWithParentView:parentView];
}

- (void)layoutSubviews {
    // Move ourselves off the screen
    self.frame = CGRectMake(0, self.superview.frame.size.height-_totalH, self.superview.frame.size.width, _totalH);
    self.transform = CGAffineTransformMakeTranslation(0, _totalH);    
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
        
        // Add the picker
        self.pickerView         = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kNavBarHeight, self.pickerView.frame.size.width, self.pickerView.frame.size.height)];
        self.pickerView.showsSelectionIndicator = YES;
        [self addSubview:self.pickerView];
        
        self.doneButton = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(internalDoneTapped)];        
    }
    
    return self;
}

- (void)internalDoneTapped {
    
    if (self.componentArray) {
        for (int i=0; i < [self.componentArray count]; i++) {
            NSInteger row = [self.pickerView selectedRowInComponent:i];
            self.didSelectRowInComponent(self, row, i);
        }
    }
    
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
    self.pickerView.delegate    = self;
    self.pickerView.dataSource  = self;    
    [self refreshPicker];
    
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformIdentity;
    }];    
}

- (void)refreshPicker {
    
    if (self.componentArrayForPicker) {
        self.componentArray = self.componentArrayForPicker(self);
    }
    else {
        self.componentArray = nil;
    }
    
    self.navBarForPicker(self, self.navItem);
    [self.pickerView reloadAllComponents];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (self.componentArray) {
        NSArray *arr = [self.componentArray objectAtIndex:component];
        id value = [arr objectAtIndex:row];
        if ([value isKindOfClass:[NSNumber class]]) {
            return [value stringValue];
        }
        else {
            // Else return the plain value
            return value;
        }
    }
    else {
        return self.titleForRowInComponent(self, row, component);
    }
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    
    if (self.componentArray) {
        NSArray *arr = [self.componentArray objectAtIndex:component];
        return [arr count];
    }
    else {
        return self.numberOfRowsInComponent(self, component);
    }
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    
    if (self.componentArray) {
        return [self.componentArray count];
    }
    else {
        return self.numberOfComponentsInPicker(self);
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.didSelectRowInComponent(self, row, component);
}

@end
