//
//  zzwPlusButton.h
//  Zhang_tabBar
//
//  Created by zhangzhenwei on 16/8/17.
//  Copyright © 2016年 zhangzhenwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@import UIKit;
@import QuartzCore;
@import AudioToolbox;

@class zzwPlusButton;

/*!
 *  The direction of a `zzwPlusButton` object's bloom animation.
 */
typedef NS_ENUM(NSUInteger, kzzwPlusButtonBloomDirection) {
    /*!
     *  Bloom animation gose to the top of the `zzwPlusButton` object.
     */
    kzzwPlusButtonBloomDirectionTop = 1,
    /*!
     *  Bloom animation gose to top left of the `zzwPlusButton` object.
     */
    kzzwPlusButtonBloomDirectionTopLeft = 2,
    /*!
     *  Bloom animation gose to the left of the `zzwPlusButton` object.
     */
    kzzwPlusButtonBloomDirectionLeft = 3,
    /*!
     *  Bloom animation gose to bottom left of the `zzwPlusButton` object.
     */
    kzzwPlusButtonBloomDirectionBottomLeft = 4,
    /*!
     *  Bloom animation gose to the bottom of the `zzwPlusButton` object.
     */
    kzzwPlusButtonBloomDirectionBottom = 5,
    /*!
     *  Bloom animation gose to bottom right of the `zzwPlusButton` object.
     */
    kzzwPlusButtonBloomDirectionBottomRight = 6,
    /*!
     *  Bloom animation gose to the right of the `zzwPlusButton` object.
     */
    kzzwPlusButtonBloomDirectionRight = 7,
    /*!
     *  Bloom animation gose around the `zzwPlusButton` object.
     */
    kzzwPlusButtonBloomDirectionTopRight = 8,
};


@protocol zzwPlusButtonDelegate <NSObject>

/*!
 *  Tells the delegate that the item button at an index is clicked.
 *
 *  @param zzwPlusButton    A `zzwPlusButton` object informing the delegate about the button click.
 *  @param itemButtonIndex The index of the item button being clicked.
 */
- (void)pathButton:(zzwPlusButton *)zzwPlusButton clickItemButtonAtIndex:(NSUInteger)itemButtonIndex;

@optional

/*!
 *  Tells the delegate that the `zzwPlusButton` object will present its items.
 *
 *  @param zzwPlusButton A `zzwPlusButton` object that is about to present its items.
 */
- (void)willPresentzzwPlusButtonItems:(zzwPlusButton *)zzwPlusButton;
/*!
 *  Tells the delegate that the `zzwPlusButton` object has already presented its items.
 *
 *  @param zzwPlusButton A `zzwPlusButton` object that has presented its items.
 */
- (void)didPresentzzwPlusButtonItems:(zzwPlusButton *)zzwPlusButton;

/*!
 *  Tells the delegate that the `zzwPlusButton` object will dismiss its items.
 *
 *  @param zzwPlusButton A `zzwPlusButton` object that is about to dismiss its items
 */
- (void)willDismisszzwPlusButtonItems:(zzwPlusButton *)zzwPlusButton;
/*!
 *  Tells the delegate that the `zzwPlusButton` object has already dismissed its items.
 *
 *  @param zzwPlusButton A `zzwPlusButton` object that has dismissed its items.
 */
- (void)didDismisszzwPlusButtonItems:(zzwPlusButton *)zzwPlusButton;

@end


@interface zzwPlusButton : UIView

/*!
 *  The object that acts as the delegate of the `zzwPlusButton` object.
 */
@property (weak, nonatomic) id<zzwPlusButtonDelegate> delegate;

/*!
 *  `zzwPlusButton` object's bloom animation's duration.
 */
@property (assign, nonatomic) NSTimeInterval basicDuration;
/*!
 *  `YES` if allows `zzwPlusButton` object's sub items to rotate. Otherwise `NO`.
 */
@property (assign, nonatomic) BOOL allowSubItemRotation;

/*!
 *  `zzwPlusButton` object's bloom radius. The default value is 105.0f.
 */
@property (assign, nonatomic) CGFloat bloomRadius;

/*!
 *  `zzwPlusButton` object's bloom angle.
 */
@property (assign, nonatomic) CGFloat bloomAngel;

/*!
 *  The center of a `zzwPlusButton` object's position. The default value positions the `zzwPlusButton` object in bottom center.
 */
@property (assign, nonatomic) CGPoint ZYButtonCenter;

/*!
 *  If set to `YES` a sound will be played when the `zzwPlusButton` object is being interacted. The default value is `YES`.
 */
@property (assign, nonatomic) BOOL allowSounds;

/*!
 *  The path to the `zzwPlusButton` object's bloom effect sound file.
 */
@property (copy, nonatomic) NSString *bloomSoundPath;

/*!
 *  The path to the `zzwPlusButton` object's fold effect sound file.
 */
@property (copy, nonatomic) NSString *foldSoundPath;

/*!
 *  The path to the `zzwPlusButton` object's item action sound file.
 */
@property (copy, nonatomic) NSString *itemSoundPath;

/*!
 *  `YES` if allows the `zzwPlusButton` object's center button to rotate. Otherwise `NO`.
 */
@property (assign, nonatomic) BOOL allowCenterButtonRotation;

/*!
 *  Color of the backdrop view when `zzwPlusButton` object's sub items are shown.
 */
@property (strong, nonatomic) UIColor *bottomViewColor;

/*!
 *  Direction of `zzwPlusButton` object's bloom animation.
 */
@property (assign, nonatomic) kzzwPlusButtonBloomDirection bloomDirection;

/*!
 *  Creates a `zzwPlusButton` object with a given normal image and highlited images for center button.
 *
 *  @param centerImage            The normal image for `zzwPlusButton` object's center button.
 *  @param centerHighlightedImage The highlighted image for `zzwPlusButton` object's center button.
 *
 *  @return A `zzwPlusButton` object.
 */
- (instancetype)initWithCenterImage:(UIImage *)centerImage
                   highlightedImage:(UIImage *)centerHighlightedImage;

/*!
 *  Creates a `zzwPlusButton` object with a given frame, normal and highlighted images for its center button.
 *
 *  @param centerButtonFrame      The frame of `zzwPlusButton` object.
 *  @param centerImage            The normal image for `zzwPlusButton` object's center button.
 *  @param centerHighlightedImage The highlighted image for `zzwPlusButton` object's center button.
 *
 *  @return A `zzwPlusButton` object.
 */
- (instancetype)initWithButtonFrame:(CGRect)centerButtonFrame
                        centerImage:(UIImage *)centerImage
                   highlightedImage:(UIImage *)centerHighlightedImage;

/*!
 *  Adds item buttons to an existing `zzwPlusButton` object.
 *
 *  @param pathItemButtons The item buttons to be added.
 */
- (void)addPathItems:(NSArray *)pathItemButtons;




@end
