import UIKit

extension UITableView {
    
    func switchDataSourceFrom<T:Equatable>(oldData: [T], to newData: [T], withAnimation animation: UITableViewRowAnimation) {
        
        var indexPathsToInsert = [NSIndexPath]()
        var indexPathsToDelete = [NSIndexPath]()
        
        var index = 0
        for newScan in newData {
            var found = false
            
            for oldScan in oldData {
                if newScan == oldScan {
                    found = true
                }
            }
            
            if !found {
                indexPathsToInsert.append(
                    NSIndexPath(row: index, section: 0)
                )
            }
            
            index += 1
        }
        
        index = 0
        for oldScan in oldData {
            var found = false
            
            for newScan in newData {
                if oldScan == newScan {
                    found = true
                }
            }
            
            if !found {
                indexPathsToDelete.append(
                    NSIndexPath(row: index, section: 0)
                )
            }
            
            index += 1
        }
        
        self.beginUpdates()
        
        self.insertRows(at: indexPathsToInsert as [IndexPath], with: animation)
        self.deleteRows(at: indexPathsToDelete as [IndexPath], with: animation)
        
        self.endUpdates()
        
        if let rows = self.indexPathsForVisibleRows {
            self.reloadRows(at: rows, with: .none)
        }
    }
    
}
