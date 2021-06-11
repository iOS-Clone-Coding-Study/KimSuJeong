//
//  CircleCVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/01.
//

import UIKit

class CircleCVCell: UICollectionViewCell {
    
    static let identifier = "CircleCVCell"
    
    // MARK: IBOutlets
    @IBOutlet weak var plusBtn: UIView!
    @IBOutlet weak var circleStoryImage: UIImageView!
    @IBOutlet weak var circleStoryName: UILabel!
    
    // MARK: TableView에 뿌려줄 Collectionview Data
    func setCell(story: Circle){
        circleStoryImage.image = UIImage(named: story.CircleStoryImage)
        circleStoryName.text = story.CircleStoryName
    }
    
    static func nib() -> UINib{
        return UINib(nibName: "CircleCVCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Style
        circleStoryImage.layer.cornerRadius = circleStoryImage.frame.height/2
        circleStoryImage.layer.masksToBounds = true
        plusBtn.layer.cornerRadius = plusBtn.frame.height/2
    }
    
    // MARK: 스토리 0번 인덱스에만 값 다르게 주기위해 지정
    func setFirstIndex() {
        plusBtn.isHidden = false
        circleStoryName.text = "내 스토리"
    }
    func setIndex() {
        plusBtn.isHidden = true
    }
}

