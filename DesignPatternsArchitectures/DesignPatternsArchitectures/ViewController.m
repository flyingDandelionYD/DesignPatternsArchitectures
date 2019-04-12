//
//  ViewController.m
//  DesignPatternsArchitectures
//


#import "ViewController.h"

static NSString *const idF = @"ViewController";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView  *baseV;
@property (nonatomic,strong)NSArray  *sourcesArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设计模式和架构";
    [self setUpUI];
}

-(NSArray*)sourcesArr{
    if(_sourcesArr==nil){
        _sourcesArr = @[
                        @"MVC – 变种",
                        @"MVP",
                        @"MVVM"
                        ];
    }
    return _sourcesArr;
}

-(void)setUpUI{
    self.baseV = [[UITableView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:self.baseV];
    self.baseV.delegate =self;
    self.baseV.dataSource = self;
    [self.baseV registerClass:[UITableViewCell class] forCellReuseIdentifier:idF];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.sourcesArr.count;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell  =  [tableView dequeueReusableCellWithIdentifier:idF forIndexPath:indexPath];
    if(cell==nil){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:idF];
    }
    cell.textLabel.text = self.sourcesArr[indexPath.row];
    return  cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    Class cla = NSClassFromString([NSString stringWithFormat:@"ViewController_%ld",indexPath.row+1]);
    UIViewController  *vc = (UIViewController *)[cla new];
    vc.title = self.sourcesArr[indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
    
}
@end

