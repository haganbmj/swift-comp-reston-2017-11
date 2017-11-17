import UIKit

@objc protocol BookViewing {
    var book: Book? { get set }
}

class BookDetailController: UITableViewController, BookViewing {

    var book: Book?

    @IBOutlet weak var titleCell: UITableViewCell!
    @IBOutlet weak var yearCell: UITableViewCell!
    @IBOutlet weak var firstNameCell: UITableViewCell!
    @IBOutlet weak var lastNameCell: UITableViewCell!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        titleCell.detailTextLabel?.text = book?.title
        yearCell.detailTextLabel?.text = book?.year
        firstNameCell.detailTextLabel?.text = book?.author?.firstName
        lastNameCell.detailTextLabel?.text = book?.author?.lastName
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let editBookController = segue.realDestination as? EditBookController else { fatalError() }

        editBookController.book = book
    }

    @IBAction
    func cancelEditBook(for unwindSegue: UIStoryboardSegue) {}
}
