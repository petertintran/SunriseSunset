//
//  ViewController.m
//  SunriseSunset
//
//  Created by Peter Tran on 26/11/2012.
//  Code given by Michael Shafae
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize labelSunrise = _labelSunrise;
@synthesize labelSunset =_labelSunset;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    time_t now;
    struct tm* timeinfo;
    // Fullerton
    double lat = 33.87028;
    double lon = -117.92444;
    time( &now );
    timeinfo = localtime( &now );
    BOOL flag = NO;
    if( flag ){
        // In case you want to check the sunrise and sunset times for
        // 7/25/1990 set flag to YES.
        timeinfo->tm_mon = 9;
        timeinfo->tm_mday = 31;
        timeinfo->tm_year = 12;
    }
    printf ( "Current local time and date: %s", asctime(timeinfo) );
    
    
    NSLog( @"Sunrise & sunset with civil zenith\n" );
    double sunrise = calculateSunriseOrSunset( timeinfo, lat, lon, CIVIL, YES );
    double sunrise_h = floor(sunrise) - ( sunrise > 12.0 ? 12.0 : 0.0);
    double sunrise_m = round((sunrise - floor(sunrise)) * 60.0 );
    
    double sunset = calculateSunriseOrSunset( timeinfo, lat, lon, CIVIL, NO );
    double sunset_h = floor(sunset) - ( sunset > 12.0 ? 12.0 : 0.0);
    double sunset_m = round((sunset - floor(sunset)) * 60.0 );
    
    self.labelSunrise.text = [NSString stringWithFormat:@"Sunrise: %g:%02g AM", sunrise_h, sunrise_m ];
    self.labelSunset.text = [NSString stringWithFormat:@"Sunset: %g:%02g PM", sunset_h, sunset_m ];
    
}

- (void)viewDidUnload
{
    [self setLabelSunrise:nil];
    [self setLabelSunset:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
