//
//  MyAppView_3.h
//  DesignPatternsArchitectures
//


#import <UIKit/UIKit.h>

@class MyAppView_3, MyAppViewModel;

@protocol MyAppViewDelegate <NSObject>
@optional
- (void)appViewDidClick:(MyAppView_3 *)appView;
@end

@interface MyAppView_3 : UIView
@property (weak, nonatomic) MyAppViewModel *viewModel;
@property (weak, nonatomic) id<MyAppViewDelegate> delegate;
@end

