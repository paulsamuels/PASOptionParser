//
//  main.m
//  PASOptionParserExample
//
//  Created by Paul Samuels on 28/09/2014.
//  Copyright (c) 2014 Paul Samuels. All rights reserved.
//

@import Foundation;

#import "PASOptionParser.h"

int main(int argc, const char * argv[]) {
  @autoreleasepool {
    PASOptionParser *optionParser = [[PASOptionParser alloc] init]; {
      optionParser.onOption(@"-o/--output FILE", ^(PASOption *option, id argument) {
        NSLog(@"Write to file %@", argument);
      });
      
      optionParser.onOption(@"-d/--dry-run", ^(PASOption *option, id argument) {
        NSLog(@"Perform dry run? %@", argument);
      });
      
      optionParser.onCompletion = ^(NSArray *arguments){
        NSLog(@"%@", arguments);
      };
    }
    
    @try {
      [optionParser parseWithArgumentCount:argc arguments:argv];
    }
    @catch (NSException *exception) {
      printf("%s\nAborting...\n", [[exception description] UTF8String]);
    }
  }
  return 0;
}
