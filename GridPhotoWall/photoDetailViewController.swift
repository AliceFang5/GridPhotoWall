//
//  photoDetailViewController.swift
//  GridPhotoWall
//
//  Created by 方芸萱 on 2020/9/17.
//

import UIKit

class photoDetailViewController: UIViewController {
    var photoCount = 0
    var photoIndex = 0

    @IBOutlet weak var photoImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.image = UIImage(named: "photo-\(photoIndex)")
        print("index:\(photoIndex)")
//        print(photoCount)
    }
    
    @IBAction func gestureLeftShowNext(_ sender: UISwipeGestureRecognizer) {
        if photoIndex == (photoCount - 1){
            photoIndex = 0
        }else{
            photoIndex += 1
        }
        photoImageView.image = UIImage(named: "photo-\(photoIndex)")
        print("index:\(photoIndex)")
    }
    @IBAction func gestureRightShowLast(_ sender: UISwipeGestureRecognizer) {
        if photoIndex == 0{
            photoIndex = photoCount - 1
        }else{
            photoIndex -= 1
        }
        photoImageView.image = UIImage(named: "photo-\(photoIndex)")
        print("index:\(photoIndex)")
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
