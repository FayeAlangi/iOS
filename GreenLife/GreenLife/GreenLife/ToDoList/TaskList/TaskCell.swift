import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var CompletedImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func configure(with task: Task) {
        titleLabel.text = task.title
        titleLabel.textColor = task.isComplete ? .secondaryLabel : .label
        CompletedImageView.image = UIImage(systemName: task.isComplete ? "circle.inset.filled" : "circle")?.withRenderingMode(.alwaysTemplate)
        CompletedImageView.tintColor = task.isComplete ? .systemBlue : .tertiaryLabel
    }

}
