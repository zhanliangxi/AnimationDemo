//
//  ViewController.m
//  AnimationDemo
//
//  Created by apple on 16/2/24.
//  Copyright © 2016年 LXJenn. All rights reserved.
//

#import "ViewController.h"
#import "MJExtension.h"
#import "ClassName.h"
#import "Students.h"
#import "CustomHeaderView.h"

@interface ViewController ()
<
    UITableViewDataSource,
    UITableViewDelegate,
    CustomHeaderViewDelegate
>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *datas;
@property (strong, nonatomic) NSArray *dataList;
@end

@implementation ViewController

- (NSArray *)datas{
    if (_datas == nil) {
        _datas = @[@{@"className" : @"Aitna",
                             @"students"  : @[@{@"name" : @"Y.X.M.",   @"age" : @(27)},
                                              @{@"name" : @"Leif",     @"age" : @(12)},
                                              @{@"name" : @"Lennon",   @"age" : @(23)},
                                              @{@"name" : @"Lambert",  @"age" : @(19)},
                                              @{@"name" : @"Jerome",   @"age" : @(19)},
                                              @{@"name" : @"Isidore",  @"age" : @(19)}]},
                           @{@"className" : @"Melete",
                             @"students"  : @[@{@"name" : @"Merle",    @"age" : @(34)},
                                              @{@"name" : @"Paddy",    @"age" : @(31)},
                                              @{@"name" : @"Perry",    @"age" : @(10)},
                                              @{@"name" : @"Philip",   @"age" : @(39)}]},
                           @{@"className" : @"Aoede",
                             @"students"  : @[@{@"name" : @"Verne",    @"age" : @(34)},
                                              @{@"name" : @"Vincent",  @"age" : @(78)},
                                              @{@"name" : @"Walter",   @"age" : @(43)},
                                              @{@"name" : @"Zachary",  @"age" : @(21)}]},
                           @{@"className" : @"Dione",
                             @"students"  : @[@{@"name" : @"Timothy",  @"age" : @(98)},
                                              @{@"name" : @"Roderick", @"age" : @(21)},
                                              @{@"name" : @"Quentin",  @"age" : @(7)},
                                              @{@"name" : @"Paddy",    @"age" : @(67)}]},
                           @{@"className" : @"Adanos",
                             @"students"  : @[@{@"name" : @"Mortimer", @"age" : @(23)},
                                              @{@"name" : @"Michael",  @"age" : @(45)},
                                              @{@"name" : @"Kevin",    @"age" : @(89)},
                                              @{@"name" : @"Jeremy",   @"age" : @(23)}]},];
    }
    return _datas;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[CustomHeaderView class] forHeaderFooterViewReuseIdentifier:@"header"];
    
    
    self.dataList = [ClassName mj_objectArrayWithKeyValuesArray:self.datas];
    [self.dataList enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ClassName *name = self.dataList[idx];
        name.flagShow = NO;
    }];
    [self headerView:nil section:0];
   
    [self.tableView reloadData];
    

}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataList.count ;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *students = ((ClassName *)self.dataList[section]).students;
    return ((ClassName *)self.dataList[section]).flagShow ? students.count : 0;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    ClassName *className = self.dataList[indexPath.section];
    Students *students = className.students[indexPath.row];
    cell.textLabel.text = students.name;
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CustomHeaderView *headerView = [self.tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    return headerView;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    ClassName *className = self.dataList[section];
    CustomHeaderView *headerView = (CustomHeaderView *)view;
    headerView.textLabel.text = className.className;
    headerView.section = section;
    headerView.delegate = self;
}

- (void)headerView:(CustomHeaderView *)view section:(NSInteger)section{
    ClassName *className = self.dataList[section];
    NSArray *students = className.students;
    if (className.flagShow == YES) {
        className.flagShow = NO;
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (int i = 0; i < students.count; i++) {
            
            [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
        }
        [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
        
    }else{
        className.flagShow = YES;
        NSMutableArray *indexPaths = [NSMutableArray array];
        for (int i = 0; i < students.count; i++) {
            
            [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:section]];
        }
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
    }

}



@end
