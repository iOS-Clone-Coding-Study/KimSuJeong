//
//  ImageCVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/07.
//

import UIKit

class ImageCVCell: UICollectionViewCell {
    
    static let identifier = "ImageCVCell"
    
    // MARK: IBOutlet
    @IBOutlet weak var imageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    // MARK: TableView에 뿌려줄 Collectionview Data
    func setCell(post: Rec){
        imageView.image = UIImage(named: post.RecImage)
    }
    
    
    static func nib() -> UINib{
        return UINib(nibName: "ImageCVCell", bundle: nil)
    }
    
}
