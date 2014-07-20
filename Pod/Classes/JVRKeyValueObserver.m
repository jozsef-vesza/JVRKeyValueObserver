//
//  JVRKeyValueObserver.m
//  JVRKeyValueObserver
//
//  Created by Jozsef Vesza on 20/07/14.
//  Copyright (c) 2014 József Vesza. All rights reserved.
//

#import "JVRKeyValueObserver.h"

@interface JVRKeyValueObserver ()

@property (nonatomic, weak) id observedObject;
@property (nonatomic, copy) NSString *keyPath;

@end

@implementation JVRKeyValueObserver

- (instancetype)initWithObject:(id)object keyPath:(NSString *)keypath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options {
    
    if (object == nil) {
        return nil;
    }
    
    NSParameterAssert(target != nil);
    NSParameterAssert([target respondsToSelector:selector]);
    
    self = [super init];
    if (self) {
        self.target = target;
        self.keyPath = keypath;
        self.observedObject = object;
        self.selector = selector;
        [object addObserver:self forKeyPath:keypath options:options context:(__bridge void *)(self)];
    }
    return self;
}

+ (NSObject *)observeObject:(id)object keypath:(NSString *)keypath target:(id)target selector:(SEL)selector {
    return [self observeObject:object keyPath:keypath target:target selector:selector options:0];
}

+ (NSObject *)observeObject:(id)object keyPath:(NSString *)keyPath target:(id)target selector:(SEL)selector options:(NSKeyValueObservingOptions)options {
    return [[self alloc] initWithObject:object keyPath:keyPath target:target selector:selector options:options];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    if (context == (__bridge void *)(self)) {
        [self didChange:change];
    }
}

- (void)didChange:(NSDictionary *)change {
    id strongTarget = self.target;
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    [strongTarget performSelector:self.selector withObject:change];
#pragma clang diagnostic pop
}

- (void)dealloc {
    [self.observedObject removeObserver:self forKeyPath:self.keyPath];
}

@end
