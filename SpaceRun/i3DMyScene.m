//
//  i3DMyScene.m
//  SpaceRun
//
//  Created by Iyad Horani on 29/07/2014.
//  Copyright (c) 2014 IRONIC3D. All rights reserved.
//

#import "i3DMyScene.h"

@implementation i3DMyScene

-(instancetype)initWithSize:(CGSize)size {
	if (self == [super initWithSize:size]) {
		self.backgroundColor = [SKColor blackColor];
		
		NSString *imageShipName = @"Spaceship.png";
		SKSpriteNode *ship = [SKSpriteNode spriteNodeWithImageNamed:imageShipName];
		ship.position = CGPointMake(size.width / 2, size.height / 2);
		ship.size = CGSizeMake(40, 40);
		[self addChild:ship];
	}
	
	return self;
}

@end
