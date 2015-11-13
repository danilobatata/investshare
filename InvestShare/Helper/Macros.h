//
//  Macros.h
//  InvestShare
//
//  Created by Danilo Batata on 11/5/15.
//  Copyright © 2015 Danilo Batata. All rights reserved.
//

#ifndef Macros_h
#define Macros_h

#define NSUserDefaults      [NSUserDefaults standardUserDefaults]
#define UIKeyWindow         [[UIApplication sharedApplication] keyWindow]
#define UIKeyWindowHeight   CGRectGetHeight([[UIApplication sharedApplication] keyWindow].bounds)
#define UIKeyWindowWidth    CGRectGetWidth([[UIApplication sharedApplication] keyWindow].bounds)
#define UIAppDelegate       ((AppDelegate *)[UIApplication sharedApplication].delegate)

/**
 *  Colors from RGB
 */
#define UIColorFromRGB(r, g, b)        [UIColor colorWithRed:((float)r/255.0) green:((float)g/255.0) blue:((float)b/255.0) alpha:(1.0)]
#define UIColorFromRGBA(r, g, b, a)    [UIColor colorWithRed:((float)r/255.0) green:((float)g/255.0) blue:((float)b/255.0) alpha:(a)]

/**
 *  Colors from HEX
 */
#define UIColorFromHEX(hex)         [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]

#define UIColorFromHEXA(hex, a)     [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:a]

/**
 *  Constants
 */
#define kUserToken      @"user_token"
#define kProfileInfo    @"profile_info"

#define kDrawerButtonLabel      @"drawer_button"
#define kDrawerTableLabel       @"drawer_table"
#define kProfileImageViewLabel  @"profile_image_view"
#define kAlertViewLabel         @"alert_view"
#define kCloseButtonLabel       @"close_button"

#endif /* Macros_h */
