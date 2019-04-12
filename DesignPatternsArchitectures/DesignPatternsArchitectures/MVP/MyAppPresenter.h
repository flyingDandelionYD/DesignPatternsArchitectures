//
//  MyAppPresenter.h
//  DesignPatternsArchitectures
//


#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN
@class MyApp_2, MyAppView_2;

@interface MyAppPresenter : NSObject
@property (strong, nonatomic) MyApp_2 *app;
- (instancetype)initWithController:(UIViewController *)controller;
@end

NS_ASSUME_NONNULL_END
