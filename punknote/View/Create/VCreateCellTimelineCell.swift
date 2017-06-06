import UIKit

class VCreateCellTimelineCell:UICollectionViewCell
{
    private weak var viewCircle:UIView!
    private weak var viewSelected:VCreateCellTimelineCellSelected!
    private weak var model:MCreateFrame?
    private let kCircleMargin:CGFloat = 10
    private let kBorderWidth:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let viewCircle:UIView = UIView()
        viewCircle.isUserInteractionEnabled = false
        viewCircle.translatesAutoresizingMaskIntoConstraints = false
        viewCircle.backgroundColor = UIColor.clear
        viewCircle.layer.borderWidth = kBorderWidth
        viewCircle.layer.cornerRadius = (frame.size.width / 2) - kCircleMargin
        self.viewCircle = viewCircle
        
        let viewSelected:VCreateCellTimelineCellSelected = VCreateCellTimelineCellSelected()
        self.viewSelected = viewSelected
        
        let viewGradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkPurple,
            colorTopRight:UIColor.punkOrange)
        viewGradient.mask = viewSelected
        
        addSubview(viewGradient)
        addSubview(viewCircle)
        
        NSLayoutConstraint.equals(
            view:viewCircle,
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
    
    override var isHighlighted:Bool
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
        
        if isSelected || isHighlighted
        {
            viewSelected.selected(isSelected:true, model:model)
            viewSelected.isHidden = false
            viewCircle.layer.borderColor = UIColor.punkPurple.cgColor
        }
        else
        {
            viewSelected.selected(isSelected:false, model:model)
            viewSelected.isHidden = true
            viewCircle.layer.borderColor = UIColor(white:0, alpha:0.1).cgColor
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
