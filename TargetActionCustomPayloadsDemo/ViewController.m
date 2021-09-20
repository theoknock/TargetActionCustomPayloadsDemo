//
//  ViewController.m
//  TargetActionCustomPayloadsDemo
//
//  Created by Xcode Developer on 9/18/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.slider addTarget:
     ^ (UISlider * i, UIControlEvents events) {
        return ^ {
            NSLog(@"Touchdown");
        };
    }(self.slider, (UIControlEvents)UIControlEventTouchDown)
                    action:@selector(invoke) forControlEvents:(UIControlEvents)UIControlEventTouchDown];
    
    void(^(^block)(UISlider *, UIControlEvents))(void) = ^ {
        return ^ (UISlider * i, UIControlEvents events) {
            return ^ {
                printf("-");
            };
        };
    }();
    
    [self.slider addTarget:block(self.slider, (UIControlEvents)UIControlEventTouchDown)
                    action:@selector(invoke) forControlEvents:(UIControlEvents)UIControlEventValueChanged];
}


@end
