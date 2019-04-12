//
//  ViewController_1.m
//  DesignPatternsArchitectures
//


#import "ViewController_1.h"
#import "MyApp_1.h"
#import "MyAppView_1.h"

@interface ViewController_1 ()<MyAppViewDelegate>

@end

@implementation ViewController_1

- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建view
    MyAppView_1 *appView = [[MyAppView_1 alloc] init];
    appView.frame = CGRectMake(100, 100, 100, 150);
    appView.delegate = self;
    [self.view addSubview:appView];
    
    // 加载模型数据
    MyApp_1 *app = [[MyApp_1 alloc] init];
    app.name = @"QQ";
    app.image = @"QQ.jpg";
    
    // 设置数据到view上
    appView.app = app;
}

#pragma mark - MyAppViewDelegate
- (void)appViewDidClick:(MyAppView_1 *)appView{
    NSLog(@"控制器监听到了appView的点击");
}
@end
