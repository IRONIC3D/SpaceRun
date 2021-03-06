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
@property (nonatomic) NSTimeInterval lastUpdateTime;

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
	if (self.lastUpdateTime == 0) {
		self.lastUpdateTime = currentTime;
	}
	NSTimeInterval timeDelta = currentTime - self.lastUpdateTime;
	
	if (self.shipTouch) {
		[self moveShipTowardPoint:[self.shipTouch locationInNode:self] byTimeDelta:timeDelta];
	}
	
	self.lastUpdateTime = currentTime;
}

- (void)moveShipTowardPoint:(CGPoint)point byTimeDelta:(NSTimeInterval)timeDelta {
	CGFloat shipSpeed = 130;
	SKNode *ship = [self childNodeWithName:@"ship"];
	CGFloat distanceLeft = sqrt(pow(ship.position.x - point.x, 2) +
								pow(ship.position.y - point.y, 2));
	if (distanceLeft > 4) {
		CGFloat distanceToTravel = timeDelta * shipSpeed;
		CGFloat angle = atan2(point.y - ship.position.y,
							  point.x - ship.position.x);
		CGFloat yOffset = distanceToTravel * sin(angle);
		CGFloat xOffset = distanceToTravel * cos(angle);
		ship.position = CGPointMake(ship.position.x + xOffset,
									ship.position.y + yOffset);
	}
}

@end
