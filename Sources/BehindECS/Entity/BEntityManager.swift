//
//  BEntityManager.swift
//  
//
//  Created by Victor Vasconcelos on 19/02/25.
//

public class BEntityManager {
    private var nextID: EntityID = 0
    private var componentManager: BComponentManager

    public var allEntities = Set<EntityID>()
    
    init() {
        componentManager = BComponentManager()
    }
    
    public func createEntity() -> BEntity {
        let newEntity = BEntity(id: nextID)
        allEntities.insert(nextID)
        nextID += 1
        return newEntity
    }
    
    public func remove(entity: BEntity) {
        allEntities.remove(entity.id)
    }
    
    public func addComponent<T: BComponent>(to entity: BEntity, _ component: T) {
        componentManager.addBComponent(component, to: entity)
    }
    
    public func removeComponent<T: BComponent>(ofType component: T.Type, from entity: BEntity) {
        componentManager.removeBComponent(ofType: component, from: entity)
    }
    
    public func getComponent<T: BComponent>(ofType component: T.Type, from entity: BEntity) -> T? {
        return componentManager.getBComponent(ofType: component, from: entity)
    }
    
    public func removeAllComponents(from entity: BEntity) {
        componentManager.removeAllBComponents(from: entity)
    }
    
    public func getEntitiesWithBComponent<T: BComponent>(ofType component: T.Type) -> [BEntity] {
        return componentManager.getEntitiesWithBComponent(ofType: component)
    }
}
