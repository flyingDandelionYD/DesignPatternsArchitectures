//
//  MyAppPresenter.m
//  DesignPatternsArchitectures
//


#import "MyAppPresenter.h"
#import "MyApp_2.h"
#import "MyAppView_2.h"

@interface MyAppPresenter() <MyAppViewDelegate>
@property (weak, nonatomic) UIViewController *controller;
@end

@implementation MyAppPresenter
- (instancetype)initWithController:(UIViewController *)controller{
if (self = [super init]) {
    self.controller = controller;
    
    // 创建View
    MyAppView_2 *appView = [[MyAppView_2 alloc] init];
    appView.frame = CGRectMake(100, 100, 100, 150);
    appView.delegate = self;
    [controller.view addSubview:appView];
    
    // 加载模型数据
    MyApp_2 *app = [[MyApp_2 alloc] init];
    app.name = @"QQ";
    app.image = @"QQ.jpg";
    
    // 赋值数据
    [appView setName:app.name andImage:app.image];
}
    return self;
}

#pragma mark - MyAppViewDelegate
- (void)appViewDidClick:(MyAppView_2 *)appView{
    NSLog(@"presenter 监听了 appView 的点击");
}
@end
