import UIKit

private let accessoryHeight = CGFloat(90)

extension CoolViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

class CoolViewController: UIViewController {

    var textField: UITextField!
    var contentView: UIView!

    @objc func addCoolCell() {
        guard let text = textField.text, let view = contentView else { return }

        let newCoolCell = CoolCell()
        newCoolCell.text = text
        newCoolCell.sizeToFit()
        view.addSubview(newCoolCell)

        textField.text = ""
    }

    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.cyan

        let (slice, remainder) = UIScreen.main.bounds.divided(atDistance: accessoryHeight, from: CGRectEdge.minYEdge)
        let accessoryView = UIView(frame: slice)
        contentView = UIView(frame: remainder)

        contentView.clipsToBounds = true

        accessoryView.backgroundColor = UIColor(white: 1, alpha: 0.6)
        contentView.backgroundColor = UIColor(white: 1, alpha: 0.2)

        view.addSubview(accessoryView)
        view.addSubview(contentView)

        // Controls
        textField = UITextField(frame: CGRect(x: 10, y: 30, width: 250, height: 30))
        textField.borderStyle = .roundedRect
        textField.placeholder = "Placeholder"
        textField.delegate = self
        accessoryView.addSubview(textField)

        let button1 = UIButton(type: .system)
        button1.setTitle("Add", for: .normal)
        button1.sizeToFit()
        button1.frame = button1.frame.offsetBy(dx: 270, dy: 30)
        button1.addTarget(self, action: #selector(addCoolCell), for: .touchUpInside)
        accessoryView.addSubview(button1)

        // Cool Cells

        let subview1 = CoolCell(frame: CGRect(x: 40, y: 60, width: 80, height: 30))
        subview1.backgroundColor = UIColor.orange
        subview1.text = "Hello World"
        subview1.sizeToFit()
        contentView.addSubview(subview1)

        let subview2 = CoolCell(frame: CGRect(x: 40, y: 100, width: 80, height: 30))
        subview2.backgroundColor = UIColor.orange
        subview2.text = "Something Else"
        subview2.sizeToFit()
        contentView.addSubview(subview2)
    }
}