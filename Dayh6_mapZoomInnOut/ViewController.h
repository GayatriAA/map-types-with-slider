//
//  ViewController.h
//  Dayh6_mapZoomInnOut
//
//  Created by Student P_08 on 02/06/17.
//  Copyright © 2017 gayatri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>


@interface ViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *myMapView;
- (IBAction)mySlider:(id)sender;
- (IBAction)zoomIn:(id)sender;
- (IBAction)zoomOut:(id)sender;

- (IBAction)detectLocation_Button:(id)sender;

- (IBAction)mapTypes:(id)sender;




@property CGFloat firstValue;
@property CGFloat secondValue;
@property UISlider *mySlider;

@property CLLocationManager *locateManager;



@end

