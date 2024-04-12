//
//  Networking.swift
//  GOTApplication
//
//  Created by Rania Arbash on 2024-04-12.
//

import Foundation


protocol networkingDelegate{
    func gettingListIsDone(list : [GOTCharacter])
}

class Networking2Service {
    var delegate : networkingDelegate?
    static var shared = Networking2Service()
    
    func getListOfGOTCharacters(completiongHandler: @escaping ([GOTCharacter])->Void){
        let urlObj = URL(string: "https://raw.githubusercontent.com/RaniaArbash/GOT_Data/main/GOT.json")!
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            if error != nil {
                            return
                        }
            guard let httpResponse = response as? HTTPURLResponse,
                              (200...299).contains(httpResponse.statusCode) else {
                            return
                        }
            
            if let jsonString = String(data: data!, encoding: .utf8) {
                print(jsonString)
                do {
                    var chartereList = [GOTCharacter]()
                    //var list = try JSONDecoder().decode([GOTCharacter].self, from: data!)
                    var list = try JSONSerialization.jsonObject(with: data!) as! NSArray
                    for char in list {
                        let dic = (char as! NSDictionary)
                        let name = dic.value(forKey: "characterName")
                        let actorName = dic.value(forKey: "actorName")
                        let image = dic.value(forKey: "characterImageThumb")
                        if let goodImage = image {
                            if let goodname = name {
                                if let goodActor = actorName {
                                    chartereList.append(GOTCharacter(characterName: goodname as! String, actorName: goodActor as! String, characterImageThumb: goodImage as! String))
                                }
                            }
                         
                               
                            }
                        
                    }
                    DispatchQueue.main.async {
                        completiongHandler(chartereList)
                    }
                }catch {
                    print(error)
                }
                
            }
            
        }
        task.resume()
    }
    
    
    func getListOfGOTCharacters(){
        let urlObj = URL(string: "https://raw.githubusercontent.com/RaniaArbash/GOT_Data/main/GOT.json")!
        let task = URLSession.shared.dataTask(with: urlObj) { data, response, error in
            if error != nil {
                            return
                        }
            guard let httpResponse = response as? HTTPURLResponse,
                              (200...299).contains(httpResponse.statusCode) else {
                            return
                        }
            
            if let jsonString = String(data: data!, encoding: .utf8) {
                print(jsonString)
                do {
                    var chartereList = [GOTCharacter]()
                    //var list = try JSONDecoder().decode([GOTCharacter].self, from: data!)
                    var list = try JSONSerialization.jsonObject(with: data!) as! NSArray
                    for char in list {
                        let dic = (char as! NSDictionary)
                        let name = dic.value(forKey: "characterName")
                        let actorName = dic.value(forKey: "actorName")
                        let image = dic.value(forKey: "characterImageThumb")
                        if let goodImage = image {
                            if let goodname = name {
                                if let goodActor = actorName {
                                    chartereList.append(GOTCharacter(characterName: goodname as! String, actorName: goodActor as! String, characterImageThumb: goodImage as! String))
                                }
                            }
                         
                               
                            }
                        
                    }
                    DispatchQueue.main.async {
                        self.delegate!.gettingListIsDone(list: chartereList)
                    }
                }catch {
                    print(error)
                }
                
            }
            
        }
        task.resume()
    }
    
}
