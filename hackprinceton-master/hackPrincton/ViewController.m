//
//  ViewController.m
//  hackPrincton
//
//  Created by Robert mannuzza on 11/8/13.
//  Copyright (c) 2013 Robert mannuzza. All rights reserved.
//

#import "ViewController.h"
#import "colorCell.h"
#import "UIImage-JTColor.h"
#import "collectionViewController.h"
#import "switcherCell.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize imagecolor,tableView,jsondata;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initNetworkCommunication];
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(connectmsg:) name:@"getArray" object:nil];
    //[self connectmsg:Nil];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
}
-(IBAction)connectmsg:(id)sender{
    NSLog(@"is connecting");
    [self sendMessage:@"connect"];
}
-(IBAction)doneButtonPressed:(id)sender {
    [self sendMessage:@"exit"];
    [self.tableView reloadData];
    
}
-(IBAction)disconnect:(id)sender{
   [self dismissViewControllerAnimated:YES completion:nil];
    [outputStream close];
    [inputStream close];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.jsondata count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *celliden;
    /*NSLog([[jsondata objectAtIndex:indexPath.row] isEqual:@"(colors)"] ? @"Yes" : @"No");
    NSLog(@"%@",[jsondata objectAtIndex:indexPath.row]);
    NSString *first=[jsondata objectAtIndex:indexPath.row];
    NSLog(@"string: %@",first);
    if ([first isEqual:@"(colors)"]){
        celliden=@"colorCell";
        NSString *CellIdentifier = [NSString stringWithString:celliden];
        colorCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        UIColor *rgbColor = [UIColor colorWithRed:cell.red.value/255 green:cell.green.value/255 blue:cell.blue.value/255 alpha:1];
        UIImage *rgbImage = [UIImage imageWithColor:rgbColor];
        cell.color.image=rgbImage;
        return cell;
    }else {
        celliden=@"switchCell";
        NSString *CellIdentifier = [NSString stringWithString:celliden];
        switcherCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        return cell;

    }*/
    celliden=@"Cell";
    NSString *CellIdentifier = [NSString stringWithString:celliden];
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    NSString *first=[jsondata objectAtIndex:indexPath.row];
    NSLog(@"%@",first);
    cell.textLabel.text=[NSString stringWithString:first];
    return cell;
}

- (IBAction)sliderDidChange:(id)sender{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    colorCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    formatter.roundingIncrement = [NSNumber numberWithDouble:0.01];
    NSString *redString =[formatter stringFromNumber:[NSNumber numberWithFloat:cell.red.value]];
    float red =[redString floatValue];
    red=red/255;
    NSString *blueString =[formatter stringFromNumber:[NSNumber numberWithFloat:cell.blue.value]];
    float blue =[blueString floatValue];
    blue=blue/255;
    NSString *greenString =[formatter stringFromNumber:[NSNumber numberWithFloat:cell.green.value]];
    float green =[greenString floatValue];
    green=green/255;
    
    NSLog(@"red: %f green: %f blue: %f",red,green,blue);
    UIColor *rgbColor = [UIColor colorWithRed:red green:green blue:blue alpha:.9];
    UIImage *rgbImage = [UIImage imageWithColor:rgbColor];
    cell.color.image=rgbImage;
}
-(IBAction)switchChanged:(id)sender{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    //figure out what cell it is
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
    [self sendMessage:cell.textLabel.text];
    //[[raspiconnection alloc] sendMessage:cell.textLabel.text];
    
}
/*-(void)updateArray:(NSNotification *)notification{
    jsondata=[NSMutableArray arrayWithArray:notification.object];
    [self.tableView reloadData];
}*/


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

 */

- (void)stream:(NSStream *)theStream handleEvent:(NSStreamEvent)streamEvent {
	switch (streamEvent) {
            
		case NSStreamEventOpenCompleted:
			NSLog(@"Stream opened");
			break;
            
		case NSStreamEventHasBytesAvailable:
            NSLog(@"bytesAvailable");
            if (theStream == inputStream) {
                
                uint8_t buffer[1024];
                int len;
                
                while ([inputStream hasBytesAvailable]) {
                    
                    len = [inputStream read:buffer maxLength:sizeof(buffer)];
                    if (len > 0) {
                        
                        NSString *output = [[NSString alloc] initWithBytes:buffer length:len encoding:NSASCIIStringEncoding];
                        [self messageReceived:output];
                        NSLog(@"Json String: %@",output);
                        if (nil != output) {
                            NSLog(@"server said: %@", output);
                            
                            
                        }
                    }
                }
            }
            
            break;
            
            
		case NSStreamEventErrorOccurred:
            NSLog(@"Can not connect to the host!");
			break;
            
		case NSStreamEventEndEncountered:
            NSLog(@"event end encountered");
			break;
            
		default:
            NSLog(@"Unknown event");
            break;
	}
    
}

- (void)initNetworkCommunication {
    
    CFReadStreamRef readStream;
    CFWriteStreamRef writeStream;
    CFStreamCreatePairWithSocketToHost(NULL, (CFStringRef)@"192.168.2.2", 9898 , &readStream, &writeStream);
    inputStream = (NSInputStream *)CFBridgingRelease(readStream);
    outputStream = (NSOutputStream *)CFBridgingRelease(writeStream);
    
    [inputStream setDelegate:self];
    [outputStream setDelegate:self];
    
    [inputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    [outputStream scheduleInRunLoop:[NSRunLoop currentRunLoop] forMode:NSDefaultRunLoopMode];
    
    [inputStream open];
    [outputStream open];
    
}

- (void)sendMessage:(NSString *)msg {
    //[self initNetworkCommunication];
    NSString *response  = [NSString stringWithFormat:@"%@%@",msg,@""];
    NSLog(@"response: %@",response);
	NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
	[outputStream write:[data bytes] maxLength:[data length]];
    
}
- (void) messageReceived:(NSString *)message {
    NSLog(@"message reveived");
    NSString *strippedNumber = [message stringByReplacingOccurrencesOfString:@"[" withString:@""];
    
    NSString * strippedNumber2 = [strippedNumber stringByReplacingOccurrencesOfString:@"]" withString:@""];
    
    NSString * strippedNumber3 = [strippedNumber2 stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
    NSString * strippedNumber4 = [strippedNumber3 stringByReplacingOccurrencesOfString:@" " withString:@""];
    
    NSArray *array = [strippedNumber4 componentsSeparatedByString:@","];
    NSLog(@"Output Array: %@",array);
    jsondata=[NSMutableArray arrayWithArray:array];
    NSLog(@"jsondata Array: %@",array);
    [self.tableView reloadData];
    
    
}

-(void)sendback{
    NSString *response  = @"exit\n";
    NSData *data = [[NSData alloc] initWithData:[response dataUsingEncoding:NSASCIIStringEncoding]];
    [outputStream write:[data bytes] maxLength:[data length]];
    
    NSString *res = [NSString stringWithUTF8String:[data bytes]];
    NSLog(@"Data: %@",res);
}

@end
