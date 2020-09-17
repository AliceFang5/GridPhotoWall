//
//  profileEditTableViewController.swift
//  GridPhotoWall
//
//  Created by 方芸萱 on 2020/9/16.
//

import UIKit

class profileEditTableViewController: UITableViewController {

    @IBOutlet var profileEditTextField: [UITextField]!
    
    @IBOutlet weak var genderSegment: UISegmentedControl!
    var profile:Profile?
    override func viewDidLoad() {
        super.viewDidLoad()
        updateProfile()
    }
    func updateProfile(){
        if let person = Profile.readProfileFromFile(){
            profile = person
            profileEditTextField[0].text = person.name
            profileEditTextField[1].text = person.age.description
            profileEditTextField[2].text = person.birthday
            genderSegment.selectedSegmentIndex = person.gender.rawValue
        }else{
            profileEditTextField[0].placeholder = "陳小美"
            profileEditTextField[1].placeholder = "18"
            profileEditTextField[2].placeholder = "0505"
        }
    }

    @IBAction func save(_ sender: UIBarButtonItem) {
        guard profileEditTextField[0].text != "" else {
            let alert = UIAlertController(title: "請輸入姓名", message: "範例：陳小美", preferredStyle: .alert)
            let action = UIAlertAction(title: "好的", style: .cancel) { (_) in }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        guard profileEditTextField[1].text != "" else {
            let alert = UIAlertController(title: "請輸入年齡", message: "範例：16", preferredStyle: .alert)
            let action = UIAlertAction(title: "好的", style: .cancel) { (_) in }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        guard profileEditTextField[2].text != "" else {
            let alert = UIAlertController(title: "請輸入生日", message: "範例：0101", preferredStyle: .alert)
            let action = UIAlertAction(title: "好的", style: .cancel) { (_) in }
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        let name = profileEditTextField[0].text!
        let age = Int(profileEditTextField[1].text!) ?? 16
        let birthday = profileEditTextField[2].text!

        let person = Profile(name: name, age: age, birthday: birthday, gender: Gender(rawValue: genderSegment.selectedSegmentIndex)!)
        print(person)
        profile = person
        Profile.saveToFile(profile: person)
    }

    // MARK: - Table view data source

    /*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    */

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
