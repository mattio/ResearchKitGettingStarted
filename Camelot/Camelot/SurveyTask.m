//
//  SurveyTask.m
//  Camelot
//

#import <ResearchKit/ResearchKit.h>
#import "SurveyTask.h"

@implementation SurveyTask

- (instancetype)init
{
    // TODO: Add instructions step.
    ORKInstructionStep *instructionStep = [[ORKInstructionStep alloc] initWithIdentifier:@"IntroStep"];
    instructionStep.title = @"The Questions Three";
    instructionStep.text = @"Who would cross the Bridge of Death must answer me these questions three, ere the other side they see.";
    
    // TODO: Add name question.
    ORKTextAnswerFormat *nameAnswerFormat = [[ORKTextAnswerFormat alloc] init];
    nameAnswerFormat.multipleLines = NO;
    ORKQuestionStep *nameStep = [ORKQuestionStep questionStepWithIdentifier:@"QuestionStep" title:@"What is your name?" answer:nameAnswerFormat];
    
    // TODO: Add 'what is your quest' question.
    NSArray *textChoices = @[[ORKTextChoice choiceWithText:@"Create a ResearchKit app" value:@"0"],
                             [ORKTextChoice choiceWithText:@"Seek the Holy Grail" value:@"1"],
                             [ORKTextChoice choiceWithText:@"Find a shrubbery" value:@"2"]];
    ORKTextChoiceAnswerFormat *questAnswerFormat = [[ORKTextChoiceAnswerFormat alloc] initWithStyle:ORKChoiceAnswerStyleSingleChoice textChoices:textChoices];
    ORKQuestionStep *questStep = [ORKQuestionStep questionStepWithIdentifier:@"TextChoiceQuestionStep" title:@"What is your quest?" answer:questAnswerFormat];
    
    // TODO: Add color question step.
    NSArray *imageChoices = @[[ORKImageChoice choiceWithNormalImage:[UIImage imageNamed:@"red"] selectedImage:nil text:@"Red" value:@"Red"],
                              [ORKImageChoice choiceWithNormalImage:[UIImage imageNamed:@"orange"] selectedImage:nil text:@"Orange" value:@"Orange"],
                              [ORKImageChoice choiceWithNormalImage:[UIImage imageNamed:@"yellow"] selectedImage:nil text:@"Yellow" value:@"Yellow"],
                              [ORKImageChoice choiceWithNormalImage:[UIImage imageNamed:@"green"] selectedImage:nil text:@"Green" value:@"Green"],
                              [ORKImageChoice choiceWithNormalImage:[UIImage imageNamed:@"blue"] selectedImage:nil text:@"Blue" value:@"Blue"],
                              [ORKImageChoice choiceWithNormalImage:[UIImage imageNamed:@"purple"] selectedImage:nil text:@"Purple" value:@"Purple"]];
    ORKImageChoiceAnswerFormat *colorAnswerFormat = [ORKAnswerFormat choiceAnswerFormatWithImageChoices:imageChoices];
    ORKQuestionStep *colorStep = [ORKQuestionStep questionStepWithIdentifier:@"ImageChoiceQuestionStep" title:@"What is your favorite color" answer:colorAnswerFormat];
    
    // TODO: Add summary step.
    ORKCompletionStep *summaryStep = [[ORKCompletionStep alloc] initWithIdentifier:@"SummaryStep"];
    summaryStep.title = @"Right. Off you go!";
    summaryStep.text = @"That was easy.";
    
    self = [super initWithIdentifier:@"ConsentTask" steps:@[instructionStep, nameStep, questStep, colorStep, summaryStep]];
    
    return self;
}

@end
