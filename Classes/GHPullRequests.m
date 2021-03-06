#import "GHPullRequests.h"
#import "GHPullRequest.h"
#import "GHRepository.h"


@implementation GHPullRequests

- (id)initWithResourcePath:(NSString *)path {
	self = [super init];
	if (self) {
		self.resourcePath = path;
	}
	return self;
}

- (id)initWithRepository:(GHRepository *)repo andState:(NSString *)state {
	NSString *path = [NSString stringWithFormat:kPullRequestsFormat, repo.owner, repo.name, state];
	self = [self initWithResourcePath:path];
	if (self) {
		self.repository = repo;
		self.pullState = state;
	}
	return self;
}

- (void)setValues:(id)values {
	self.items = [NSMutableArray array];
	for (NSDictionary *dict in values) {
		GHPullRequest *pullRequest = [[GHPullRequest alloc] initWithRepository:self.repository];
		[pullRequest setValues:dict];
		[self addObject:pullRequest];
	}
}

@end