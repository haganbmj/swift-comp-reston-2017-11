import UIKit

private let accessoryHeight = CGFloat(90)

extension CoolViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class CoolViewController: UIViewController {

    @IBOutlet var textField: UITextField!
    @IBOutlet var contentView: UIView!

    @IBAction func addCoolCell() {
        guard let text = textField.text, let view = contentView else { return }

        let newCoolCell = CoolCell()
        newCoolCell.text = text
        newCoolCell.sizeToFit()
        view.addSubview(newCoolCell)

        textField.text = ""
    }

//    override func loadView() {
//        Bundle.main.loadNibNamed("CoolStuff", owner: self)
//    }
}