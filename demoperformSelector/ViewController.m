//
//  ViewController.m
//  demoperformSelector
//
//  Created by AragonUit on 1/19/16.
//  Copyright © 2016 AragonUit. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)ClickBtnCrunchData:(id)sender {
//    [self performSelectorInBackground:@selector(doCrunchData) withObject:nil];
    // chay do crundata trong background nen main thread ko bi block=> tuong tac duoc voi giao dien
    [self performSelectorOnMainThread:@selector(doCrunchData) withObject:nil waitUntilDone:false];
    //chay tren main thread nen trong 2 giay nhung tuong tac tren giao dien ko the thuc hien duoc
    [self performSelectorOnMainThread:@selector(processData:) withObject:@{@"apple": @"táo", @"lemon": @"chanh"} waitUntilDone: true];
}
-(void)doCrunchData
{
    [NSThread sleepForTimeInterval:2];
}
- (void) processData: (NSDictionary*) data {
    for (NSString* key in [data allKeys]) {
        NSLog(@"%@ - %@", key, [data valueForKey:key]);
}
}
- (void) hideSlider {
    self.slider.hidden = true;
}
@end
