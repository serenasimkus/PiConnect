//
//  collectionViewController.m
//  hackPrincton
//
//  Created by Robert mannuzza on 11/8/13.
//  Copyright (c) 2013 Robert mannuzza. All rights reserved.
//

#import "collectionViewController.h"
#import "TransitionDelegate.h"
#import "ViewController.h"

@interface collectionViewController ()
@property (nonatomic, strong) TransitionDelegate *transitionController;

@end

@implementation collectionViewController


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
	// Do any additional setup after loading the view.
    //self.transitionController = [[TransitionDelegate alloc] init];
    //[[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(updateArray:) name:@"getArray" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*-(void)updateArray:(NSNotification *)notification{
    values=[NSArray arrayWithArray:notification.object];
    NSLog(@"values updated");
}*/

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 1;
}
/*- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
 {
 
 }*/

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    CALayer *layer = cell.layer;
    [layer setCornerRadius:4];
    [layer setRasterizationScale:[[UIScreen mainScreen] scale]];
    [layer setShouldRasterize:YES];
    return cell;
}
/*- (IBAction)displaySecondVC:(id)sender {
 UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
 UIViewController *vc = [storyboard instantiateViewControllerWithIdentifier:@"ColorView"];
 vc.view.backgroundColor = [UIColor colorWithWhite:.7 alpha:.9];
 [vc setTransitioningDelegate:_transitionController];
 vc.modalPresentationStyle= UIModalPresentationCustom;
 [self presentViewController:vc animated:YES completion:nil];
 }*/

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //raspiconnection *r = [[raspiconnection alloc] init];
    //[r sendMessage:@"connect"];
    NSLog(@"does this work");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"getArray" object:Nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
}






                            



@end
