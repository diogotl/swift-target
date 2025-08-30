import CoreData
import Foundation

class TransactionContext {

    private let context = CoreDataHelper.shared.context

    func addTransaction(transaction: Transaction) -> Bool {
        let transactionCD = TransactionCD(context: context)
        transactionCD.type = transaction.type == .income ? "income" : "expense"
        transactionCD.value = Int32(transaction.amount)
        transactionCD.reason = transaction.description
        transactionCD.date = transaction.date

        let metaRequest: NSFetchRequest<MetaCD> = MetaCD.fetchRequest()
        metaRequest.predicate = NSPredicate(format: "id == %@", transaction.metaId as CVarArg)

        do {
            if let metaCD = try context.fetch(metaRequest).first {
                transactionCD.metas = metaCD
                try context.save()

                updateMetaProgress(metaCD: metaCD)
                return true
            } else {
                print("Meta não encontrada para a transação")
                return false
            }
        } catch {
            print("Erro ao salvar transação: \(error)")
            return false
        }
    }

    func fetchTransactions(for metaId: UUID) -> [Transaction]? {
        let request: NSFetchRequest<TransactionCD> = TransactionCD.fetchRequest()
        request.predicate = NSPredicate(format: "metas.id == %@", metaId as CVarArg)

        do {
            let transactionCDs = try context.fetch(request)
            return transactionCDs.compactMap { transactionCD -> Transaction? in
                
                guard let typeString = transactionCD.type,
          
                    let date = transactionCD.date,
                    let metaId = transactionCD.metas?.id
                        
                else {
                    return nil
                }

                let type: TransactionType = (typeString == "income") ? .income : .expense
                let id = transactionCD.id ?? UUID()
                
                return Transaction(
                    id: id,
                    type: type,
                    amount: Double(transactionCD.value),
                    description: transactionCD.reason ?? "",
                    date: date,
                    metaId: metaId
                )
            }

        } catch {
            print("Erro ao buscar transações: \(error)")
            return nil
        }
    }

    private func updateMetaProgress(metaCD: MetaCD) {
        _ = metaCD.transactions
        // Implementar lógica de cálculo do progresso
        // Por exemplo, somar valores das transações do tipo income
    }
}
