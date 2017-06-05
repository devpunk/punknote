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
        
        let viewGradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkPurple,
            colorTopRight:UIColor.punkOrange)
        viewGradient.mask = viewSelected
        
        addSubview(viewGradient)
        addSubview(circle)
        
        NSLayoutConstraint.equals(
            view:circle,
            toView:self,
            margin:kCircleMargin)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
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
    
    override func layoutSubviews()
    {
        viewSelected.frame = bounds
        
        super.layoutSubviews()
    }
    
    override var isSelected:Bool
    {
        didSet
        {
            hover()
        }
    }
    
    //MARK: public
    
    func config(controller:CCreate?, model:MCreateFrame)
    {
        viewSelected.config(controller:controller)
    }
    
    func hover()
    {
        viewSelected.selected(isSelected:isSelected)
        viewSelected.isHidden = !isSelected
    }
}
