//
//  CategoryViewController.swift
//  M
//
//  Created by Selvamurugan on 28/02/17.
//  Copyright © 2017 Bosco Soft. All rights reserved.
//

import UIKit

class GenereViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        print("Genere ViewController is deallocated")
    }
   
    // MARK: UITableView Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genereArr.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if genereArr[indexPath.row] != nil {
            return 150
        } else {
            return 100
        }
    }
    
    /*  Create Cells    */
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Row is DefaultCell
        if let genere = genereArr[indexPath.row] {
            let defaultCell = tableView.dequeueReusableCell(withIdentifier: "GenereCell", for: indexPath) as! GenereCell
            defaultCell.genereImageView.image = UIImage(named: genere.genereImageName)
            defaultCell.nameLabel.text = genere.genereName
            return defaultCell
        } else { // Row is ExpansionCell
            if let subGenere = genereArr[getParentCellIndex(expansionIndex: indexPath.row)] {
                //  Create an ExpansionCell
                let expansionCell = tableView.dequeueReusableCell(withIdentifier: "SubGenereCell", for: indexPath) as! GenereCell
                //  Get the index of the parent Cell (containing the data)
                let parentCellIndex = getParentCellIndex(expansionIndex: indexPath.row)
                //  Get the index of the child data (e.g. if there are multiple ExpansionCells
                let subIndex = indexPath.row - parentCellIndex - 1
                //  Set the cell's data
                expansionCell.genereImageView.image = UIImage(named: subGenere.subGenere[subIndex].genereImageName)
                expansionCell.nameLabel.text = subGenere.subGenere[subIndex].genereName
                return expansionCell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Close if already expanded
        if genereArr[indexPath.row] != nil {
            // If user clicked last cell, do not try to access cell+1 (out of range)
            if(indexPath.row + 1 >= (genereArr.count)) {
                expandCell(tableView: tableView, index: indexPath.row)
            }
            else {
                // If next cell is not nil, then cell is not expanded
                if(genereArr[indexPath.row+1] != nil) {
                    expandCell(tableView: tableView, index: indexPath.row)
                    // Close Cell (remove ExpansionCells)
                } else {
                    contractCell(tableView: tableView, index: indexPath.row)
                }
            }
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if (scrollView == self.tableView) {
            for indexPath in self.tableView.indexPathsForVisibleRows! {
                self.setCellImageOffset(self.tableView.cellForRow(at: indexPath) as! GenereCell, indexPath: indexPath)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let imageCell = cell as! GenereCell
        self.setCellImageOffset(imageCell, indexPath: indexPath)
    }
    
    // MARK: UITableView Parallex Effect Methods
    
    func setCellImageOffset(_ cell: GenereCell, indexPath: IndexPath) {
        let cellFrame = self.tableView.rectForRow(at: indexPath)
        let cellFrameInTable = self.tableView.convert(cellFrame, to:self.tableView.superview)
        let cellOffset = cellFrameInTable.origin.y + cellFrameInTable.size.height
        let tableHeight = self.tableView.bounds.size.height + cellFrameInTable.size.height
        let cellOffsetFactor = cellOffset / tableHeight
        cell.setBackgroundOffset(cellOffsetFactor)
    }
    
    // MARK: UITableView Expand Logic Methods
    
    /*  Expand cell at given index  */
    private func expandCell(tableView: UITableView, index: Int) {
        // Expand Cell (add ExpansionCells
        if let subGenere = genereArr[index]?.subGenere {
            for i in 1...subGenere.count {
                genereArr.insert(nil, at: index + i)
                tableView.insertRows(at: [NSIndexPath(row: index + i, section: 0) as IndexPath] , with: .top)
            }
        }
    }
    
    /*  Contract cell at given index    */
    private func contractCell(tableView: UITableView, index: Int) {
        if let subGenere = genereArr[index]?.subGenere {
            for _ in 1...subGenere.count {
                genereArr.remove(at: index+1)
                tableView.deleteRows(at: [NSIndexPath(row: index+1, section: 0) as IndexPath], with: .top)
            }
        }
    }
    
    /*  Get parent cell index for selected ExpansionCell  */
    private func getParentCellIndex(expansionIndex: Int) -> Int {
        var selectedCell: Genere?
        var selectedCellIndex = expansionIndex
        while(selectedCell == nil && selectedCellIndex >= 0) {
            selectedCellIndex -= 1
            selectedCell = genereArr[selectedCellIndex]
        }
        return selectedCellIndex
    }

}
