//
//  FFBackgroundParallax.h
//  FFBackgroundParallax
//
//  Created by Felix Ayala on 5/28/15.
//  Copyright (c) 2015 Pandorga. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FFParallaxMode) {
	FFParallaxModeHorizontal = 0,
	FFParallaxModeVertical
};

@protocol PageDelegate <NSObject>
@required
- (void) changePage: (int)pageNo;
@end

@interface FFBackgroundParallax : UIView {
    id <PageDelegate> delegate;
}

@property (nonatomic, strong) UIScrollView *contentScrollView;
@property (nonatomic) enum FFParallaxMode scrollingMode;
@property (retain) id delegate;

- (void)setImageBackground:(UIImage *)image;

@end
