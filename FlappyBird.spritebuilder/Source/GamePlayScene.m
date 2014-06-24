#import "GamePlayScene.h"
#import "Character.h"
#import "Obstacle.h"

@implementation GamePlayScene

- (void)initialize
{
    // your code here
    character = (Character*)[CCBReader load:@"Character"];
    [physicsNode addChild:character];
    timeSinceObstacle = 0.0f;
}

-(void)update:(CCTime)delta
{
    //this function runs once each frame (60 frames per second)
    //delta is the time between each run
    // put update code here
    
    //Increment the time since the last obstacle was added
    timeSinceObstacle += delta; //delta = ~1/60th second
    
    if(timeSinceObstacle > 2.0f)
    {
        
        //Add new Obstacle
        [self addObstacle];
        
        //Reset the timer
        timeSinceObstacle = 0.0f;
    }
    
    
    
}

// put new methods here

-(void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event{
    //called when someone touches the screen
    //we need to have an action that calls this method
    //looks like touchBegan is a built in function of the Cocos2D engine
    [character flap];
    
}

@end
