//
// Copyright (C) 2015 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
#import "PersonDetailTableViewController.h"
#import "Pet.h"

// Import our own module's Swift headers
//
#import "BridgingToObjC-Swift.h"

@interface PersonDetailTableViewController ()
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *petNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *petTypeLabel;
@property (weak, nonatomic) IBOutlet UILabel *petToysLabel;
@end


@implementation PersonDetailTableViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.nameLabel.text = self.person.fullName;
    self.petNameLabel.text = self.person.pet.name;
    self.petTypeLabel.text = self.person.petTypeText;
    self.petToysLabel.text = self.person.petToysText;
}

@end
