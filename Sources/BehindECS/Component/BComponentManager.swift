//
//  BComponentManager.swift
//  
//
//  Created by Victor Vasconcelos on 19/02/25.
//


public class BComponentManager {
    
    private var componentsByType: [ObjectIdentifier: [EntityID: BComponent]] = [:]
    
    // Adiciona um BComponent na entidade
    public func addBComponent<T: BComponent>(_ BComponent: T, to entity: BEntity) {
        let key = ObjectIdentifier(T.self)
        componentsByType[key,default: [:]][entity.id] = BComponent
    }
    
    // Retorna o BComponent de uma entidade se houver
    public func getBComponent<T: BComponent>(ofType: T.Type, from entity: BEntity) -> T? {
        let key = ObjectIdentifier(T.self)
        return componentsByType[key]?[entity.id] as? T
    }
    
    // Obtém todas as entidades que possuem um tipo de BComponente
    public func getEntitiesWithBComponent<T: BComponent>(ofType type: T.Type) -> [BEntity] {
        let key = ObjectIdentifier(type)
        return componentsByType[key]?.keys.map {
            return BEntity(id: $0)
        } ?? []
    }

    // Remove um BComponente de uma entidade
    public func removeBComponent<T: BComponent>(ofType type: T.Type, from entity: BEntity) {
        let key = ObjectIdentifier(type)
        componentsByType[key]?.removeValue(forKey: entity.id)
        
        // Remove o dicionário do tipo se estiver vazio
        if componentsByType[key]?.isEmpty == true {
            componentsByType.removeValue(forKey: key)
        }
    }
    
    // Remove todos os BComponentes de uma entidade
    public func removeAllBComponents(from entity: BEntity) {
        for (key, _) in componentsByType {
            componentsByType[key]?.removeValue(forKey: entity.id)
            
            // Se o dicionário do tipo estiver vazio, removê-lo
            if componentsByType[key]?.isEmpty == true {
                componentsByType.removeValue(forKey: key)
            }
        }
    }
}
