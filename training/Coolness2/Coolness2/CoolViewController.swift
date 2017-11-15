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

    override func viewDidLoad() {
        let subview1 = CoolCell(frame: CGRect(x: 40, y: 60, width: 80, height: 35))
        subview1.text = "Hello World"
        subview1.sizeToFit()
        subview1.backgroundColor = .purple
        contentView.addSubview(subview1)
    }

//    override func loadView() {
//        Bundle.main.loadNibNamed("CoolStuff", owner: self)
//    }
}