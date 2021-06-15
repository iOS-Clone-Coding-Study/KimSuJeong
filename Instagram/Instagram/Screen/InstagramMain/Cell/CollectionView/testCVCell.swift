//
//  testCVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/15.
//

import UIKit

class testCVCell: UICollectionViewCell {
    static let reuseIdentifier = "TabPageCell"
    lazy var backColor: [UIColor] = [.lightGray, .purple, .orange, .cyan, .magenta]
    
    func setColor(index: Int){ self.backgroundColor = backColor[index] }
    
    
}
