//
//  PSGenericCell.m
//  PSFoundation
//
//  Created by Peter Steinberger on 21.10.10.
//  Copyright 2010 Peter Steinberger. All rights reserved.
//

#import "PSGenericCell.h"
#import "PSGenericView.h"

@implementation PSGenericCell

@synthesize cellView;

// @override
- (void)updateOverlaySettings {
}

/// @override
- (id)initCellView {
    return nil;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if ((self = [super initWithStyle:style reuseIdentifier:reuseIdentifier])) {
        self.cellView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [self addSubview:self.cellView];
    }
    return self;
}

- (void)dealloc {
    [cellView removeFromSuperview];
    self.cellView = nil;
    [super dealloc];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
  [super setHighlighted:highlighted animated:animated];
  self.cellView.highlighted = highlighted;
  if (!animated) {
    [self updateOverlaySettings];
  }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
  self.cellView.selected = selected;
  if (!animated) {
    [self updateOverlaySettings];
  }
}

- (void)setDisplayInOverlay:(BOOL)newOverlayMode {
  self.cellView.displayInOverlay = newOverlayMode;
}

- (BOOL)isDisplayInOverlay {
  return self.cellView.displayInOverlay;
}

- (PSGenericView *)cellView {
  if (!cellView) {
      cellView = (PSGenericView *)[self initCellView];
      
      if (!cellView)
          cellView = [PSGenericView new];
  }
  return cellView;
}

@end
