//
//  colorCell.h
//  hackPrincton
//
//  Created by Robert mannuzza on 11/9/13.
//  Copyright (c) 2013 Robert mannuzza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface colorCell : UITableViewCell


@property (strong,nonatomic) IBOutlet UISlider *red;
@property (strong,nonatomic) IBOutlet UISlider *green;
@property (strong,nonatomic) IBOutlet UISlider *blue;
@property (retain,nonatomic) IBOutlet UIImageView *color;



@end
