//
//  BBaseSystem.swift
//  
//
//  Created by Victor Vasconcelos on 19/02/25.
//


import MetalKit

open class BBaseSystem: BSystem {
    public var entityManager: BEntityManager
    
    public init(entityManager: BEntityManager) {
        self.entityManager = entityManager
    }
    
    open func render(commandEncoder: any MTLRenderCommandEncoder, deltaTime: Float) {
    
    }
}
