//
//  photoCollectionViewCell.swift
//  GridPhotoWall
//
//  Created by 方芸萱 on 2020/9/14.
//

import UIKit

class photoCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var imageWidthConstraint: NSLayoutConstraint!
    static let width = floor((UIScreen.main.bounds.width - 20 - 3 * 2 ) / 3 )
    func update(){
        imageView.contentMode = .scaleAspectFill
    }
    override func awakeFromNib() {
        super.awakeFromNib()
//        imageWidthConstraint.constant = Self.width
    }
    
}
