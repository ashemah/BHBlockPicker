//
//  BHBlockPicker.h
//  BeatTheQ
//
//  Created by Ashemah Harrison on 12/5/12.
//
//

#import <UIKit/UIKit.h>
#import "BHSimplePicker.h"

@class BHItemPicker;

typedef void (^PickerDidSelectRowInComponent)(BHItemPicker *picker, NSInteger row, NSInteger component);
typedef NSArray* (^PickerGetComponentArray)(BHItemPicker *picker);
typedef NSString* (^PickerTitleForRowBlock)(BHItemPicker *picker, NSInteger row, NSInteger component);
typedef NSInteger (^PickerNumberOfRowsInComponentBlock)(BHItemPicker *picker, NSInteger component);
typedef NSInteger (^PickerNumberOfComponentsInPickerBlock)(BHItemPicker *picker);

@interface BHItemPicker : BHSimplePicker<UIPickerViewDataSource, UIPickerViewDelegate> {
}

@property (nonatomic, retain) UIPickerView *pickerView;

@property (readwrite, copy) PickerDidSelectRowInComponent didSelectRowInComponent;
@property (readwrite, copy) PickerGetComponentArray componentArrayForPicker;
@property (readwrite, copy) PickerTitleForRowBlock titleForRowInComponent;
@property (readwrite, copy) PickerNumberOfRowsInComponentBlock numberOfRowsInComponent;
@property (readwrite, copy) PickerNumberOfComponentsInPickerBlock numberOfComponentsInPicker;

@property (nonatomic, retain) NSArray *componentArray;

+ (id)pickerWithParentView:(UIView*)parentView;
- (id)initWithParentView:(UIView*)parentView;
- (void)hidePicker;
- (void)showPicker;
- (void)refreshPicker;

@end
