//
//  FriendsTVCell.swift
//  Instagram
//
//  Created by 김수정 on 2021/06/07.
//

import UIKit

class FriendsTVCell: UITableViewCell {
    
    static let identifier = "FriendsTVCell"
    
    // MARK: IBOutlets
    @IBOutlet weak var idImage: UIImageView!
    @IBOutlet weak var idName: UILabel!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var goodLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var contentsLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var heartCount: UILabel!
    @IBOutlet weak var bookMarkButton: UIButton!
    @IBOutlet weak var FriendsCVCell: UICollectionView!
    
    // MARK: Properties
    var post : [Rec] = []
    var minItemSpacing = 10
    var heartCo = 0
    
    static func nib() -> UINib{
        return UINib(nibName: "FriendsTVCell", bundle: nil)
    }
    
    // MARK: TableView Data
    func setCell(data: RecData){
        idImage.image = UIImage(named: data.IdImage)
        idName.text = data.IdName
        goodLabel.text = data.GoodLabel
        idLabel.text = data.IdLabel
        contentsLabel.text = data.ContentsLabel
        timeLabel.text = data.TimeLabel
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Cell 등록 및 연결
        self.FriendsCVCell.register(ImageCVCell.nib(), forCellWithReuseIdentifier: ImageCVCell.identifier)
        
        // DataSource & Delegate
        self.FriendsCVCell.dataSource = self
        self.FriendsCVCell.delegate = self
        
        // Style
        self.FriendsCVCell.contentInsetAdjustmentBehavior = .never
        self.FriendsCVCell.decelerationRate = .fast
        idImage.layer.cornerRadius = idImage.frame.height/2
        
        goodLabel.isHidden = true
        heartCount.isHidden = true
        // pageControl.transform = CGAffineTransform(scaleX: 1, y: 1)
    }
    

    
    // MARK: PageControl 초기 Layout 설정
    func pageControlInitLayout() {
        pageControl.numberOfPages = post.count
        self.pageControl.allowsContinuousInteraction = true
        pageControl.currentPageIndicatorTintColor = .systemBlue
        
//        pageControl.transform = CGAffineTransform.init(scaleX: 1/2, y: 1/2)
        //pageControl?.transform = CGAffineTransform(scaleX: 1.4, y: 1.4)
    }
    
    // MARK: IBAction
    // 북마크 상태변화
    @IBAction func touchUpBookMark(_ sender: UIButton) {
        if sender.isSelected == false {
            sender.isSelected = true
            bookMarkButton.tintColor = .black
        }else{
            sender.isSelected = false
            bookMarkButton.tintColor = .black
        }
    }
    
    // 하트 상태변화
    @IBAction func goodAction(_ sender: UIButton) {
        if sender.isSelected == false {
            sender.isSelected = true
            likeButton.tintColor = .systemPink
            heartCo += 1
            heartCount.text = String(heartCo)+"개"
            goodLabel.isHidden = false
            heartCount.isHidden = false
        }else{
            sender.isSelected = false
            likeButton.tintColor = .black
            heartCo -= 1
            heartCount.text = String(heartCo)
            goodLabel.isHidden = true
            heartCount.isHidden = true
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

// MARK: PageControl과 ImageView 연결
// UIScrollViewDelegate의 메소드
// 스크롤 한 후 움직임이 점차 줄어들 때 호출
// ScrollView의 ContentsOffset과 frame 상의 너비를 비교하여 현재 Page를 구할 수 있음
extension FriendsTVCell {
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage =
            Int(scrollView.contentOffset.x)/Int(scrollView.frame.width)
    }
    
}

extension FriendsTVCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCVCell.identifier, for: indexPath) as? ImageCVCell else{
            return UICollectionViewCell()
        }
        cell.setCell(post: post[indexPath.item])
        return cell
    }
    func updateCellWith(row: [Rec]) {
        self.post = row
        self.FriendsCVCell.reloadData()
    }
}

// MARK: FlowLayout
extension FriendsTVCell: UICollectionViewDelegateFlowLayout{
    
    // Cell 사이즈 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        return CGSize(width: (collectionView.frame.width), height: collectionView.frame.height)
    }
    
    // Cell 간의 위아래 간격 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // Cell 간의 좌우 간격 조정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // CollectionView ContentInset 지정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    // Paging Effect
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let cellWidthIncludeSpacing = (self.FriendsCVCell.frame.width)
        var offset = targetContentOffset.pointee
        let index = (offset.x + scrollView.contentInset.left) / cellWidthIncludeSpacing
        let roundedIndex: CGFloat = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthIncludeSpacing, y: scrollView.contentInset.top)
        targetContentOffset.pointee = offset
    }
}

