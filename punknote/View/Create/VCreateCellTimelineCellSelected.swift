import UIKit

class VCreateCellTimelineCellSelected:UIView
{
    weak var timer:Timer?
    private weak var controller:CCreate?
    private let kCircleMargin:CGFloat = 8
    private let kLineWidth:CGFloat = 3
    private let kTimerInterval:TimeInterval = 0.03
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        backgroundColor = UIColor.clear
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        timer?.invalidate()
    }
    
    override func draw(_ rect:CGRect)
    {
        guard
        
            let model:MCreateSelected = controller?.model.selected,
            let context:CGContext = UIGraphicsGetCurrentContext()
        
        else
        {
            return
        }
        
        let width:CGFloat = rect.size.width
        let width_2:CGFloat = width / 2.0
        let width_2_margin:CGFloat = width_2 - kCircleMargin
        let centerPoint:CGPoint = CGPoint(x:width_2, y:width_2)
        
        context.setLineCap(CGLineCap.square)
        context.setLineWidth(kLineWidth)
        context.setStrokeColor(UIColor.punkPurple.cgColor)
        
        for item:MCreateSelectedItem in model.items
        {
            context.addArc(
                center:centerPoint,
                radius:width_2_margin,
                startAngle:item.startingRad,
                endAngle:item.endingRad,
                clockwise:false)
            
            context.drawPath(using:CGPathDrawingMode.stroke)
        }
    }
    
    //MARK: actions
    
    func actionTimer(sender timer:Timer)
    {
        DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
        { [weak self] in
            
            self?.asyncTimer()
        }
    }
    
    //MARK: private
    
    private func asyncTimer()
    {
        guard
            
            let model:MCreateSelected = controller?.model.selected
            
        else
        {
            timer?.invalidate()
            
            return
        }
        
        model.rotate()
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.setNeedsDisplay()
        }
    }
    
    //MARK: public

    func config(controller:CCreate?)
    {
        self.controller = controller
    }
    
    func selected(isSelected:Bool)
    {
        timer?.invalidate()
        
        if isSelected
        {
            timer = Timer.scheduledTimer(
                timeInterval:kTimerInterval,
                target:self,
                selector:#selector(actionTimer(sender:)),
                userInfo:nil,
                repeats:true)
        }
    }
}
