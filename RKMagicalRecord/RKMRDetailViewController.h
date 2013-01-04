//
//  RKMRDetailViewController.h
//  RKMagicalRecord
//
//  Created by Blake Watters on 1/4/13.
//  Copyright (c) 2013 RestKit. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RKMRDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
