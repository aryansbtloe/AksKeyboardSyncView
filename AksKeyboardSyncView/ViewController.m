#import "ViewController.h"

@implementation ViewController

#pragma mark - View lifecycle
- (void)viewDidLoad {
	[super viewDidLoad];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
	[textField resignFirstResponder];
	return YES;
}
@end
