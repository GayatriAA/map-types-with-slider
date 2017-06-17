//
//  ViewController.m
//  Dayh6_mapZoomInnOut
//
//  Created by Student P_08 on 02/06/17.
//  Copyright © 2017 gayatri. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.firstValue=0.01;
    self.secondValue=0.01;
    self.mySlider.value=0.001;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)startDetectingLocation
{
    self.locateManager=[[CLLocationManager alloc]init];
    self.locateManager.desiredAccuracy=kCLLocationAccuracyBest;
    [self.locateManager requestWhenInUseAuthorization];
    self.locateManager.delegate=self;
    [self.locateManager startUpdatingLocation];
}
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *currentLocation=locations.lastObject;
    CGFloat latitude, longitude;
    if (currentLocation!=nil)
    {
        latitude=currentLocation.coordinate.latitude;
        longitude=currentLocation.coordinate.longitude;
        
        NSLog(@"Current Latitude: %f and Longitude: %f",latitude,longitude);
        [self.locateManager stopUpdatingLocation];
    }
    CLLocationCoordinate2D myCoordinate=(CLLocationCoordinate2DMake(latitude, longitude));
    MKCoordinateSpan mySpan=MKCoordinateSpanMake(self.firstValue, self.secondValue);
    MKCoordinateRegion myRegion=MKCoordinateRegionMake(myCoordinate, mySpan);
    [self.myMapView setRegion:myRegion];
}
- (IBAction)mySlider:(id)sender
{
    self.mySlider=sender;
    self.mySlider.maximumValue=1;
    self.mySlider.minimumValue=0.001;
    self.firstValue=self.mySlider.value;
    self.secondValue=self.mySlider.value;
    [self.locateManager startUpdatingLocation ];
}

- (IBAction)zoomIn:(id)sender
{
    self.mySlider.minimumValue=0.001;
    self.mySlider.maximumValue=1;
    
    self.mySlider.value=self.mySlider.value+0.10;
    
    self.firstValue=self.mySlider.value;
    self.secondValue=self.mySlider.value;
    
    [self.locateManager startUpdatingLocation];
    
}

- (IBAction)zoomOut:(id)sender
{
    self.mySlider.minimumValue=0.001;
    self.mySlider.maximumValue=1;
    
    self.mySlider.value=self.mySlider.value-0.10;
    
    self.firstValue=self.mySlider.value;
    self.secondValue=self.mySlider.value;
    
    [self.locateManager startUpdatingLocation];
}

- (IBAction)detectLocation_Button:(id)sender
{
    [self startDetectingLocation];
}

- (IBAction)mapTypes:(id)sender
{
    UISegmentedControl *mySegment=sender;
    switch (mySegment.selectedSegmentIndex) {
        case 0: self.myMapView.mapType=MKMapTypeStandard;
                break;
        case 1: self.myMapView.mapType=MKMapTypeSatellite;
            break;
            
        case 2: self.myMapView.mapType=MKMapTypeHybrid;
            break;
            
        default:
            break;
    }

}
@end
