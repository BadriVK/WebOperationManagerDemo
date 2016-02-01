//
//  WebServiceOperation.h
//
//  Created by Arpit Vishwakarma on 03/12/15.
//  Copyright © 2015 Arpit Vishwakarma. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Block to receive response
 */
typedef void (^AVCompletionBlock)(NSDictionary *response);

@interface WebServiceOperation : NSObject<NSURLConnectionDelegate>
{
    //NSURLConnection object
    NSURLConnection *conn;
    
    //Block object
    AVCompletionBlock block;

}

/**
 Sends a message and data to server .
 @param url URL for the server
 @param params Parameter dictionary
 @param callback Block call back as response
 */

- (void)performWebOperationOnServer:(NSString *)url withParameters:(NSDictionary*)params withCallback:(AVCompletionBlock)callback;

@end
