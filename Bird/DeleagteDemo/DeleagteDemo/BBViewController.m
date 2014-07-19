//
//  BBViewController.m
//  DeleagteDemo
//
//  Created by Mac on 2014/7/16.
//  Copyright (c) 2014年 iOSTeam. All rights reserved.
//

#import "BBViewController.h"

@interface BBViewController ()
{
    NSMutableArray *arr;
}
@end

@implementation BBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    arr = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5", nil];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)speakTruth:(id)sender {
    BBClass1 *obj = [[BBClass1 alloc] init];
    obj.deleagte = self;
    [obj speakTruth];
}
- (IBAction)sameThreadTest:(id)sender {
    [self logTruth];
    [self logTruth2];
}
- (IBAction)differentThreadTest:(id)sender {
    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(logTruth) object:nil];
    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(logTruth2) object:nil];
    
        [thread1 setThreadPriority:1.0];
        [thread2 setThreadPriority:0.0];
    
    
    [thread1 start];
    [thread2 start];
    
    
}
- (void)logTruth{
    for (int i = 0; i < 10000 ; i++) {
        NSLog(@"鳥哥好帥");
    }
}
- (void)logTruth2{
    for (int i = 0; i < 10000 ; i++) {
        NSLog(@"真的");
    }
}
- (IBAction)threadSafeDemo:(id)sender {
    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(method1) object:nil];
    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(method2) object:nil];
    [thread1 start];
    [thread2 start];
}

- (void)method1{
    @synchronized(self){
        for (int i = 0; i < 1000; i++) {
            [arr addObject:@"9"];
        }
        NSLog(@"%@",arr);
    }
}
- (void)method2{
    @synchronized(self){
        for (int i = 0; i < 1000; i++) {
            [arr removeLastObject];
        }
        NSLog(@"method2 \n%@",arr);
    }
}



- (void)thread1Method{
    for (int i = 0; i < 1000; i++) {
        [arr replaceObjectAtIndex:0 withObject:@"a"];
    }
}
- (void)thread2Method{
    [arr replaceObjectAtIndex:0 withObject:@"z"];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"goview2"]) {
        BBView2ViewController *vc = (BBView2ViewController*)segue.destinationViewController;
        vc.delegate = self;
    }
}

#pragma mark - protocol<BBClass1Protocol> callback
- (void)whenSpeakTruthDone{
    NSLog(@"實話說完了...");
}
#pragma mark - view2 delegate
- (void)whenView2Dead{
    NSLog(@"Back from View2");
}
@end
