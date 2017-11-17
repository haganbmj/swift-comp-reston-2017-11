import UIKit

@objc protocol BookAdding {
    var completion: ((_ book: Book) -> Void)? { get set }
}

class AddBookController: UITableViewController, BookAdding {
    var completion: ((Book) -> Void)?

    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var yearField: UITextField!
    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!

    var book: Book {
        return Book(dictionary: [
            Book.titleKey: titleField.text ?? "",
            Book.yearKey: yearField.text ?? "",
            Book.authorKey: [
                Author.firstNameKey: firstNameField.text ?? "",
                Author.lastNameKey: lastNameField.text ?? ""
            ]
        ])
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "doneAddBook") {
            completion?(book)
        }
    }
}
