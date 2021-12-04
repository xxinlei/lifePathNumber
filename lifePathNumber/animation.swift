//
//  animation.swift
//  lifePathNumber
//
//  Created by 楊昕蕾 on 2021/12/2.
//

import Foundation
import UIKit

class animation {
 
    static func twinkling(_ stars: [UIImageView], duration: Double){
        for i in 0...stars.count-1{
            UIImageView.animate(withDuration: duration, delay: Double(i)*0.3, options: [.repeat, .autoreverse], animations: {stars[i].transform = CGAffineTransform(scaleX: 0.1, y: 0.1)}, completion: nil)
    }
}
    
    static func rotate(_ moon: UIImageView){
        UIImageView.animate(withDuration: 3, delay: 0, options: [.repeat, .autoreverse], animations: {moon.transform = CGAffineTransform(rotationAngle: 360)}, completion: nil)
    }

}
