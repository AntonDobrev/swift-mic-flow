//
//  Book.swift
//  FacebookLoginWithKinvey
//
//  Created by BackendServTestUser on 11/14/17.
//  Copyright © 2017 Kinvey. All rights reserved.
//

import Foundation
import Kinvey
import ObjectMapper


class Book: Entity {
    
    @objc dynamic var title: String?
    
    override class func collectionName() -> String {
        //return the name of the backend collection corresponding to this entity
        return "books"
    }
    
    //Map properties in your backend collection to the members of this entity
    override func propertyMapping(_ map: Map) {
        
        //This maps the "_id", "_kmd" and "_acl" properties
        super.propertyMapping(map)
        
        //Each property in your entity should be mapped using the following scheme:
        //<member variable> <- ("<backend property>", map["<backend property>"])
        title <- ("title", map["title"])
    }
}

