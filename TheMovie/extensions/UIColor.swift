//
//  UIColor.swift
//  TheMovie
//
//  Created by Erlanda mansaku on 11.10.20.
//  Copyright © 2020 Erlanda mansaku. All rights reserved.
//

import UIKit

extension UIColor{
    func RGB(_ r:CGFloat, _ g:CGFloat, _ b:CGFloat) -> UIColor {
        return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1)
    }
}

public struct ColorDesign{

    public static let darkGrayColor : UIColor = UIColor().RGB(31, 31, 31)
    public static let blackColor : UIColor = UIColor.black
    public static let orangeColor : UIColor = UIColor().RGB(255, 156, 0)

    public static let lightGray :UIColor = UIColor().RGB(187, 193, 200)
    public static let emptyBlueStar :UIColor = UIColor().RGB(28, 68, 91)
    public static let whiteSmoke : UIColor = UIColor().RGB(245, 245, 245)
}
