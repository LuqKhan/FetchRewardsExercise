//
//  DataLoader.swift
//  FetchRewardsExercise
//
//  Created by Luqmaan Khan on 10/28/20.
//

import Foundation

class DataLoader {
    
    var itemsDataSource: [[Int:String]] = [[:]]
    
    init() {
        loadItems()
    }
    
    func loadItems(completion: @escaping([Item]?) -> Void = {_ in }) {
        let baseURL = URL(string: "https://fetch-hiring.s3.amazonaws.com/hiring.json")!
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            if let error = error {
                NSLog("Error fetching items: \(error)")
                completion(nil)
                return
            }
            guard let data = data else {
                NSLog("Error with items data: \(String(describing: error))")
                completion(nil)
                return
            }
            do {
                let fetchedItems = try JSONDecoder().decode([Item].self, from: data)
                self.groupByListID(items: fetchedItems)
                completion(fetchedItems)
            } catch {
                NSLog("Error decoding items from JSON: \(error)")
                completion(nil)
                return
            }
        }.resume()
    }
    
    private func groupByListID(items: [Item]) {
        var mutableItems: [Item] = []
        var groupedAndSortedData: [[Int:String]] = [[:]]
        
        //remove blank values from items -> FIX IT HERE
        for item in items {
            if item.name != nil || item.name != "" {
                mutableItems.append(item)
            }
        }
        
        //sort by listId
        let itemsSortedByListId = mutableItems.sorted(by: { $0.listId < $1.listId})
        
        //group by listID
        //one dictionary for each listId
        
    }
}
