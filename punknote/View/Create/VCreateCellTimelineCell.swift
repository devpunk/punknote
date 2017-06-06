import UIKit

class VCreateCellTimelineCell:UICollectionViewCell
{
    private weak var circle:UIView!
    private weak var viewSelected:VCreateCellTimelineCellSelected!
    private weak var model:MCreateFrame?
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
    
    //MARK: private
    
    private func hover()
    {
        guard
        
            let model:MCreateFrame = self.model
        
        else
        {
            return
        }
        
        if isSelected
        {
            viewSelected.selected(isSelected:true, model:model)
            viewSelected.isHidden = false
        }
        else
        {
            viewSelected.selected(isSelected:false, model:model)
            viewSelected.isHidden = true
        }
    }
    
    //MARK: public
    
    func config(model:MCreateFrame)
    {
        viewSelected.timer?.invalidate()
        self.model = model
        hover()
    }
}
