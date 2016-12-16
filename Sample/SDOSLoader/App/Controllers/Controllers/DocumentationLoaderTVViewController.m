//
//  DocumentationAFNetwJSONModelTVViewController.m
//  SDOSAFNetworkingJSONModel
//
//  Created by José Manuel Velázquez on 14/12/16.
//  Copyright © 2016 SDOS. All rights reserved.
//

#import "DocumentationLoaderTVViewController.h"
#import "ConstantsWS.h"

#define SEE_EXAMPLE_TEXT NSLocalizedString(@"Example.btnTitle", @"")
#define VERSION_STR_FORMAT NSLocalizedString(@"Example.version", @"")
#define GO_BACK_BUTTON_TITLE @"<"
#define GO_FORWARD_BUTTON_TITLE @">"

#define EXAMPLE_ALERT_OK_ACTION_TITLE NSLocalizedString(@"Example.alertOkActionTitle", @"")
#define EXAMPLE_ALERT_MSG NSLocalizedString(@"Example.alertMsg", @"")

@interface DocumentationLoaderTVViewController ()
@property (weak, nonatomic) IBOutlet UILabel *lbUrlDocumentacion;
@property (weak, nonatomic) IBOutlet UILabel *versionDocumentacion;
@property (weak, nonatomic) IBOutlet UIButton *btnSeeExample;
@end

@implementation DocumentationLoaderTVViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = (NSString *)[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    [self.btnSeeExample setTitle:SEE_EXAMPLE_TEXT forState:UIControlStateNormal];
    [self.lbUrlDocumentacion loadStyleLabelFontSizeBig];
    self.lbUrlDocumentacion.text = DOCUMENTATION_URL;
    self.versionDocumentacion.text = [NSString stringWithFormat:VERSION_STR_FORMAT, [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
