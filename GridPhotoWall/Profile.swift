//
//  profile.swift
//  GridPhotoWall
//
//  Created by 方芸萱 on 2020/9/16.
//

import Foundation

enum Gender:Int, Codable {
    case male, female
}
struct Profile:Codable{
    let name:String
    let age:Int
    let birthday:String
    let gender:Gender
    static func readProfileFromFile() -> Profile? {
        let userDefaults = UserDefaults.standard
        let propertyDecoder = PropertyListDecoder()
        if let data = userDefaults.data(forKey: "profile"), let profile = try? propertyDecoder.decode(Profile.self, from: data){
            return profile
        }else{
            return nil
        }
    }
    
    static func saveToFile(profile:Profile){
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(profile){
            let userDefaults = UserDefaults.standard
            userDefaults.set(data, forKey: "profile")
        }
    }
}

