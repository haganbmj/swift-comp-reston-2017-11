//
// Copyright (C) 2017 About Objects, Inc. All Rights Reserved.
// See LICENSE.txt for this example's licensing information.
//
import Foundation

open class ReadingList: ModelObject
{    
    public static let titleKey = "title"
    public static let booksKey = "books"
    
    @objc open var title = ""
    @objc open var books = [Book]()
    
    open override var description: String {
        var s = "Title: \(title)\nCount: \(books.count)\nBooks:\n------\n"
        for (index, book) in books.enumerated() {
            s += "\(index + 1). \(book)\n"
        }
        return s
    }
    
    open override class var keys: [String] {
        return [titleKey, booksKey]
    }
    
    open override func setValue(_ value: Any?, forKey key: String) {
        var books: [Book]?
        if key == ReadingList.booksKey, let dicts = value as? [[String: Any]] {
            books = dicts.map { Book(dictionary: $0) }
        }
        super.setValue(books ?? value, forKey: key)
    }
    
    open override func dictionaryRepresentation() -> [String: Any] {
        var dict = super.dictionaryRepresentation()
        if let books = dict[ReadingList.booksKey] as? [ModelObject] {
            dict[ReadingList.booksKey] = books.map { $0.dictionaryRepresentation() }
        }
        return dict
    }
}
