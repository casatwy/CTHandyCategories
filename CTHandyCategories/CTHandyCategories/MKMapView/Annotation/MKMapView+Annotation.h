//
//  MKMapView+Annotation.h
//  CTHandyCategories
//
//  Created by casa on 2018/4/9.
//  Copyright © 2018年 casa. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface MKMapView (Annotation)

- (void)showAnnotation:(id<MKAnnotation>)annotation atPoint:(CGPoint)point animated:(BOOL)animated;

@end
