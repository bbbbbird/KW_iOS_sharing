//
//  BBDataCell.m
//  BirdDemo_onCLass
//
//  Created by Mac on 2014/8/2.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBDataCell.h"
@interface BBDataCell ()
{
    __weak IBOutlet UIImageView *m_imageView;
    __weak IBOutlet UILabel *titleLabel;
    __weak IBOutlet UILabel *contentLabel;
}
@end
@implementation BBDataCell
- (void)setData:(BBCellDataObject*)data{
    [titleLabel setText:data.title];
    [contentLabel setText:data.content];
    
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:data.imgURL]];
    [m_imageView setImage:[UIImage imageWithData:imgData]];
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
