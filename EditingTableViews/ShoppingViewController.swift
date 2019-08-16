import UIKit

class ShoppingViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

  var shoppingItems = [ShoppingItem]()
    @IBOutlet weak var shoppingTableView: UITableView!
    @IBAction func editButton(_ sender: UIButton) {
        if shoppingTableView.isEditing  {
shoppingTableView.setEditing(false, animated: false)
            sender.setTitle("Edit", for: .normal)
        } else {
           shoppingTableView.setEditing(true, animated: true)
            sender.setTitle("Finish Editing", for: .normal)
        }
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       configureShoppingItemsTableView()
       loadShoppingItems()
     shoppingTableView.isEditing = false
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  shoppingItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "shoppingCart")
        let shoppingCart = shoppingItems[indexPath.row]
       cell?.textLabel?.text =  shoppingCart.name
          cell?.detailTextLabel?.text = "Price: \(shoppingCart.price)"
        return cell!
        
    }
    private func loadShoppingItems() {
        let allItems = ShoppingItemFetchingClient.getShoppingItems()
         shoppingItems = allItems
    }
    
    private func configureShoppingItemsTableView() {
        shoppingTableView.dataSource = self
        shoppingTableView.delegate = self
    }
    
}

