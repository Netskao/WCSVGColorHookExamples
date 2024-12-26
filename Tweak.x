#import <UIKit/UIKit.h>

/* 默认示范随机颜色*/ 
UIColor *randomColor(void) {
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
    CGFloat alpha = (arc4random_uniform(31) + 70) / 100.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

%hook MMThemeManager
- (UIImage *)svgImageNamed:(NSString *)name size:(struct CGSize)size color:(id)color alpha:(double)alpha angle:(int)angle ignoreNotFound:(BOOL)ignore {
    /* 当然 在这里你可以判断指定修改的SVG图片名称 */
	return %orig(name, size, randomColor(), alpha, angle, ignore);
}
%end

