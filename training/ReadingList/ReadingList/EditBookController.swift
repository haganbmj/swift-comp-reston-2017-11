import UIKit

class EditBookController: UITableViewController {
    var book: Book?

    @IBOutlet weak var titleCell: EditBookCell!
    @IBOutlet weak var yearCell: EditBookCell!
    @IBOutlet weak var firstNameCell: EditBookCell!
    @IBOutlet weak var lastNameCell: EditBookCell!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        titleCell.textField.text = book?.title
        yearCell.textField.text = book?.year
        firstNameCell.textField.text = book?.author?.firstName
        lastNameCell.textField.text = book?.author?.lastName
    }

    func updateBook() {
        book?.title = titleCell.textField.text
        book?.year = yearCell.textField.text
        book?.author?.firstName = firstNameCell.textField.text
        book?.author?.lastName = lastNameCell.textField.text
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)

        // If the Done button was pressed.
        if (segue.identifier == "DoneEditBook") {
            updateBook()
        }
    }
}
