//
//  ShowCreatureViewController.m
//  MCMS/Users/Rich/Documents/Mobile Makers/Deprocrastinator/Deprocrastinator/Deprocrastinator/ViewController.m
//
//  Created by Richard Fellure on 5/20/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import "ShowCreatureViewController.h"
#import "ViewController.h"

@interface ShowCreatureViewController ()<UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageOfCreature;
@property (weak, nonatomic) IBOutlet UILabel *creatureDescriptionLabel;
@property (weak, nonatomic) IBOutlet UITextField *editedTextLabel;
@property (weak, nonatomic) IBOutlet UILabel *creatureNameLabel;
@property (weak, nonatomic) IBOutlet UITextField *editedDescription;

@end

@implementation ShowCreatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.creatureNameLabel.text = self.magicalCreature.name;
    self.creatureDescriptionLabel.text = self.magicalCreature.description;
    [self.editedTextLabel setHidden:YES];
    [self.editedDescription setHidden:YES];
    self.imageOfCreature.image = self.magicalCreature.picture;

}

- (IBAction)onPressedEditButton:(id)sender
{

    self.editing = !self.editing;

    if (self.editing)
    {
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        self.editedTextLabel.text = self.creatureNameLabel.text;
        [self.editedTextLabel setHidden:NO];
        self.editedDescription.text = self.creatureDescriptionLabel.text;
        [self.editedDescription setHidden:NO];


    }
    else
    {
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        self.creatureDescriptionLabel.text = self.editedDescription.text;
        self.magicalCreature.description = self.creatureDescriptionLabel.text;
        self.creatureNameLabel.text = self.editedTextLabel.text;
        self.magicalCreature.name = self.creatureNameLabel.text;
        [self.editedTextLabel setHidden:YES];
    }

}

-(BOOL) textFieldShouldReturn:(UITextField *) textField
{
    self.creatureNameLabel.text = self.editedTextLabel.text;
    self.creatureDescriptionLabel.text = self.editedDescription.text;
    [self.editedDescription setHidden:YES];
    [self.editedTextLabel setHidden:YES];
    NSLog(@"Its working");
    [self.editedTextLabel resignFirstResponder];
    [self.editedDescription resignFirstResponder];
    return YES;
}



@end
