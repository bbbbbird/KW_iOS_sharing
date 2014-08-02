//
//  BBFamilyStickerViewController.m
//  UUCard_BirdSupport
//
//  Created by Bird on 2014/7/28.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBFamilyStickerViewController.h"
#import "FamilyCollectionCell.h"
#import "BBFakeAlertView.h"
@interface BBFamilyStickerViewController ()
{
    NSArray *cellIDs;
    __weak IBOutlet UICollectionView *m_collectionView;
    __weak IBOutlet UIImageView *bgImageView;
}
@end

@implementation BBFamilyStickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(uperBtnClicked) name:@"uperBtnClicked" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lowerBtnClicked) name:@"lowerBtnClicked" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(whenURLClicked) name:@"URL_TAPED" object:nil];
    
    //設定背景圖
    if (bgImageView && _bgImage) {
        [bgImageView setImage:_bgImage];
    }
    
    //依據物件，建立cell id array
    NSString *finalPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingPathComponent:@"FamilyCell_List.plist"];
    NSDictionary *cellDic = [NSDictionary dictionaryWithContentsOfFile:finalPath];
    
    if (_dataObject.isPointAccord) {//符合貼紙條件
        cellIDs = [cellDic objectForKey:@"stickerViewType0"];
    }else{
        cellIDs = [cellDic objectForKey:@"stickerViewType1"];
    }
    
    [m_collectionView reloadData];
    [self test];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"uperBtnClicked" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"lowerBtnClicked" object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"URL_TAPED" object:nil];
}
- (BOOL)prefersStatusBarHidden{
    return YES;
}
#pragma mark - button actions
- (void)uperBtnClicked{
    NSLog(@"uper button clicked");
}
- (void)lowerBtnClicked{
    NSLog(@"lower button clicked");
    BBFakeAlertView *alert = [[BBFakeAlertView alloc] initWithNibName:@"GiveStickerDialog"];
    [self.view addSubview:alert];
    [alert show];
}
- (void)whenURLClicked{
    NSLog(@"url button clicked");
}
#pragma mark - collection view
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [cellIDs count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellID = [cellIDs objectAtIndex:indexPath.row];
    FamilyCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellID forIndexPath:indexPath];
    [cell setDataFromIdentifer:cellID andData:_dataObject];
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = [cellIDs objectAtIndex:indexPath.row];
    CGSize cellSize = [FamilyCollectionCell getCellSizeFromIdentifer:cellID andData:_dataObject];
    return cellSize;
}
- (void)test{
    [self performSelector:@selector(test) withObject:nil afterDelay:0.5];
    _dataObject.pointQrt = (arc4random() % 30) + 1;
    [m_collectionView reloadData];
}
@end
