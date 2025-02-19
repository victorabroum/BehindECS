//
//  BSystem.swift
//  
//
//  Created by Victor Vasconcelos on 19/02/25.
//


import MetalKit

public protocol BSystem {
    func render(commandEncoder: MTLRenderCommandEncoder, deltaTime: Float)
}
