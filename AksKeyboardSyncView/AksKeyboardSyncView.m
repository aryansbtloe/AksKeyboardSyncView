#import "AksKeyboardSyncView.h"

@interface UIView (category1)
- (CGPoint)origin;
- (void)setOrigin:(CGPoint)newOrigin;
- (CGSize)size;
- (void)setSize:(CGSize)newSize;
- (CGFloat)x;
- (void)setX:(CGFloat)newX;
- (CGFloat)y;
- (void)setY:(CGFloat)newY;
- (CGFloat)height;
- (void)setHeight:(CGFloat)newHeight;
- (CGFloat)width;
- (void)setWidth:(CGFloat)newWidth;
@end

@implementation UIView (category1)
- (CGPoint)origin {
	return self.frame.origin;
}
- (void)setOrigin:(CGPoint)newOrigin {
	CGRect newFrame = self.frame;
	newFrame.origin = newOrigin;
	self.frame = newFrame;
}
- (CGSize)size {
	return self.frame.size;
}
- (void)setSize:(CGSize)newSize {
	CGRect newFrame = self.frame;
	newFrame.size = newSize;
	self.frame = newFrame;
}
- (CGFloat)x {
	return self.frame.origin.x;
}
- (void)setX:(CGFloat)newX {
	CGRect newFrame = self.frame;
	newFrame.origin.x = newX;
	self.frame = newFrame;
}
- (CGFloat)y {
	return self.frame.origin.y;
}
- (void)setY:(CGFloat)newY {
	CGRect newFrame = self.frame;
	newFrame.origin.y = newY;
	self.frame = newFrame;
}
- (CGFloat)height {
	return self.frame.size.height;
}
- (void)setHeight:(CGFloat)newHeight {
	CGRect newFrame = self.frame;
	newFrame.size.height = newHeight;
	self.frame = newFrame;
}
- (CGFloat)width {
	return self.frame.size.width;
}
- (void)setWidth:(CGFloat)newWidth {
	CGRect newFrame = self.frame;
	newFrame.size.width = newWidth;
	self.frame = newFrame;
}
@end

@implementation AksKeyboardSyncView
- (id)init {
	self = [super init];
	if (self) {
		[self InitKeyboardSyncView];
	}
	return self;
}
- (id)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		[self InitKeyboardSyncView];
	}
	return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
	self = [super initWithCoder:aDecoder];
	if (self) {
		[self InitKeyboardSyncView];
	}
	return self;
}
- (void)InitKeyboardSyncView {
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisappear:) name:UIKeyboardWillHideNotification object:nil];
}
- (void)keyboardWillAppear:(NSNotification *)notification {
	CGRect keyBoardRect  = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
	CGFloat animDuration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
	UIViewAnimationOptions options = UIViewAnimationOptionAllowAnimatedContent;
	[UIView animateWithDuration:animDuration delay:0.0f options:options animations: ^(void) {
	    self.y -= keyBoardRect.size.height;
	} completion: ^(BOOL finished) {}];
}
- (void)keyboardWillDisappear:(NSNotification *)notification {
	CGRect keyBoardRect  = [[notification.userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
	CGFloat animDuration = [[notification.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
	UIViewAnimationOptions options = UIViewAnimationOptionAllowAnimatedContent;
	[UIView animateWithDuration:animDuration delay:0.0f options:options animations: ^(void) {
	    self.y += keyBoardRect.size.height;
	} completion: ^(BOOL finished) {}];
}
- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}
@end
