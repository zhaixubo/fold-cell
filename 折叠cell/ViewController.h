//
//  ViewController.h
//  折叠cell
//
//  Created by 翟旭博 on 2022/8/29.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *array;

@end

