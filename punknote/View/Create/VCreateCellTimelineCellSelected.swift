import UIKit

class VCreateCellTimelineCellSelected:UIView
{
    private weak var timer:Timer?
    private weak var controller:CCreate?
    private let kCircleMargin:CGFloat = 3
    private let kTimerInterval:TimeInterval = 0.03
    
    init()
    {
        super.init(frame:CGRect.zero)
        clipsToBounds = true
        isUserInteractionEnabled = false
        translatesAutoresizingMaskIntoConstraints = false
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
        
            let context:CGContext = UIGraphicsGetCurrentContext()
        
        else
        {
            return
        }
        
        let width:CGFloat = rect.size.width
        let width_2:CGFloat = width / 2.0
        let width_2_margin:CGFloat = width_2 - kCircleMargin
        let centerPoint:CGPoint = CGPoint(x:width_2, y:width_2)
        
    }
    
    //MARK: actions
    
    func actionTimer(sender timer:Timer)
    {
        if controller == nil
        {
            timer.invalidate()
        }
        
        setNeedsDisplay()
    }
    
    //MARK: private
    
    private func refreshModel()
    {
        controller?.model.selected.refresh()
        
        DispatchQueue.main.async
        { [weak self] in
            
            self?.startTimer()
        }
    }
    
    private func startTimer()
    {
        timer = Timer.scheduledTimer(
            timeInterval:kTimerInterval,
            target:self,
            selector:#selector(actionTimer(sender:)),
            userInfo:nil,
            repeats:true)
    }
    
    //MARK: public

    func config(controller:CCreate)
    {
        self.controller = controller
    }
    
    func selected(animate:Bool)
    {
        timer?.invalidate()
        
        if animate
        {
            DispatchQueue.global(qos:DispatchQoS.QoSClass.background).async
            { [weak self] in
                
                self?.refreshModel()
            }
        }
    }
}
