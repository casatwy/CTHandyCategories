//
//  MKMapView+Annotation.m
//  CTHandyCategories
//
//  Created by casa on 2018/4/9.
//  Copyright © 2018年 casa. All rights reserved.
//

#import "MKMapView+Annotation.h"
#import <HandyFrame/UIView+LayoutMethods.h>
#import <CoreLocation/CoreLocation.h>

@implementation MKMapView (Annotation)

- (void)showAnnotation:(id<MKAnnotation>)annotation atPoint:(CGPoint)point animated:(BOOL)animated
{
    CGPoint annotationPoint = [self convertCoordinate:annotation.coordinate toPointToView:self];
    CGPoint centerPoint = CGPointMake(annotationPoint.x, annotationPoint.y + (self.ct_centerY - point.y));
    CLLocationCoordinate2D centerCoordinate = [self convertPoint:centerPoint toCoordinateFromView:self];
    [self setCenterCoordinate:centerCoordinate animated:animated];
}

@end
