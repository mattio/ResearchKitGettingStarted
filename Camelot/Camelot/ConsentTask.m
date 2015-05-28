//
//  ConsentTask.m
//  Camelot
//

#import "ConsentTask.h"
#import "ConsentDocument.h"

@implementation ConsentTask

- (instancetype)init
{
    // TODO: Add visual consent step.
    
    ConsentDocument *consentDocument = [[ConsentDocument alloc] init];
    ORKVisualConsentStep *visualConsentStep = [[ORKVisualConsentStep alloc] initWithIdentifier:@"VisualConsentStep" document:consentDocument];
    
    // TODO: Add consent review step.
    
    ORKConsentSignature *signature = [consentDocument.signatures lastObject];
    ORKConsentReviewStep *reviewConsentStep = [[ORKConsentReviewStep alloc] initWithIdentifier:@"ConsentReviewStep" signature:signature inDocument:consentDocument];
    reviewConsentStep.text = @"Review Consent!";
    reviewConsentStep.reasonForConsent = @"Consent to join study";
    
    self = [super initWithIdentifier:@"ConsentTask" steps:@[visualConsentStep, reviewConsentStep]];
    
    return self;
}

@end
