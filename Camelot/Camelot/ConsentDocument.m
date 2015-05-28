//
//  ConsentDocument.m
//  Camelot
//

#import <ResearchKit/ResearchKit.h>
#import "ConsentDocument.h"

static NSString *consentSectionSummary = @"If you wish to complete this study...";
static NSString *consentSecctionContent = @"n this study you will be asked five (wait, no, three!) questions. You will also have your voice recorded for ten seconds.";

@implementation ConsentDocument

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        self.title = @"Example Consent";
        
        // TODO: Consent sections.
        
        ORKConsentSection *sectionOverview = [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypeOverview];
        sectionOverview.title = consentSectionSummary;
        sectionOverview.content = consentSecctionContent;
        
        ORKConsentSection *sectionDataGathering = [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypeDataGathering];
        sectionDataGathering.title = consentSectionSummary;
        sectionDataGathering.content = consentSecctionContent;
        
        ORKConsentSection *sectionPrivacy = [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypePrivacy];
        sectionPrivacy.title = consentSectionSummary;
        sectionPrivacy.content = consentSecctionContent;
        
        ORKConsentSection *sectionDataUse = [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypeDataUse];
        sectionDataUse.title = consentSectionSummary;
        sectionDataUse.content = consentSecctionContent;
        
        ORKConsentSection *sectionTimeCommitment = [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypeTimeCommitment];
        sectionTimeCommitment.title = consentSectionSummary;
        sectionTimeCommitment.content = consentSecctionContent;
        
        ORKConsentSection *sectionStudySurvey = [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypeStudySurvey];
        sectionStudySurvey.title = consentSectionSummary;
        sectionStudySurvey.content = consentSecctionContent;
        
        ORKConsentSection *sectionStudyTasks = [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypeStudyTasks];
        sectionStudyTasks.title = consentSectionSummary;
        sectionStudyTasks.content = consentSecctionContent;
        
        ORKConsentSection *sectionWithdrawing = [[ORKConsentSection alloc] initWithType:ORKConsentSectionTypeWithdrawing];
        sectionWithdrawing.title = consentSectionSummary;
        sectionWithdrawing.content = consentSecctionContent;
        
        self.sections = @[sectionOverview, sectionDataGathering, sectionPrivacy, sectionDataUse, sectionTimeCommitment, sectionStudySurvey, sectionStudyTasks, sectionWithdrawing];
        
        // TODO: Signature.
        
        [self addSignature:[ORKConsentSignature signatureForPersonWithTitle:nil dateFormatString:nil identifier:@"ConsentDocumentParticipantSignature"]];
        
    }
    return self;
}

@end
