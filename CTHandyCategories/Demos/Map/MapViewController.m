//
//  MapViewController.m
//  CTHandyCategories
//
//  Created by casa on 2018/4/9.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "MapViewController.h"
#import <MapKit/MapKit.h>
#import "MKMapView+Annotation.h"
#import <HandyFrame/UIView+LayoutMethods.h>

@interface MapViewController () <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *mapview;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) MKPointAnnotation *annotation;
@property (nonatomic, strong) MKPinAnnotationView *annotationView;
@property (nonatomic, assign) CGPoint point;

@end

@implementation MapViewController

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.mapview];
    [self.mapview addAnnotation:self.annotation];
    [self.view addSubview:self.lineView];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    [self.mapview fill];
    
    self.point = CGPointMake(self.mapview.ct_centerX, self.mapview.ct_height/4.0f);
    self.lineView.ct_height = 2.0f;
    [self.lineView fillWidth];
    self.lineView.ct_centerY = self.point.y;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.mapview showAnnotation:self.annotation atPoint:self.point animated:YES];
}

#pragma mark - MKMapViewDelegate
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    return [mapView dequeueReusableAnnotationViewWithIdentifier:@"annotation view"];
}

#pragma mark - getters and setters
- (MKMapView *)mapview
{
    if (_mapview == nil) {
        _mapview = [[MKMapView alloc] init];
        _mapview.delegate = self;
        [_mapview registerClass:[MKPinAnnotationView class] forAnnotationViewWithReuseIdentifier:@"annotation view"];
    }
    return _mapview;
}

- (UIView *)lineView
{
    if (_lineView == nil) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = [UIColor blackColor];
    }
    return _lineView;
}

- (MKPointAnnotation *)annotation
{
    if (_annotation == nil) {
        _annotation = [[MKPointAnnotation alloc] init];
        _annotation.coordinate = CLLocationCoordinate2DMake(1, 1);
    }
    return _annotation;
}

@end
