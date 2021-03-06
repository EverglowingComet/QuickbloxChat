//
//  OpponentCollectionViewCell.m
//  QBRTCChatSemple
//
//  Created by Andrey Ivanov on 11.12.14.
//  Copyright (c) 2014 QuickBlox Team. All rights reserved.
//

#import "OpponentCollectionViewCell.h"
#import "CornerView.h"

@interface OpponentCollectionViewCell()

@property (weak, nonatomic) IBOutlet CornerView *colorMarker;
@property (weak, nonatomic) IBOutlet UIImageView *userPhoto;
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation OpponentCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    self.backgroundColor = [UIColor whiteColor];//[UIColor blackColor];
	self.statusLabel.backgroundColor = [UIColor whiteColor];//[UIColor colorWithRed:0.9441 green:0.9441 blue:0.9441 alpha:0.350031672297297];
    self.statusLabel.textColor = [UIColor blackColor];
    self.statusLabel.text = @"";
}

- (void)setVideoView:(UIView *)videoView {
    
    if (_videoView != videoView) {

        [_videoView removeFromSuperview];
        _videoView = videoView;
        _videoView.frame = self.bounds;
        [self.containerView insertSubview:_videoView aboveSubview:self.statusLabel];
    }
}

- (void)setColorMarkerText:(NSString *)text andColor:(UIColor *)color {
    
    self.colorMarker.bgColor = color;
    self.colorMarker.title = text;
}

- (void)setUserPhotoImg:(UIImage *) img{
    if(img == nil)
        [self.userPhoto setImage:[UIImage imageNamed:@"placeholder_regular.png"]];
    else
        [self.userPhoto setImage:img];
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    if (CGRectEqualToRect(_videoView.bounds, self.bounds)) {
        
        return;
    }
    _videoView.frame = self.bounds;
    self.userPhoto.frame = CGRectMake((self.bounds.size.width - self.userPhoto.frame.size.width) / 2.0, (self.bounds.size.height - self.userPhoto.frame.size.height) / 2.0, self.userPhoto.frame.size.width, self.userPhoto.frame.size.height);
//    self.userPhoto.frame = _videoView.frame;
}

- (void)setConnectionState:(QBRTCConnectionState)connectionState {
    
    if (_connectionState != connectionState) {
        _connectionState = connectionState;
        
        switch (connectionState) {
                
            case QBRTCConnectionNew:
                
                self.statusLabel.text = @"New";
                
                break;
                
            case QBRTCConnectionPending:
                
                self.statusLabel.text = @"Pending";
//                [self.activityIndicator stopAnimating];
                
                break;
                
            case QBRTCConnectionChecking:
                
                self.statusLabel.text = @"Checking";
//                [self.activityIndicator startAnimating];
    
                break;
                
            case QBRTCConnectionConnecting:
                
                self.statusLabel.text = @"Connecting";
//                [self.activityIndicator startAnimating];
                
                break;
                
            case QBRTCConnectionConnected:
                
                self.statusLabel.text = @"Connected";
//                [self.activityIndicator stopAnimating];
                
                break;
                
            case QBRTCConnectionClosed:
                
                self.statusLabel.text = @"Closed";
//                [self.activityIndicator stopAnimating];
                
                break;
                
            case QBRTCConnectionHangUp:
                
                self.statusLabel.text = @"Hung Up";
//                [self.activityIndicator stopAnimating];
                
                break;
                
            case QBRTCConnectionRejected:
                
                self.statusLabel.text = @"Rejected";
//                [self.activityIndicator stopAnimating];
                
                break;
                
            case QBRTCConnectionNoAnswer:
                
                self.statusLabel.text = @"No Answer";
//                [self.activityIndicator stopAnimating];
                
                break;
                
            case QBRTCConnectionDisconnectTimeout:
                
                self.statusLabel.text = @"Time out";
//                [self.activityIndicator stopAnimating];
                
                break;
                
            case QBRTCConnectionDisconnected:
                
                self.statusLabel.text = @"Disconnected";
//                [self.activityIndicator startAnimating];
                
                break;
            default:
                break;
        }
    }
}

@end
