import UIKit

class CoolViewController: UIViewController {

    override func loadView() {
        view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.cyan

        let subview1 = CoolCell(frame: CGRect(x: 40, y: 60, width: 80, height: 30))
        subview1.backgroundColor = UIColor.orange
        subview1.text = "Hello World"
        subview1.sizeToFit()
        view.addSubview(subview1)

        let subview2 = CoolCell(frame: CGRect(x: 40, y: 100, width: 80, height: 30))
        subview2.backgroundColor = UIColor.orange
        subview2.text = "Something Else"
        subview2.sizeToFit()
        view.addSubview(subview2)
    }
}