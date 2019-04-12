//
//  MyAppView_3.m
//  DesignPatternsArchitectures
//


#import "MyAppView_3.h"
#import <NSObject+FBKVOController.h>
#import  <ReactiveObjC.h>
#import "MyAppViewModel.h"

@interface MyAppView_3()
@property (weak, nonatomic) UIImageView *iconView;
@property (weak, nonatomic) UILabel *nameLabel;
@end

@implementation MyAppView_3
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        UIImageView *iconView = [[UIImageView alloc] init];
        iconView.frame = CGRectMake(0, 0, 100, 100);
        [self addSubview:iconView];
        _iconView = iconView;
        
        UILabel *nameLabel = [[UILabel alloc] init];
        nameLabel.frame = CGRectMake(0, 100, 100, 30);
        nameLabel.textAlignment = NSTextAlignmentCenter;
        [self addSubview:nameLabel];
        _nameLabel = nameLabel;
    }
    return self;
}

- (void)setViewModel:(MyAppViewModel *)viewModel{
    _viewModel = viewModel;
    __weak typeof(self) waekSelf = self;
    
    /*
    [self.KVOController observe:viewModel keyPath:@"name" options:NSKeyValueObservingOptionNew block:^(id _Nullable observer, id _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        waekSelf.nameLabel.text = change[NSKeyValueChangeNewKey];
    }];
    
    [self.KVOController observe:viewModel keyPath:@"image" options:NSKeyValueObservingOptionNew block:^(id _Nullable observer, id _Nonnull object, NSDictionary<NSKeyValueChangeKey,id> * _Nonnull change) {
        waekSelf.iconView.image = [UIImage imageNamed:change[NSKeyValueChangeNewKey]];
   }];
     */
    
    //RAC
    [[self.viewModel rac_valuesForKeyPath:@"name" observer:self] subscribeNext:^(id x) {
        waekSelf.nameLabel.text = x;
    }];
    
    [[self.viewModel rac_valuesForKeyPath:@"image"observer:self] subscribeNext:^(id x) {
         waekSelf.iconView.image = [UIImage imageNamed:x];
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if ([self.delegate respondsToSelector:@selector(appViewDidClick:)]) {
        [self.delegate appViewDidClick:self];
    }
}

@end
