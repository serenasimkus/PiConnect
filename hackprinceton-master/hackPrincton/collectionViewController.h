//
//  collectionViewController.h
//  hackPrincton
//
//  Created by Robert mannuzza on 11/8/13.
//  Copyright (c) 2013 Robert mannuzza. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface collectionViewController : UICollectionViewController {
    NSInputStream *inputStream;
    NSOutputStream *outputStream;
    NSArray *values;

}
//@property (strong,nonatomic) NSInputStream *inputStream;
//@property (strong,nonatomic) NSOutputStream *outputStream;
//- (IBAction)displaySecondVC:(id)sender;
//- (void)initNetworkCommunication;
@end
