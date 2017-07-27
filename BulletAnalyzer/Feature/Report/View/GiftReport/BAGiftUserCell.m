//
//  BAGiftUserCell.m
//  BulletAnalyzer
//
//  Created by 张骏 on 17/7/24.
//  Copyright © 2017年 Zj. All rights reserved.
//

#import "BAGiftUserCell.h"
#import "BAUserModel.h"

@interface BAGiftUserCell()
@property (nonatomic, strong) UIImageView *userIcon;
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *levelLabel;
@property (nonatomic, strong) UILabel *infoLabel;
@property (nonatomic, strong) UIView *line;

@end

@implementation BAGiftUserCell

#pragma mark - lifeCycle
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = BAWhiteColor;
        
        [self setupSubViews];
    }
    return self;
}


#pragma mark - public
- (void)setUserModel:(BAUserModel *)userModel{
    
    _userModel = userModel;
    
    _nameLabel.text = userModel.nn;
    _levelLabel.text = userModel.level.length ? [NSString stringWithFormat:@"level %@", userModel.level] : @"";
    [_userIcon sd_setImageWithURL:[NSURL URLWithString:userModel.iconBig] placeholderImage:BAPlaceHolderImg];
    
    if (self.isActiveCell) {
        _infoLabel.text = [NSString stringWithFormat:@"%@次发言", userModel.count];
    } else {
        _infoLabel.text = [NSString stringWithFormat:@"%@个礼物", userModel.giftCount];
    }
}


#pragma mark - private
- (void)setupSubViews{
    CGFloat height = (BAScreenHeight * 0.3 + 1 - 1.5 * BAPadding) / 3;
    
    CGFloat iconHeight = height - 2 * BAPadding;
    _userIcon = [[UIImageView alloc] initWithFrame:CGRectMake(2 * BAPadding, BAPadding, iconHeight, iconHeight)];
    _userIcon.layer.cornerRadius = iconHeight / 2;
    _userIcon.clipsToBounds = YES;
    
    [self addSubview:_userIcon];
    
    _infoLabel = [UILabel labelWithFrame:CGRectMake(BAScreenWidth - 2 * BAPadding - 100, height / 2 - 10, 100, 20) text:nil color:BALightTextColor font:BACommonFont(BACommonTextFontSize) textAlignment:NSTextAlignmentRight];
    
    [self addSubview:_infoLabel];
    
    _nameLabel = [UILabel labelWithFrame:CGRectMake(_userIcon.right + BAPadding, height / 2 - 20, _infoLabel.x - _userIcon.right - 2 * BAPadding, 20) text:nil color:BALightTextColor font:BACommonFont(BACommonTextFontSize) textAlignment:NSTextAlignmentLeft];
    
    [self addSubview:_nameLabel];
    
    _levelLabel = [UILabel labelWithFrame:CGRectMake(_userIcon.right + BAPadding, height / 2, _infoLabel.x - _userIcon.right - 2 * BAPadding, 20) text:nil color:BALightTextColor font:BACommonFont(BACommonTextFontSize) textAlignment:NSTextAlignmentLeft];
    
    [self addSubview:_levelLabel];

    _line = [[UIView alloc] initWithFrame:CGRectMake(BAPadding * 2, height - 1, BAScreenWidth - 4 * BAPadding, 1)];
    _line.backgroundColor = BASpratorColor;
    
    [self addSubview:_line];
}


@end
