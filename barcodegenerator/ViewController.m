//
//  ViewController.m
//  barcodegenerator
//
//  Created by Polaris on 10/12/16.
//  Copyright © 2016 bottle.society. All rights reserved.
//

#import "ViewController.h"
#import "ZXingObjC.h"

@interface ViewController ()

@property (strong, nonatomic) IBOutlet UITextField *txt1;
@property (strong, nonatomic) IBOutlet UIImageView *image1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)onGenerator:(id)sender {
    
    NSError *error = nil;
    ZXMultiFormatWriter *writer = [ZXMultiFormatWriter writer];
    ZXBitMatrix* result = [writer encode:self.txt1.text
                                  format:kBarcodeFormatCode128//kBarcodeFormatQRCode
                                   width:500
                                  height:500
                                   error:&error];
    if (result) {
        CGImageRef image = [[ZXImage imageWithMatrix:result] cgimage];
        
        [self.image1 setImage:[UIImage imageWithCGImage:image]];
        
        // This CGImageRef image can be placed in a UIImage, NSImage, or written to a file.
    } else {
        NSString *errorMessage = [error localizedDescription];
        NSLog(@"%@", errorMessage);
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
