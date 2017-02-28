//
//  VisiterViewController.m
//  funpaw
//
//  Created by czx on 2017/2/27.
//  Copyright © 2017年 yulei. All rights reserved.
//

#import "VisiterViewController.h"
#import "ShareWork+Visiters.h"
#import "DouyiDouTableViewCell.h"
#import "VisiterModel.h"
static NSString * cellId = @"douyidouCellid";
@interface VisiterViewController ()

@end

@implementation VisiterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"逗一逗"];

}
-(void)setupView{
    [super setupView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tableView.superview);
        make.right.equalTo(self.tableView.superview);
        make.top.equalTo(self.view);
        make.bottom.equalTo(self.tableView.superview);
        
    }];
    self.tableView.backgroundColor = GRAY_COLOR;
    [self.tableView registerClass:[DouyiDouTableViewCell class] forCellReuseIdentifier:cellId];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
      [self initRefreshView];
}

-(void)loadDataSourceWithPage:(int)page{
    [[ShareWork sharedManager]icanvisitWithMid:[AccountManager sharedAccountManager].loginModel.mid page:page size:REQUEST_PAGE_SIZE complete:^(BaseModel *model) {
        if (page == START_PAGE_INDEX) {
            [self.dataSource removeAllObjects];
            [self.dataSource addObjectsFromArray:model.list];
        } else {
            [self.dataSource addObjectsFromArray:model.list];
        }
        
        if (model.list.count < REQUEST_PAGE_SIZE){
            self.tableView.mj_footer.hidden = YES;
        }else{
            self.tableView.mj_footer.hidden = NO;
        }
        
        [self.tableView reloadData];
        [self handleEndRefresh];
        
    }];
    





}
#pragma mark - TableView的代理函数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataSource.count;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 65;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DouyiDouTableViewCell * cell =  [tableView dequeueReusableCellWithIdentifier:cellId];
    VisiterModel * model = self.dataSource[indexPath.row];
    if (indexPath.row == 0) {
        cell.lineLabel.hidden = YES;
    }
    
//    
    [cell.headImage sd_setImageWithURL:[NSURL URLWithString:model.headportrait] placeholderImage:[UIImage imageNamed:@""]];
    cell.nameLabel.text = model.nickname;
    
    cell.rightBtn.tag = indexPath.row + 111;
    [cell.rightBtn addTarget:self action:@selector(rightButtontouch1:) forControlEvents:UIControlEventTouchUpInside];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    tableView.separatorStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void)rightButtontouch1:(UIButton *)sender{
    


}




@end