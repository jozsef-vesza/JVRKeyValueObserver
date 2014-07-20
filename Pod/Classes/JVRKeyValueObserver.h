//
//  JVRKeyValueObserver.h
//  JVRKeyValueObserver
//
//  Created by Jozsef Vesza on 20/07/14.
//  Copyright (c) 2014 József Vesza. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Helper class for Key-Value Observing, originally published on objc.io: http://www.objc.io/issue-7/key-value-coding-and-observing.html
 *  Original code can be found here: https://github.com/objcio/issue-7-lab-color-space-explorer/blob/master/Lab%20Color%20Space%20Explorer/KeyValueObserver.m
 *  All credits go to objc.io (@objcio) for publishing this great solution
 */
@interface JVRKeyValueObserver : NSObject

/**
 *  The object that will react to changes
 */
@property (nonatomic, weak) id target;

/**
 *  Selector for the method which will be executed by the target in case of changes
 */
@property (nonatomic) SEL selector;

/**
 *  Create a Key-Value Observing helper object without options
 *
 *  @param object   The object to be observed
 *  @param keypath  The keypath of the object to be observed
 *  @param target   The object that will react to changes
 *  @param selector Selector for the method which will be executed by the target in case of changes
 *
 *  @return The opaque token object to be stored in a property
 */
+ (NSObject *)observeObject:(id)object keypath:(NSString *)keypath target:(id)target selector:(SEL)selector;

/**
 *  Create a Key-Value Observing helper object without options
 *
 *  @param object   The object to be observed
 *  @param keyPath  The keypath of the object to be observed
 *  @param target   The object that will react to changes
 *  @param selector Selector for the method which will be executed by the target in case of changes
 *  @param options  Key-Value Observing options
 *
 *  @return The opaque token object to be stored in a property
 */
+ (NSObject *)observeObject:(id)object keyPath:(NSString *)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options __attribute__((warn_unused_result));

@end
