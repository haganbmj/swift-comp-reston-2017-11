import UIKit

class ReadingListController: UITableViewController {

    @IBOutlet var dataSource: BookDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource.load()

        navigationItem.leftBarButtonItem = editButtonItem
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
        case "bookDetail":
            guard
                    let bookViewing = segue.destination as? BookViewing,
                    let indexPath = tableView.indexPathForSelectedRow
                    else { fatalError() }
            bookViewing.book = dataSource.book(at: indexPath)
        case "addBook":
            guard let addController = segue.realDestination as? BookAdding else { fatalError() }
            addController.completion = { [weak self] book in self?.dataSource.insert(book: book) }
        default:
            fatalError()
        }
    }
}

extension ReadingListController {

    @IBAction
    func doneAddBook(for unwindSegue: UIStoryboardSegue) {}

    @IBAction
    func doneEditBook(for unwindSegue: UIStoryboardSegue) {
        dataSource.reloadTableView()
        dataSource.persistReadingList()
    }

    @IBAction
    func cancelEditBook(for unwindSegue: UIStoryboardSegue) {}
}