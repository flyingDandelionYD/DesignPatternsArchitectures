//
//  MyAppView_2.h
//  DesignPatternsArchitectures
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class MyAppView_2;
@protocol MyAppViewDelegate <NSObject>
@optional
- (void)appViewDidClick:(MyAppView_2 *)appView;
@end

@interface MyAppView_2 : UIView
- (void)setName:(NSString *)name andImage:(NSString *)image;
@property (weak, nonatomic) id<MyAppViewDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
