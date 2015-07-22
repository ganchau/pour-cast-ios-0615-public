//
//  FISDayForcastView.m
//  pour-cast
//
//  Created by Gan Chau on 7/22/15.
//  Copyright (c) 2015 The Flatiron School. All rights reserved.
//

#import "FISDailyForecastView.h"

@interface FISDailyForecastView ()

@property (weak, nonatomic) IBOutlet UILabel *dayLabel;
@property (weak, nonatomic) IBOutlet UILabel *highTempLabel;
@property (weak, nonatomic) IBOutlet UILabel *lowTempLabel;
@property (strong, nonatomic) IBOutlet UIView *rootView;


@end

@implementation FISDailyForecastView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self commonInit];
    }
    
    return self;
}

- (void)commonInit
{
    // load nib that assigns our outlets
    
    [[NSBundle mainBundle] loadNibNamed:@"FISDailyForecastView"
                                  owner:self
                                options:nil];
    
    [self addSubview:self.rootView];
    
    NSDictionary *viewsDictionary = @{ @"rootView" : _rootView };
    
    // must set to no for both views
    self.translatesAutoresizingMaskIntoConstraints = NO;
    self.rootView.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *hConstraints= [NSLayoutConstraint constraintsWithVisualFormat:@"H:|[rootView]|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:viewsDictionary];
    NSArray *vConstraints= [NSLayoutConstraint constraintsWithVisualFormat:@"V:|[rootView]|"
                                                                   options:0
                                                                   metrics:nil
                                                                     views:viewsDictionary];
    [self addConstraints:hConstraints];
    [self addConstraints:vConstraints];
    
    
    self.dayLabel.text = @"test";

}

- (void)setDailyForecast:(FISDailyForecast *)forecast
{
    _dailyForecast = forecast;
    [self updateUI];
    
}

- (void)updateUI;
{
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"MM/dd"];
    
    NSString *dateString = [format stringFromDate:self.dailyForecast.date];
    NSString *maxTemp = [NSString stringWithFormat:@"High: %.1fF", self.dailyForecast.temperatureMax];
    NSString *minTemp = [NSString stringWithFormat:@"Low: %.1fF", self.dailyForecast.temperatureMin];
    
    self.dayLabel.text = dateString;
    self.highTempLabel.text = maxTemp;
    self.lowTempLabel.text = minTemp;
}

@end
