//
//  ViewController.m
//  Camelot
//

#import <ResearchKit/ResearchKit.h>
#import "ViewController.h"
#import "ConsentTask.h"
#import "SurveyTask.h"

@interface ViewController () <ORKTaskViewControllerDelegate>

@end

@implementation ViewController

- (IBAction)consentTapped:(id)sender
{
    // NOTE: Should we have used the designated initializer the class or is init okay? Suspect the former. Research.
    ConsentTask *consentTask = [[ConsentTask alloc] init];
    
    ORKTaskViewController *taskViewController = [[ORKTaskViewController alloc] initWithTask:consentTask taskRunUUID:nil];
    taskViewController.delegate = self;
    
    [self presentViewController:taskViewController animated:YES completion:nil];
}

- (IBAction)surveyTapped:(id)sender
{
    // NOTE: Should we have used the designated initializer the class or is init okay? Suspect the former. Research.
    SurveyTask *surveyTask = [[SurveyTask alloc] init];
    
    ORKTaskViewController *taskViewController = [[ORKTaskViewController alloc] initWithTask:surveyTask taskRunUUID:nil];
    taskViewController.delegate = self;
    
    [self presentViewController:taskViewController animated:YES completion:nil];
}

- (IBAction)microphoneTapped:(id)sender
{
    // NOTE: I dropped the MicrophoneTask subclass here.
    //MicrophoneTask *microphoneTask = [[MicrophoneTask alloc] init];
    ORKOrderedTask *microphoneTask = [ORKOrderedTask audioTaskWithIdentifier:@"AudioTask"
                                                      intendedUseDescription:@"A sentence prompt will be given to you to read."
                                                           speechInstruction:@"These are the last dying words of Joseph of Aramathea"
                                                      shortSpeechInstruction:@"The Holy Grail can be found in the Castle of Aaaaaaaaaaah"
                                                                    duration:10
                                                           recordingSettings:nil
                                                                     options:ORKPredefinedTaskOptionNone];
    
    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [documentDirectories firstObject];
    
    ORKTaskViewController *taskViewController = [[ORKTaskViewController alloc] initWithTask:microphoneTask taskRunUUID:nil];
    taskViewController.delegate = self;
    taskViewController.outputDirectory = [NSURL fileURLWithPath:documentDirectory isDirectory:YES];
    
    [self presentViewController:taskViewController animated:YES completion:nil];
}

#pragma mark - ORKTaskViewControllerDelegate

-(void)taskViewController:(ORKTaskViewController * __nonnull)taskViewController
      didFinishWithReason:(ORKTaskViewControllerFinishReason)reason
                    error:(nullable NSError *)error
{
    // Handle results of taskViewController.result
    [taskViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
