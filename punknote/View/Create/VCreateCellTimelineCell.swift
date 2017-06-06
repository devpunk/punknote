import UIKit

class VCreateCellTimelineCell:UICollectionViewCell
{
    private weak var viewCircle:UIView!
    private weak var viewSelected:VCreateCellTimelineCellSelected!
    private weak var model:MCreateFrame?
    private weak var labelText:UILabel!
    private let kCircleMargin:CGFloat = 10
    private let kLabelMargin:CGFloat = 4
    private let kBorderWidth:CGFloat = 1
    
    override init(frame:CGRect)
    {
        super.init(frame:frame)
        clipsToBounds = true
        backgroundColor = UIColor.clear
        
        let circleCornerRadius:CGFloat = (frame.size.width / 2) - kCircleMargin
        let labelCornerRadius:CGFloat = circleCornerRadius - kLabelMargin
        
        let viewCircle:UIView = UIView()
        viewCircle.clipsToBounds = true
        viewCircle.isUserInteractionEnabled = false
        viewCircle.translatesAutoresizingMaskIntoConstraints = false
        viewCircle.backgroundColor = UIColor.clear
        viewCircle.layer.borderWidth = kBorderWidth
        viewCircle.layer.cornerRadius = circleCornerRadius
        self.viewCircle = viewCircle
        
        let viewSelected:VCreateCellTimelineCellSelected = VCreateCellTimelineCellSelected()
        self.viewSelected = viewSelected
        
        let viewGradient:VGradient = VGradient.diagonal(
            colorLeftBottom:UIColor.punkPurple,
            colorTopRight:UIColor.punkOrange)
        viewGradient.mask = viewSelected
        
        let labelText:UILabel = UILabel()
        labelText.translatesAutoresizingMaskIntoConstraints = false
        labelText.isUserInteractionEnabled = false
        labelText.backgroundColor = UIColor.clear
        labelText.textAlignment = NSTextAlignment.center
        labelText.numberOfLines = 0
        labelText.textColor = UIColor.black
        labelText.font = UIFont.regular(size:12)
        labelText.clipsToBounds = true
        labelText.layer.cornerRadius = labelCornerRadius
        self.labelText = labelText
        
        addSubview(labelText)
        addSubview(viewGradient)
        addSubview(viewCircle)
        
        NSLayoutConstraint.equals(
            view:viewCircle,
            toView:self,
            margin:kCircleMargin)
        
        NSLayoutConstraint.equals(
            view:viewGradient,
            toView:self)
        
        NSLayoutConstraint.equals(
            view:labelText,
            toView:viewCircle,
            margin:kLabelMargin)
        
        NotificationCenter.default.addObserver(
            self,
            selector:#selector(notifiedTextChanged(sender:)),
            name:Notification.frameTextChanged,
            object:nil)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        viewSelected.timer?.invalidate()
        NotificationCenter.default.removeObserver(self)
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
    
    //MARK: notifications
    
    func notifiedTextChanged(sender notification:Notification)
    {
        guard
        
            let model:MCreateFrame = self.model,
            let notificationFrame:MCreateFrame = notification.object as? MCreateFrame
        
        else
        {
            return
        }
        
        if model === notificationFrame
        {
            DispatchQueue.main.async
            { [weak self] in
                
                self?.updateText()
            }
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
    
    private func updateText()
    {
        guard
        
            let model:MCreateFrame = self.model
        
        else
        {
            return
        }
        
        labelText.text = model.text
    }
    
    //MARK: public
    
    func config(model:MCreateFrame)
    {
        viewSelected.timer?.invalidate()
        self.model = model
        
        hover()
        updateText()
    }
}
