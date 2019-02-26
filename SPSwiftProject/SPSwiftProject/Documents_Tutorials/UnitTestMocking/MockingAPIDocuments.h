//
//  MockingAPIDocuments.h
//  SPSwiftProject
//
//  Created by Parsoya, Saritha(AWF) on 2/25/19.
//  Copyright © 2019 Parsoya, Saritha. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MockingAPIDocuments : NSObject

@end

//
//  ECCAPICategoryTreeServiceTests.m
//  SPMaster


#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "ECAppConfig.h"
#import "ECCAPICategoryTreeService.h"
#import "ECAPICategoryListRequest.h"
#import "ECAPICategoryListResponse.h"
#import "ECAPICategory.h"
@import ClassifiedsDomain;

@interface ECCAPICategoryTreeServiceTests : XCTestCase
@property ECCAPICategoryTreeService *retriever;
@property ECAppConfig *appConfig;
@property id<APIRequestManager> requestManager;

@property(nonatomic, strong) ECAPIResponse<NSArray<ECCategory *> *> *response;

+ (void)setSentRequest:(ECAPICategoryListRequest *)sentRequest;

+ (ECAPICategoryListResponse *)capiResponse;
@end

@protocol APIRequestManager
- (void)addRequest:(ECAPIRequestBase *)request completion:(void (^)(ECAPIResponseBase * _Nullable))completion;
@end

@interface FakeAPIRequestManager: NSObject <APIRequestManager>
@end

@implementation FakeAPIRequestManager

- (void)addRequest:(ECAPIRequestBase *)request completion:(void (^)(ECAPIResponseBase * _Nullable))completion
{
    ECCAPICategoryTreeServiceTests.sentRequest = (ECAPICategoryListRequest *)request;
    completion(ECCAPICategoryTreeServiceTests.capiResponse);
}

@end

@implementation ECCAPICategoryTreeServiceTests
static ECAPICategoryListRequest *sentRequest;
static ECAPICategoryListResponse *capiResponse;
static ECAPICategoryListResponse *eTagMatched304Response;
static ECAPICategoryListResponse *failedResponse;
static NSMutableArray<ECAPICategory *> *oneTopLevelCategoryWith3Children;
static NSMutableArray<ECAPICategory *> *threeTopLevelCategories;

- (void)setUp
{
    [super setUp];
    self.appConfig = [OCMockObject partialMockForObject:[[ECAppConfig alloc] init]];
    self.requestManager = [[FakeAPIRequestManager alloc] init];
    self.retriever = [[ECCAPICategoryTreeService alloc] initWithAppConfig:self.appConfig requestManager:self.requestManager];
    self.response = nil;
    sentRequest = nil;
    [self setupResponses];
}

- (void)testShouldAppendGivenETagToRequest
{
    [self whenCategoriesRequestedWithETag:@"1234"];
    [self thenRequestSentToServerWithETag:@"1234"];
}

- (void)whenCategoriesRequestedWithETag:(NSString *)string
{
    [self.retriever loadCategoriesWithETag:string withHandler:^(ECAPIResponse<NSArray<ECCategory *> *> *response)
     {
         self.response = response;
     }];
}

- (void)thenRequestSentToServerWithETag:(NSString *)expected
{
    XCTAssertEqualObjects(expected, sentRequest.eTag);
}

+ (void)setSentRequest:(ECAPICategoryListRequest *)request
{
    sentRequest = request;
}

+ (ECAPICategoryListResponse *)capiResponse
{
    return capiResponse;
}

- (void)setupResponses
{
    eTagMatched304Response = [[ECAPICategoryListResponse alloc] init];
    eTagMatched304Response.networkError = [[NSError alloc] initWithDomain:@"http" code:0 userInfo:nil];
    eTagMatched304Response.httpStatusCode = 304;
    failedResponse = [[ECAPICategoryListResponse alloc] init];
    failedResponse.networkError = [[NSError alloc] initWithDomain:@"http" code:0 userInfo:nil];
    failedResponse.httpStatusCode = 500;
    oneTopLevelCategoryWith3Children = [[NSMutableArray alloc] init];
    threeTopLevelCategories = [[NSMutableArray alloc] init];
    ECAPICategory *tld = [self makeCapiCategory:@"1" withName:@"tld" treeVisibility:CategoryTreeVisibilityAll];
    [tld addChild:[self makeCapiCategory:@"2" withName:@"c1" treeVisibility:CategoryTreeVisibilityAll]];
    [tld addChild:[self makeCapiCategory:@"3" withName:@"c2" treeVisibility:CategoryTreeVisibilityAll]];
    [tld addChild:[self makeCapiCategory:@"4" withName:@"c3" treeVisibility:CategoryTreeVisibilityAll]];
    [oneTopLevelCategoryWith3Children addObject:tld];
    [threeTopLevelCategories addObjectsFromArray:tld.children];
}

- (ECAPICategory *)makeCapiCategory:(NSString *)id withName:(NSString *)name treeVisibility:(CategoryTreeVisibility)treeVisibility
{
    ECAPICategory *cat = [[ECAPICategory alloc] init];
    cat.categoryID = id;
    cat.localizedName = name;
    cat.treeVisibility = treeVisibility;
    return cat;
    
}

@end


