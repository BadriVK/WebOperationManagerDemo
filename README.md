# WebOperationManagerDemo#
# Description
Call web-service operations using 
Blocks in **Objective-C**

`NSURLRequest` with `session` (iOS 9 or above)

**Reachability** to check network availibility

##Requirements
>Objective-C (Xcode 7+)

>iOS 8+

>ARC



##Usage

Pass the params dictionary and URL
```
NSDictionary *params = @{@"first_name":@"",
                             @"last_name": @"",
                            };
 
  WebServiceOperation *webOperation = [[WebServiceOperation alloc]init];
 [webOperation performWebOperationOnServer:@"YOURURL" withParameters:params withCallback:^(NSDictionary *response) {
    //response in NSDictionary
 }];
 ```

## Author
([@arpitVishwakarma](https://www.twitter.com/arpit_limodia))
