//
//  WebServiceOperation.m
//
//  Created by Arpit Vishwakarma on 03/12/15.
//  Copyright © 2015 Arpit Vishwakarma. All rights reserved.
//

#import "WebServiceOperation.h"

@implementation WebServiceOperation

/**
 Sends a message and data to server .
 @param request for the server
 @param dataLength length of data
 @param data Parameters dictionary
 */

-(void)sendRequest:(NSMutableURLRequest*)request withDataLengh:(NSString*)dataLength withParameters:(NSDictionary*)data{
    
    NSData *newPostData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:nil];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setValue:dataLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setHTTPBody:newPostData];
   
    NSURLSession *session = [NSURLSession sharedSession];
    [[session dataTaskWithRequest:request
                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                    
                    if (error) {
                        NSDictionary *dict = @{@"false":@"status"};
                        block(dict);
                        return;
                    }
                    NSHTTPURLResponse *res = (NSHTTPURLResponse*)response;
                    if (res.statusCode == 200) {
                        NSDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                        block(jsonDict);
                    }
                }] resume];
}


/**
 Sends a message and data to server .
 @param url URL for the server
 @param params Parameter dictionary
 @param callback Block call back as response
 */

- (void)performWebOperationOnServer:(NSString *)url withParameters:(NSDictionary*)params withCallback:(AVCompletionBlock)callback {
   
    NSString *urlString = [NSString stringWithFormat:@"%@%@", @"API_MAIN_URL", url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]initWithURL:[NSURL URLWithString:urlString ]];
    NSData *postData = [NSKeyedArchiver archivedDataWithRootObject:params];
    NSString *modifiedURLString = [NSString stringWithFormat:@"%lu", (unsigned long)postData.length];
    [self sendRequest:request withDataLengh:modifiedURLString withParameters:params];
    block = callback;
}

@end
