//
//  RecomCardCVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/09.
//

import UIKit

class RecomCardCVCell: UICollectionViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var idName: UILabel!
    @IBOutlet weak var followBtn: UIButton!
    @IBOutlet weak var xBtn: UIButton!
    @IBOutlet weak var whiteView: UIView!
    @IBOutlet weak var contentsLabel: UILabel!
    
    static let identifier = "RecomCardCVCell"
    
    // MARK: TableView에 뿌려줄 Collectionview Data
    func setCell(card: Card) {
        imageView.image = UIImage(named: card.ImageView)
        idName.text = card.IdName
        contentsLabel.text = card.ContentsLabel
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Style
        imageView.layer.cornerRadius = imageView.frame.height/2
        followBtn.layer.cornerRadius = 5
        whiteView.layer.cornerRadius = 5
        whiteView.layer.borderWidth = 0.5
        whiteView.layer.borderColor = UIColor.systemGray4.cgColor
    }
    
    static func nib() -> UINib {
        return UINib (nibName: "RecomCardCVCell", bundle: nil)
    }
}

