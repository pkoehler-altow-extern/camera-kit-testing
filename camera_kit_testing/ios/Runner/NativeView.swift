//
//  NativeView.swift
//  Runner
//
//  Created by Paul Köhler on 24.01.22.
//

import SwiftUI
import UIKit

class NativeView: UIView {
    class func instanceFromNib() -> UIView {
        return UINib(nibName: "TestView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! UIView
    }
}
