//
//  GCViewController.m
//  GeoCarts
//
//  Created by Justin R. Miller on 1/15/13.
//  Copyright (c) 2013 MapBox. All rights reserved.
//

#import "GCViewController.h"

#import "GCDetailViewController.h"

@implementation GCViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"GeoCarts";
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];

    RMMapView *mapView = [[RMMapView alloc] initWithFrame:self.view.bounds andTilesource:[[RMMBTilesSource alloc] initWithTileSetResource:@"geocarts" ofType:@"mbtiles"]];

    mapView.adjustTilesForRetinaDisplay = ([[UIScreen mainScreen] scale] > 1.0);

    mapView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;

    mapView.delegate = self;
    
    [mapView setZoom:13 atCoordinate:CLLocationCoordinate2DMake(45.519218, -122.676086) animated:NO];

    [self.view addSubview:mapView];
}

- (void)singleTapOnMap:(RMMapView *)map at:(CGPoint)point
{
    RMMBTilesSource *tileSource = (RMMBTilesSource *)map.tileSource;

    if ([tileSource conformsToProtocol:@protocol(RMInteractiveSource)] && [tileSource supportsInteractivity])
    {
        NSString *content = [tileSource formattedOutputOfType:RMInteractiveSourceOutputTypeTeaser forPoint:point inMapView:map];

        [map removeAllAnnotations];

        if (content)
        {
            NSString *title = [[content componentsSeparatedByCharactersInSet:[NSCharacterSet newlineCharacterSet]] objectAtIndex:0];

            RMAnnotation *annotation = [RMAnnotation annotationWithMapView:map coordinate:[map pixelToCoordinate:point] andTitle:title];

            annotation.userInfo = content;

            [map addAnnotation:annotation];

            [map selectAnnotation:annotation animated:YES];
        }
    }
}

- (RMMapLayer *)mapView:(RMMapView *)mapView layerForAnnotation:(RMAnnotation *)annotation
{
    RMMarker *marker = [[RMMarker alloc] initWithMapBoxMarkerImage:@"pin" tintColor:[UIColor clearColor]];

    marker.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];

    marker.canShowCallout = YES;

    return marker;
}

- (void)tapOnCalloutAccessoryControl:(UIControl *)control forAnnotation:(RMAnnotation *)annotation onMap:(RMMapView *)map
{
    GCDetailViewController *detailViewController = [GCDetailViewController new];

    detailViewController.detailTitle       = annotation.title;
    detailViewController.detailDescription = [annotation.userInfo stringByReplacingOccurrencesOfString:annotation.title withString:@""];

    [self.navigationController pushViewController:detailViewController animated:YES];
}

@end