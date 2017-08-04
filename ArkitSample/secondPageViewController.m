//
//  secondPageViewController.m
//  ArkitSample
//
//  Created by omar arenas landgrave on 8/1/17.
//  Copyright © 2017 omar arenas landgrave. All rights reserved.
//

#import "secondPageViewController.h"
#import <ARKit/ARKit.h>

@interface secondPageViewController () {
    
    ARSCNView *arkitview;
    
}

@end

@implementation secondPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    arkitview= [[ARSCNView  alloc] init];
    [arkitview setTranslatesAutoresizingMaskIntoConstraints:NO];
    [self.view addSubview:arkitview];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[arkitView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:@{@"arkitView":arkitview}]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[arkitView]|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:@{@"arkitView":arkitview}]];
    
    SCNBox* box = [[SCNBox alloc] init];
    [box setWidth:1.0];
    [box setHeight:1.0];
    [box setLength:1.0];
    
    SCNNode *nodeToAdd = [[SCNNode alloc] init];
    [nodeToAdd setGeometry:box];
    [nodeToAdd setPosition:SCNVector3Make(0.0, 0.0, -4.0)];
    
    CALayer *layer= [[CALayer alloc] init];
    layer.frame = CGRectMake(0.0, 0.0, 20.0, 20.0);
    [layer setBackgroundColor:[[UIColor greenColor] CGColor]];
    [[box.firstMaterial diffuse] setContents:layer];
    
    
    SCNScene *scene=[[SCNScene alloc] init];
    [scene.rootNode addChildNode:nodeToAdd];
    
    arkitview.scene = scene;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadView {
    
    self.view=[[UIView alloc] initWithFrame: [UIScreen mainScreen].bounds];
    self.view.backgroundColor=[UIColor blueColor];
    self.tabBarItem.title = @"Obj-C";
    
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    ARWorldTrackingSessionConfiguration *conf = [[ARWorldTrackingSessionConfiguration alloc] init];
    [arkitview.session runWithConfiguration:conf];
}

-(void) viewWillDisappear:(BOOL)animated{
    
    [super viewWillDisappear:animated];
    [arkitview.session pause];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
