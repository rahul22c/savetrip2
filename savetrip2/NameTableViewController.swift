//
//  NameTableViewController.swift
//  savetrip2
//
//  Created by Rahul Chandrawanshi on 10/4/16.
//  Copyright © 2016 Rahul Chandrawanshi. All rights reserved.
//

import UIKit

class NameTableViewController: UITableViewController, UISearchBarDelegate{
    
    var sampledatas = [sampleData]()
    var filtereddata = [sampleData]()
    var filteredname = [String]()
    var searchActive : Bool = false

    @IBOutlet weak var search: UISearchBar!
    
   
    
    
     var data = [String]()
    
    func loadsample(){
        let photo1 = UIImage(named: "Trip")
        let data1 = sampleData(name:"gokarna",tripname: "bangalore" ,photo: photo1, place: " karnataka" )
        
        let data2 = sampleData(name:"goa",tripname: "pune" ,photo: photo1, place: "Goa " )
        
        
        let data3 = sampleData(name:"nainital",tripname: "family trip" ,photo: photo1, place: "Nanital" )
        
        let data4 = sampleData(name:"hyderabad",tripname: "family trip" ,photo: photo1, place: "hyderabad" )
        
        let data5 = sampleData(name:"rishikesh",tripname: "college trip" ,photo: photo1, place: "uttrakhand" )
        
        
        sampledatas += [data1,data2,data3,data4,data5]
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadsample();
         

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        search.delegate = self
        
        
        var i:Int = 0
        
        
        while(i < self.sampledatas.count){
            //print(i)
            self.data += [self.sampledatas[i].name]
            
            i += 1
    
    }
}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK:Searchbar controller
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        
        var i:Int = 0
        var j:Int = 0
        self.filtereddata.removeAll()
        self.filteredname.removeAll()
        
        self.filteredname = data.filter({ (text) -> Bool in
            let tmp: NSString = text as NSString
            let range = tmp.range(of: searchText, options: NSString.CompareOptions.caseInsensitive)
            return range.location != NSNotFound
        })
        print(self.filteredname)
        if(self.filteredname.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        
        
        
        while ( i < self.filteredname.count)
        {   while( j < self.sampledatas.count)
        {
            if(self.sampledatas[j].name == self.filteredname[i])
                
            {  self.filtereddata += [self.sampledatas[j]]
                j += 1
                break
            }
            j += 1
            
            }
            
            i += 1
            
        }
        i=0
        j=0
        
        self.tableView.reloadData()
        print(self.filtereddata)
    }
    
    
    
    
    
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(searchActive) {
            return filteredname.count
        }

        return  sampledatas.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NameTableViewCell", for: indexPath) as! NameTableViewCell


        // Configure the cell...
        if (searchActive && indexPath.row < filteredname.count)
        {  let samplecell = self.filtereddata[indexPath.row]
            cell.name.text = samplecell.name
            cell.place.text = samplecell.place
            cell.tripName.text = samplecell.tripname
            cell.Images.image = samplecell.photo
            
            
        }
        else{
            let samplecell = self.sampledatas[indexPath.row]
            cell.name.text = samplecell.name
            cell.place.text = samplecell.place
            cell.tripName.text = samplecell.tripname
            cell.Images.image = samplecell.photo
        }
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "Details", sender: nil)

    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            sampledatas.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
        //else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
       // }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
