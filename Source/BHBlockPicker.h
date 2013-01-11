//
//  BHBlockPicker.h
//  BeatTheQ
//
//  Created by Ashemah Harrison on 12/5/12.
//
//

#import <UIKit/UIKit.h>

@class BHBlockPicker;

typedef void (^PickerDidSelectRowInComponent)(BHBlockPicker *picker, NSInteger row, NSInteger component);
typedef void (^PickerDoneTapped)(BHBlockPicker *picker);
typedef NSArray* (^PickerGetComponentArray)(BHBlockPicker *picker);
typedef void (^PickerSetupNavBarBlock)(BHBlockPicker *picker, UINavigationItem *navBar);
typedef NSString* (^PickerTitleForRowBlock)(BHBlockPicker *picker, NSInteger row, NSInteger component);
typedef NSInteger (^PickerNumberOfRowsInComponentBlock)(BHBlockPicker *picker, NSInteger component);
typedef NSInteger (^PickerNumberOfComponentsInPickerBlock)(BHBlockPicker *picker);

@interface BHBlockPicker : UIView<UIPickerViewDataSource, UIPickerViewDelegate> {
    CGFloat _totalH;
}

@property (nonatomic, retain) UINavigationBar *navBar;
@property (nonatomic, retain) UINavigationItem *navItem;
@property (nonatomic, retain) UIPickerView *pickerView;
@property (nonatomic, retain) UIBarButtonItem *doneButton;
@property (nonatomic, retain) NSArray *componentArray;

@property (readwrite, copy) PickerDidSelectRowInComponent didSelectRowInComponent;
@property (readwrite, copy) PickerDoneTapped doneTappedForPicker;
@property (readwrite, copy) PickerGetComponentArray componentArrayForPicker;
@property (readwrite, copy) PickerSetupNavBarBlock navBarForPicker;
@property (readwrite, copy) PickerTitleForRowBlock titleForRowInComponent;
@property (readwrite, copy) PickerNumberOfRowsInComponentBlock numberOfRowsInComponent;
@property (readwrite, copy) PickerNumberOfComponentsInPickerBlock numberOfComponentsInPicker;

+ (id)pickerWithParentView:(UIView*)parentView;
- (id)initWithParentView:(UIView*)parentView;
- (void)hidePicker;
- (void)showPicker;
- (void)refreshPicker;

@end
