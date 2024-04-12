//
//  GOTModel.swift
//  GOTApplication
//
//  Created by Rania Arbash on 2024-04-12.
//

import Foundation

class GOTCharacter : Decodable{
    
    var characterName: String = " "
    var actorName :String = " "
    var characterImageThumb = " "
    
    
    
    
    init(characterName: String, actorName: String, characterImageThumb: String = "NO Image") {
        self.characterName = characterName
        self.actorName = actorName
        self.characterImageThumb = characterImageThumb
       
    }
    
    init(characterName: String, actorName: String) {
        self.characterName = characterName
        self.actorName = actorName
        self.characterImageThumb = "No Image"
    }
}




