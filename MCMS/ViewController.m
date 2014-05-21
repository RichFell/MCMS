//
//  ViewController.m
//  MCMS
//
//  Created by Richard Fellure on 5/20/14.
//  Copyright (c) 2014 Rich. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "ShowCreatureViewController.h"
@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *creatureTableView;
@property (weak, nonatomic) IBOutlet UITextField *inputTextField;
@property Boolean switchNameAndDescription;

@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    MagicalCreature *creature1 = [[MagicalCreature alloc] initWithName:@"Dragon" description:@"Flying" picture:[UIImage imageNamed:@"dragon"]];
    MagicalCreature *creature2 = [[MagicalCreature alloc] initWithName:@"Fairy" description:@"Sparkling" picture:[UIImage imageNamed:@"fairy"]];
    MagicalCreature *creature3 = [[MagicalCreature alloc]initWithName:@"Hobbit" description:@"Big Feet" picture:[UIImage imageNamed:@"hobbit"]];
	self.creatures = [NSMutableArray arrayWithObjects:creature1, creature2, creature3,nil];
    self.switchNameAndDescription = YES;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyCellID"];
    MagicalCreature *creature   =   [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    cell.detailTextLabel.text = creature.description;
    return cell;
}

- (IBAction)addButtonOnPress:(id)sender
{
    MagicalCreature *addedCreature = [[MagicalCreature alloc ]init];
//    if (self.switchNameAndDescription == YES)
//    {

        NSString *creatureName = self.inputTextField.text;
        addedCreature.name = creatureName;
        [self.creatures addObject:addedCreature];
        [self.creatureTableView reloadData ];
        [self.inputTextField resignFirstResponder];
        self.inputTextField.text = @"";
        self.switchNameAndDescription = NO;
//    }
//    else
//    {
//        NSString *creatureDescription = self.inputTextField.text;
//        addedCreature.description = creatureDescription;
//        [self.creatures addObject:addedCreature];
//        [self.creatureTableView reloadData];
//        [self.inputTextField resignFirstResponder];
//        self.inputTextField.text = @"";
//        self.switchNameAndDescription = YES;
//        
//    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSIndexPath *selectedIndexPath = self.creatureTableView.indexPathForSelectedRow;
    MagicalCreature *selectedCreature = [self.creatures objectAtIndex:selectedIndexPath.row];

    ShowCreatureViewController *creatureViewController = segue.destinationViewController;
    creatureViewController.magicalCreature = selectedCreature;
    



}
-(void)viewWillAppear:(BOOL)animated
{
    [self.creatureTableView reloadData];
}

@end
