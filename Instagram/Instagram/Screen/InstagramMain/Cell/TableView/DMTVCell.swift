//
//  DMTVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/15.
//

import UIKit

class DMTVCell: UITableViewCell {
    
    static let identifier = "DMTVCell"

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var circleView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        circleView.layer.cornerRadius = circleView.frame.width/2
    }

    static func nib() -> UINib {
        return UINib(nibName: "DMTVCell", bundle: nil)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Functions
    func setCell(message: DMessage){
        circleView.image = UIImage(named: message.CircleView)
        idLabel.text = message.IdLabel
        contentsLabel.text = message.ContentsLabel
    }
    
}

