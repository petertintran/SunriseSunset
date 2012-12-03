//
//  ViewController.h
//  SunriseSunset
//
//  Created by Peter Tran on 26/11/2012.
//  Code given by Michael Shafae
//  Copyright (c) 2012 Tran.Peter. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacSunrise.h"

@interface ViewController : UIViewController
{
    IBOutlet UILabel* _labelSunrise;
    IBOutlet UILabel* _labelSunset;
}
@property (strong, nonatomic) IBOutlet UILabel *labelSunrise;
@property (strong, nonatomic) IBOutlet UILabel *labelSunset;


@end
