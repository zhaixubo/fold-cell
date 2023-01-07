//
//  ViewController.m
//  折叠cell
//
//  Created by 翟旭博 on 2022/8/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(100, 100, 430 - 200, 100)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.tag = 0;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"1"];
    [self.view addSubview:_tableView];
    
    _array = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4", nil];
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"1" forIndexPath:indexPath];
    cell.textLabel.text = _array[indexPath.row];
    cell.backgroundColor = [UIColor orangeColor];
    return cell;
}

//获取每组单元格的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_tableView.tag == 0) {
        return 1;
    } else {
        return 4;
    }
}

//获取单元格高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_tableView.tag == 0) {
        _tableView.frame = CGRectMake(100, 100, 430 - 200, 400);
        _tableView.tag = 1;
        [_tableView reloadData];
    } else {
        UITableViewCell *cell0 = [self.tableView cellForRowAtIndexPath:indexPath];
        NSString *str = [NSString stringWithFormat:@"%@", cell0.textLabel.text];
        
        for (int i = 0; i < 4; i++) {
            if ([_array[i] isEqualToString:str]) {
                _array[i] = _array[0];
                break;
            }
        }
        _array[0] = str;
        _tableView.frame = CGRectMake(100, 100, 430 - 200, 100);
        _tableView.tag = 0;
        [_tableView reloadData];
    }
}
@end
