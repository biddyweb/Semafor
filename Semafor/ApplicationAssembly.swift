//
//  ApplicationAssembly.swift
//  Semafor
//
//  Created by Marius Serban on 27/09/14.
//  Copyright (c) 2014 Marius Serban. All rights reserved.
//

import UIKit

public class ApplicationAssembly: TyphoonAssembly {
    public dynamic func appDelegate() -> AnyObject {
        return TyphoonDefinition.withClass(AppDelegate.self) {
            (definition) in
            
            definition.injectProperty("assembly", with: self)
        }
    }
    
    public dynamic func coreData() -> AnyObject {
        return TyphoonDefinition.withClass(CoreData.self)
    }
}
