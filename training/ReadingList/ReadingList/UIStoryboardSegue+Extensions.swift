import UIKit

extension UIStoryboardSegue {
    open var realDestination: UIViewController? {
        guard let uiNavigationController = destination as? UINavigationController else { return destination }
        return uiNavigationController.viewControllers.first
    }
}