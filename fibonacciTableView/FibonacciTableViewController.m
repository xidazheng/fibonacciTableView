//
//  FibonacciTableViewController.m
//  fibonacciTableView
//
//  Created by Xida Zheng on 1/21/15.
//  Copyright (c) 2015 xidazheng. All rights reserved.
//

#import "FibonacciTableViewController.h"

@interface FibonacciTableViewController ()
@property (strong, nonatomic) NSMutableArray *fibronacciNumbers;
@property (nonatomic) BOOL maximumFibonacciNumberReached;
- (void)seedFirstTwoFibonacciNumbers;
- (void)calculateFibonacciNumbers;
- (void)calculateFibonacciNumberForIndex:(NSUInteger)index;

@end

@implementation FibonacciTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fibronacciNumbers = [[NSMutableArray alloc] init];
    self.maximumFibonacciNumberReached = NO;
    
    [self seedFirstTwoFibonacciNumbers];
    [self calculateFibonacciNumbers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Fibonacci methods
- (void)seedFirstTwoFibonacciNumbers
{
    [self.fibronacciNumbers addObject:[NSNumber numberWithUnsignedInteger:0]];
    [self.fibronacciNumbers addObject:[NSNumber numberWithUnsignedInteger:1]];
}

- (void)calculateFibonacciNumbers
{
    NSUInteger nextFibonacciIndex = [self.fibronacciNumbers count];
    
    while (!self.maximumFibonacciNumberReached) {
        [self calculateFibonacciNumberForIndex:nextFibonacciIndex];
        nextFibonacciIndex++;
    }
}

- (void)calculateFibonacciNumberForIndex:(NSUInteger)index
{
    NSUInteger currentFibonacciNumber = [self.fibronacciNumbers[index - 1] unsignedLongValue];
    NSUInteger previousFibonacciNumber = [self.fibronacciNumbers[index - 2] unsignedLongValue];
    
    if (currentFibonacciNumber + previousFibonacciNumber < currentFibonacciNumber) {
        self.maximumFibonacciNumberReached = YES;
    } else{
        self.fibronacciNumbers[index] = [NSNumber numberWithUnsignedInteger:(currentFibonacciNumber + previousFibonacciNumber)];
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.fibronacciNumbers count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"fibonacciCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.fibronacciNumbers[indexPath.row]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
