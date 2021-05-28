//
//  testViewController.swift
//  AppleMusic
//
//  Created by 김수정 on 2021/05/28.
//

import UIKit

class testViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "둘러보기"
           //navigationController?.navigationBar.prefersLargeTitles = true
//                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                      //self.navigationController?.navigationBar.shadowImage = UIImage()
                      self.navigationController?.navigationBar.isTranslucent = true
        self.tabBarController?.tabBar.isTranslucent = true
        self.tabBarController?.tabBar.isOpaque = true
        self.tabBarController?.view.backgroundColor = .clear
                      self.navigationController?.view.backgroundColor = .clear


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
