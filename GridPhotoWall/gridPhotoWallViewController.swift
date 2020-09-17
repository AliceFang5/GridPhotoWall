//
//  gridPhotoWallViewController.swift
//  GridPhotoWall
//
//  Created by 方芸萱 on 2020/9/14.
//

import UIKit

class gridPhotoWallViewController: UIViewController{

    @IBOutlet weak var collectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet var profileLabel: [UILabel]!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var profile:Profile?
    let photoCount = 20
    var photoIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionViewFlowLayout()
        updateProfile()
    }
    override func viewWillAppear(_ animated: Bool) {
        updateProfile()
    }
    func updateProfile(){
        if let person = Profile.readProfileFromFile(){
            profile = person
            profileLabel[0].text = person.name
            profileLabel[1].text = person.birthday
            if person.gender == .male{
                profileImageView.image = UIImage(named: "male")
            }else{
                profileImageView.image = UIImage(named: "female")
            }
        }
    }

    func initCollectionViewFlowLayout(){
        let width = floor((UIScreen.main.bounds.width - 20 - 3 * 2 ) / 3)
        collectionViewFlowLayout.estimatedItemSize = .zero
        collectionViewFlowLayout.minimumLineSpacing = 3
        collectionViewFlowLayout.minimumInteritemSpacing = 3
        collectionViewFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        collectionViewFlowLayout.itemSize = CGSize(width: width, height: width)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        print(self,#function)
//        print(collectionView.indexPathsForSelectedItems![0])//ex:[[0,2]]
        let indexpath = collectionView.indexPathsForSelectedItems![0]
//        print(indexpath[1])//ex:[0,2]
        photoIndex = indexpath[1]
        if let controller = segue.destination as? photoDetailViewController{
            controller.photoCount = photoCount
            controller.photoIndex = photoIndex
        }
    }
}
extension gridPhotoWallViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoCount
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(photoCollectionViewCell.self)", for: indexPath) as! photoCollectionViewCell
        cell.update()
        cell.imageView.image = UIImage(named: "photo-\(indexPath.item)")
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        later than func prepare
//        photoIndex = indexPath.item
//        print("didSelectItemAt:\(photoIndex)")
    }
}

