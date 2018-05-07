//
//  ViewModel.swift
//  TopFreeApps
//
//  Created by king on 5/4/18.
//  Copyright © 2018 king. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    @IBOutlet var apiClient: APIClient!
    
    var apps: [NSDictionary]?
    
    func getApps(completion: @escaping () -> Void){
        
        apiClient.fectchAppList { (arrayOfAppsDictionaries) in
            
            DispatchQueue.main.async {
                self.apps = arrayOfAppsDictionaries
                completion()
            }
        }
    }
    
    func getNumberOfApps(section: Int) -> Int {
        return self.apps?.count ?? 0
    }
    
    func getNameOfApp(for indexpath:IndexPath) -> NSString{
        return self.apps?[indexpath.row].value(forKey: "name") as? NSString ?? "did not got value"
    }
    
    func getAppDiscription(for indexpath: IndexPath) -> String {
        return self.apps?[indexpath.row].value(forKeyPath: "description") as? String ?? ""
    }
}
