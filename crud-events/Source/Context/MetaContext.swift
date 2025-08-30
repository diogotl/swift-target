//
//  MetaContext.swift
//  crud-events
//
//  Created by Diogo on 03/08/2025.
//

import CoreData
import UIKit

class MetaContext {

    private(set) var metas: [MetaCD] = []

    private let context = CoreDataHelper.shared.context
    private let transactionContext = TransactionContext()

    func fetchMetas() -> [Meta] {
        let request: NSFetchRequest<MetaCD> = MetaCD.fetchRequest()
        do {
            let metaCDs = try context.fetch(request)
            print("Metas buscadas com sucesso: \(metaCDs.count) metas encontradas.")
            return metaCDs.map { metaCD in
                let transactions =
                    transactionContext.fetchTransactions(for: metaCD.id ?? UUID()) ?? []
                return Meta(
                    id: metaCD.id ?? UUID(),
                    title: metaCD.title ?? "",
                    progress: Int(metaCD.progress),
                    total: Int(metaCD.total),
                    transactions: transactions
                )
            }
        } catch {
            print("Erro ao buscar metas: \(error)")
            return []
        }
    }

    func addMeta(meta: Meta) -> Bool {

        let metaCD = MetaCD(context: context)
        metaCD.id = meta.id
        metaCD.title = meta.title
        metaCD.total = Int32(meta.total)
        metaCD.progress = Int32(meta.progress)

        do {
            try context.save()
            fetchMetas()
            return true
        } catch {
            print("Erro ao salvar meta: \(error)")
            return false
        }
    }

    func fetchMeta(withId id: UUID) -> Meta? {
        let request: NSFetchRequest<MetaCD> = MetaCD.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", id as CVarArg)
        do {
            if let metaCD = try context.fetch(request).first {
                let transactions = transactionContext.fetchTransactions(for: id) ?? []
                return Meta(
                    id: metaCD.id ?? UUID(),
                    title: metaCD.title ?? "",
                    progress: Int(metaCD.progress),
                    total: Int(metaCD.total),
                    transactions: transactions
                )
            } else {
                print("DEBUG: Nenhuma meta encontrada com o id:", id)
            }
        } catch {
            print("Erro ao buscar meta por id: \(error)")
        }
        return nil
    }

    func addTransaction(to metaId: UUID, type: TransactionType, amount: Double, description: String)
        -> Bool
    {
        let transaction = Transaction(
            id: UUID(),
            type: type,
            amount: amount,
            description: description,
            date: Date(),
            metaId: metaId
        )
        return transactionContext.addTransaction(transaction: transaction)
    }

}
