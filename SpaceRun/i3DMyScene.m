//
//  i3DMyScene.m
//  SpaceRun
//
//  Created by Iyad Horani on 29/07/2014.
//  Copyright (c) 2014 IRONIC3D. All rights reserved.
//

#import "i3DMyScene.h"

@interface i3DMyScene ()

@property (nonatomic, weak) UITouch *shipTouch;

@end

@implementation i3DMyScene

-(instancetype)initWithSize:(CGSize)size {
	if (self == [super initWithSize:size]) {
		self.backgroundColor = [SKColor blackColor];
		
		NSString *imageShipName = @"Spaceship.png";
		SKSpriteNode *ship = [SKSpriteNode spriteNodeWithImageNamed:imageShipName];
		ship.position = CGPointMake(size.width / 2, size.height / 2);
		ship.size = CGSizeMake(40, 40);
		ship.name = @"ship";
		[self addChild:ship];
	}
	
	return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	self.shipTouch = [touches anyObject];
}

-(void)update:(NSTimeInterval)currentTime {
	if (self.shipTouch) {
		SKNode *ship = [self childNodeWithName:@"ship"];
		ship.position = [self.shipTouch locationInNode:self];
	}
}

@end
