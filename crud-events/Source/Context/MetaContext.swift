//
//  MetaContext.swift
//  crud-events
//
//  Created by Diogo on 03/08/2025.
//

import UIKit
import CoreData

class MetaContext {
    
    private(set) var metas: [MetaCD] = []
    
    private let context = CoreDataHelper.shared.context
    
    func fetchMetas() -> [Meta] {
        let request: NSFetchRequest<MetaCD> = MetaCD.fetchRequest()
        do {
            let metaCDs = try context.fetch(request)
            return metaCDs.map { Meta(title: $0.title ?? "", total: Int($0.total)) }
        } catch {
            print("Erro ao buscar metas: \(error)")
            return []
        }
    }
    
    func addMeta(meta: Meta) -> Bool {
    
        let metaCD = MetaCD(context: context)
        metaCD.title = meta.title
        metaCD.total = Int32(meta.total)

        do {
            try context.save()
            fetchMetas() 
            return true
        } catch {
            print("Erro ao salvar meta: \(error)")
            return false
        }
    }

    
}
