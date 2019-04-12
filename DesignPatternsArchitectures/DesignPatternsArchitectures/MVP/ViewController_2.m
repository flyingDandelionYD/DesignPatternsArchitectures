//
//  ViewController_2.m
//  DesignPatternsArchitectures
//


#import "ViewController_2.h"
#import "MyAppPresenter.h"

@interface ViewController_2 ()
@property (strong, nonatomic) MyAppPresenter *presenter;
@end

@implementation ViewController_2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.presenter = [[MyAppPresenter alloc] initWithController:self];
   
}


@end
