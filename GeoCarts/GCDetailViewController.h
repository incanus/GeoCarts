//
//  GCDetailViewController.h
//  Geocarts
//
//  Created by Justin Miller on 1/15/13.
//  Copyright (c) 2012 MapBox / Development Seed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GCDetailViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) NSString *detailTitle;
@property (strong, nonatomic) NSString *detailDescription;

@end