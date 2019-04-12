//
//  ViewController_3.m
//  DesignPatternsArchitectures
//


#import "ViewController_3.h"
#import "MyAppViewModel.h"

@interface ViewController_3 ()
@property (strong, nonatomic) MyAppViewModel *viewModel;
@end

@implementation ViewController_3
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.viewModel = [[MyAppViewModel alloc] initWithController:self];
}
@end
