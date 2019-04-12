//
//  MyAppViewModel.m
//  DesignPatternsArchitectures
//


#import "MyAppViewModel.h"
#import "MyApp_3.h"
#import "MyAppView_3.h"

@interface MyAppViewModel() <MyAppViewDelegate>
@property (weak, nonatomic) UIViewController *controller;
@property (copy, nonatomic) NSString *name;
@property (copy, nonatomic) NSString *image;
@end

@implementation MyAppViewModel
- (instancetype)initWithController:(UIViewController *)controller{
    if (self = [super init]) {
        self.controller = controller;
        
        // 创建View
        MyAppView_3 *appView = [[MyAppView_3 alloc] init];
        appView.frame = CGRectMake(100, 100, 100, 150);
        appView.delegate = self;
        appView.viewModel = self;
        [controller.view addSubview:appView];
        
        // 加载模型数据
        MyApp_3 *app = [[MyApp_3 alloc] init];
        app.name = @"QQ";
        app.image = @"QQ.jpg";
        
        // 设置数据
        self.name = app.name;
        self.image = app.image;
    }
    return self;
}

#pragma mark - MyAppViewDelegate
- (void)appViewDidClick:(MyAppView_3 *)appView{
    NSLog(@"viewModel 监听了 appView 的点击");
    self.name = [NSString stringWithFormat:@"数字:%ld",random()%100];
}
@end
