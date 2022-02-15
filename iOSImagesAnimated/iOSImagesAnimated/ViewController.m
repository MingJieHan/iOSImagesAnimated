//
//  ViewController.m
//  iOSImagesAnimated
//
//  Created by jia yu on 2022/2/16.
//

#import "ViewController.h"

@interface ViewController (){
    UIButton *runButton;
    UIImageView *animatedImageView;
}

@end

@implementation ViewController

-(void)loadImages{
    NSMutableArray *imagesArray = [[NSMutableArray alloc] init];
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    for (int i=1;i<100;i++){
        NSString *file = [NSString stringWithFormat:@"a%03d.png", i];
        UIImage *image = [[UIImage alloc] initWithContentsOfFile:[path stringByAppendingPathComponent:file]];
        if (nil == image){
            break;
        }
        CGSize appSize = image.size;
        UIWindow *win = UIApplication.sharedApplication.windows.firstObject;
        win.windowScene.sizeRestrictions.minimumSize = appSize;
        win.windowScene.sizeRestrictions.maximumSize = appSize;
        [imagesArray addObject:image];
    }
    animatedImageView.animationImages = imagesArray;
    animatedImageView.animationDuration = 1.f;
    [animatedImageView startAnimating];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    UIWindow *win = UIApplication.sharedApplication.windows.firstObject;
    win.windowScene.titlebar.titleVisibility = UITitlebarTitleVisibilityHidden;
    
    animatedImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, self.view.frame.size.width, self.view.frame.size.height)];
    animatedImageView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:animatedImageView];
    
    runButton = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width - 80.f, 100.f, 80.f, 60.f)];
    runButton.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin;
    runButton.backgroundColor = [UIColor grayColor];
    [runButton setTitle:@"Run" forState:UIControlStateNormal];
    [runButton addTarget:self action:@selector(loadImages) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:runButton];
}


@end
