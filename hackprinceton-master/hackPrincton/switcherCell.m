//
//  switcherCell.m
//  hackPrincton
//
//  Created by Robert mannuzza on 11/9/13.
//  Copyright (c) 2013 Robert mannuzza. All rights reserved.
//

#import "switcherCell.h"

@implementation switcherCell
@synthesize switcher;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
