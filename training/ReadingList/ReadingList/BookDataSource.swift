import UIKit

class BookDataSource: NSObject {
    var store: ReadingListStore!
    var readingList: ReadingList?

    @IBOutlet var tableView: UITableView!

    func load() {
        store = ReadingListStore("BooksAndAuthors")
        DispatchQueue.global(qos: .userInteractive).async { [weak self] in
            print("async reading list init")
            self?.readingList = self?.store.fetch()
            self?.reloadTableView()
            print("\(self?.readingList)")
        }
    }

    func reloadTableView() {
        DispatchQueue.main.async { [weak self] in
            print("reloadTableView, \(self?.tableView)")
            self?.tableView.reloadData()
        }
    }
}

extension BookDataSource {
    func book(at indexPath: IndexPath) -> Book? {
        return readingList?.books[indexPath.row]
    }

    func insert(book: Book) {
        guard let readingList = readingList else { return }
        readingList.books.insert(book, at: 0)
        store.save(readingList: readingList)
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
    }

    func persistReadingList() {
        guard let readingList = self.readingList else { return }
        DispatchQueue.global(qos: .background).async { [weak self] in
            self?.store.save(readingList: readingList)
        }
    }
}

extension BookDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readingList?.books.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BookSummary") else {
            fatalError("Unable to dequeue")
        }

        let book = self.book(at: indexPath)
        cell.textLabel?.text = book?.title
        cell.detailTextLabel?.text = "\(book?.year ?? "****") - \(book?.author?.fullName ?? "Unknown")"

        return cell
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            guard let readingList = readingList else { return }
            readingList.books.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)

            persistReadingList()
        }
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let readingList = readingList else { return }
        let book = readingList.books[sourceIndexPath.row]
        readingList.books.remove(at: sourceIndexPath.row)
        readingList.books.insert(book, at: destinationIndexPath.row)

        reloadTableView()
        persistReadingList()
    }
}
