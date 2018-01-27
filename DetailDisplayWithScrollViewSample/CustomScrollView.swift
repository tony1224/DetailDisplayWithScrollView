//
//  CustomScrollView.swift
//  DetailDisplayWithScrollViewSample
//
//  Created by Morita Jun on 2018/01/27.
//  Copyright © 2018年 test. All rights reserved.
//

import UIKit

class CustomScrollView: UIScrollView {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        superview?.touchesBegan(touches, with: event)
    }

}
