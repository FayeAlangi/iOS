import UIKit
import ParseSwift

class TaskListViewController: UIViewController {

    @IBOutlet weak var taskTableView: UITableView!
    private let refreshControl = UIRefreshControl()
 
    @IBOutlet weak var emptyStateLabel: UILabel!
    
    var tasks = [Task]() {
        didSet {
            emptyStateLabel.isHidden = !tasks.isEmpty
            taskTableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // UI candy: Hide 1st / top cell separator
        taskTableView.tableHeaderView = UIView()
        taskTableView.delegate = self
        taskTableView.dataSource = self
 
        taskTableView.rowHeight = UITableView.automaticDimension
        taskTableView.refreshControl = refreshControl
        
        refreshControl.addTarget(self, action: #selector(onPullToRefresh), for: .valueChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        queryTasks()
        
    }
    private func queryTasks(completion: (() -> Void)? = nil){
        let constraint: QueryConstraint = "username" == User.current?.username
        let query = Task.query(constraint)
            .order([.descending("createdAt")])
           
        
        query.find{ [weak self] result in
            switch result{
            case .success(let tasks):
                self?.tasks = tasks
                for task in tasks{
                    print(task)}
            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
            completion?()
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        // Segue to Compose View Controller
        if segue.identifier == "ComposeSegue" {

            // Since the segue is connected to the navigation controller that manages the ComposeViewController
            // we need to access the navigation controller first...
            if let composeNavController = segue.destination as? UINavigationController,
                // ...then get the actual ComposeViewController via the navController's `topViewController` property.
               let composeViewController = composeNavController.topViewController as? TaskComposeViewController {
                // onCompose (older version)
            }

            // Segue to Detail View Controller
        } else if segue.identifier == "DetailSegue" {
            if let detailViewController = segue.destination as? TaskDetailViewController,
                // Get the index path for the current selected table view row.
               let selectedIndexPath = taskTableView.indexPathForSelectedRow {

                // Get the task associated with the slected index path
                let task = tasks[selectedIndexPath.row]

                // Set the selected task on the detail view controller.
                detailViewController.task = task
            }
        }
    }
    @objc private func onPullToRefresh() {
        refreshControl.beginRefreshing()
        queryTasks { [weak self] in
            self?.refreshControl.endRefreshing()
        }
    }
    
}

extension TaskListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else {
            fatalError("Unable to dequeue Task Cell")
        }

        cell.configure(with: tasks[indexPath.row])

        return cell
    }
}
extension TaskListViewController : UITableViewDelegate{}

