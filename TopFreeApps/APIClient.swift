//
//  APIClient.swift
//  TopFreeApps
//
//  Created by king on 5/4/18.
//  Copyright © 2018 king. All rights reserved.
//

import UIKit

class APIClient: NSObject {
    
    func fectchAppList(completion: @escaping ([NSDictionary]?) -> Void) {
        
        guard let url = URL.init(string: "https://api.github.com/users/mralexgray/repos") else{
            print("url is incorrect")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            
            guard let unwrapperdData = data else{ return }
            
            do{
                if let jsonObject = try JSONSerialization.jsonObject(with: unwrapperdData, options: .allowFragments) as? [NSDictionary]{
                    
                    completion(jsonObject)
                }
            }
            catch{
              completion(nil)
                print("error in connection")
            }
        }
        
        dataTask.resume()
    }
}
