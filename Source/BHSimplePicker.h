//
//  BHBlockPickerView.h
//  SunSmart
//
//  Created by Ashemah Harrison on 1/14/13.
//
//

#define kPickerHeight 216
#define kNavBarHeight 44

#import <UIKit/UIKit.h>

@class BHSimplePicker;

typedef void (^PickerDoneTapped)(BHSimplePicker *picker);
typedef void (^PickerSetupNavBarBlock)(BHSimplePicker *picker, UINavigationItem *navBar);

@interface BHSimplePicker : UIView {
    CGFloat _totalH;
}

@property (nonatomic, retain) UINavigationBar *navBar;
@property (nonatomic, retain) UINavigationItem *navItem;
@property (nonatomic, retain) UIBarButtonItem *doneButton;

@property (readwrite, copy) PickerDoneTapped doneTappedForPicker;
@property (readwrite, copy) PickerSetupNavBarBlock navBarForPicker;

+ (id)pickerWithParentView:(UIView*)parentView;
- (id)initWithParentView:(UIView*)parentView;
- (void)hidePicker;
- (void)showPicker;
- (void)refreshPicker;

- (void)internalSetupPicker;
- (void)internalDoneTapped;

@end
