//
//  ViewController.h
//  hackPrincton
//
//  Created by Robert mannuzza on 11/8/13.
//  Copyright (c) 2013 Robert mannuzza. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    NSInputStream *inputStream;
    NSOutputStream *outputStream;

}

-(IBAction)doneButtonPressed:(id)sender;
-(IBAction)sliderDidChange:(id)sender;
-(IBAction)switchChanged:(id)sender;
-(IBAction)disconnect:(id)sender;
@property (strong,nonatomic) NSMutableArray *jsondata;
@property (strong,nonatomic) UIColor *imagecolor;
@property (strong,nonatomic) IBOutlet UITableView *tableView;
@end
