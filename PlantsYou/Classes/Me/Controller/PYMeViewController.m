//
//  PYMeViewController.m
//  PlantsYou
//
//  Created by Mr.C on 16/7/28.
//  Copyright © 2016年 Mr.C. All rights reserved.
//

#import "PYMeViewController.h"
#import "PYMyViewController.h"

@interface PYMeViewController ()
@property (weak, nonatomic) IBOutlet UITableViewCell *myFavoriteArticleCell;
@property (weak, nonatomic) IBOutlet UITableViewCell *myFavoritePlantsCell;
//@property (weak, nonatomic) PYMyViewController *myFavoriteVC;

@end

static NSString * const meCell = @"meCell";
@implementation PYMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"我";
    
    _myFavoriteArticleCell.imageView.image = [UIImage imageNamed:@"me-favorite-article"];
    _myFavoriteArticleCell.textLabel.text = @"我收藏的文章";
    _myFavoriteArticleCell.separatorInset = UIEdgeInsetsZero;
    _myFavoriteArticleCell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me-favorite-accessory"]];
    
    _myFavoritePlantsCell.imageView.image = [UIImage imageNamed:@"me-favorite-plant"];
    _myFavoritePlantsCell.textLabel.text = @"我收藏的植物";
    _myFavoritePlantsCell.separatorInset = UIEdgeInsetsZero;
    _myFavoritePlantsCell.accessoryView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"me-favorite-accessory"]];
    
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PYMyViewController *myFavoriteVC = [[PYMyViewController alloc] init];
    if (indexPath.row == 0) {
        myFavoriteVC.title = @"收藏的文章";
//        [self.navigationController pushViewController:_myFavoriteVC animated:YES];
    } else {
        myFavoriteVC.title = @"收藏的植物";
    }
    [self.navigationController pushViewController:myFavoriteVC animated:YES];
}






@end
