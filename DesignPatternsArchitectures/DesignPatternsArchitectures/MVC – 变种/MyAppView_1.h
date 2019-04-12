//
//  MyAppView_1.h
//  DesignPatternsArchitectures
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class MyApp_1, MyAppView_1;
@protocol MyAppViewDelegate <NSObject>
@optional
- (void)appViewDidClick:(MyAppView_1 *)appView;
@end

@interface MyAppView_1 : UIView
@property (strong, nonatomic) MyApp_1 *app;
@property (weak, nonatomic) id<MyAppViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
