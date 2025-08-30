import Foundation
import UIKit

protocol EventsListViewFlowDelegate: AnyObject {
    func navigateToCreateEvent()
    func navigateToGoalDetails(metaId: UUID)
}
