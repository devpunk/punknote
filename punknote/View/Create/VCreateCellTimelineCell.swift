import UIKit

class VCreateCellTimelineCell:UICollectionViewCell
{
    private weak var circle:UIView!
    private weak var viewSelected:VCreateCellTimelineCellSelected!
    private let kCircleMargin:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let circle:UIView = UIView()
        circle.isUserInteractionEnabled = false
        circle.translatesAutoresizingMaskIntoConstraints = false
        circle.backgroundColor = UIColor.clear
        circle.layer.borderWidth = kBorderWidth
        circle.layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
        circle.layer.cornerRadius = (frame.size.width / 2) - kCircleMargin
        
        let viewSelected:VCreateCellTimelineCellSelected = VCreateCellTimelineCellSelected()
        self.viewSelected = viewSelected
        
        addSubview(viewSelected)
        addSubview(circle)
        
        NSLayoutConstraint.equals(
            view:viewSelected,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:circle,
            toView:self,
            margin:kCircleMargin)
        
        hover()
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        viewSelected.timer?.invalidate()
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: private
    
    private func hover()
    {
        viewSelected.selected(isSelected:isSelected)
        viewSelected.isHidden = !isSelected
    }
    
    //MARK: public
    
    func config(controller:CCreate, model:MCreateFrame)
    {
        viewSelected.config(controller:controller)
    }
}
