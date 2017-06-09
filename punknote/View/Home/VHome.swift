import UIKit

class VHome:View, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    private weak var spinner:VSpinner!
    private weak var collectionView:VCollection!
    private let kBarHeight:CGFloat = 64
    private let kInterItem:CGFloat = 1
    private let kCollectionBottom:CGFloat = 20
    private let kCellHeight:CGFloat = 120
    private let kFooterHeight:CGFloat = 60
    
    required init(controller:UIViewController)
    {
        super.init(controller:controller)
        backgroundColor = UIColor(white:0.96, alpha:1)
        
        guard
            
            let controller:CHome = controller as? CHome
        
        else
        {
            return
        }
        
        let spinner:VSpinner = VSpinner()
        self.spinner = spinner
        
        let viewBar:VHomeBar = VHomeBar(controller:controller)
        
        let collectionView:VCollection = VCollection()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.registerCell(cell:VHomeCell.self)
        collectionView.registerFooter(footer:VHomeFooter.self)
        self.collectionView = collectionView
        
        if let flow:VCollectionFlow = collectionView.collectionViewLayout as? VCollectionFlow
        {
            flow.minimumLineSpacing = kInterItem
            flow.sectionInset = UIEdgeInsets(
                top:kBarHeight,
                left:0,
                bottom:kCollectionBottom,
                right:0)
        }
        
        addSubview(spinner)
        addSubview(collectionView)
        addSubview(viewBar)
        
        NSLayoutConstraint.equals(
            view:spinner,
            toView:self)
        
        NSLayoutConstraint.topToTop(
            view:viewBar,
            toView:self)
        NSLayoutConstraint.height(
            view:viewBar,
            constant:kBarHeight)
        NSLayoutConstraint.equalsHorizontal(
            view:viewBar,
            toView:self)
    }
    
    required init?(coder:NSCoder)
    {
        return nil
    }
    
    deinit
    {
        spinner.stopAnimating()
    }
    
    //MARK: public
    
    func startLoading()
    {
        spinner.startAnimating()
        collectionView.isHidden = true
    }
    
    func stopLoading()
    {
        spinner.stopAnimating()
        collectionView.isHidden = false
        collectionView.reloadData()
    }
    
    //MARK: private
    
    private func modelAtIndex(index:IndexPath) -> MHomeItem
    {
        let controller:CHome = self.controller as! CHome
        let item:MHomeItem = controller.model.items[index.item]
        
        return item
    }
    
    //MARK: collectionView delegate
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, referenceSizeForFooterInSection section:Int) -> CGSize
    {
        guard
            
            let controller:CHome = self.controller as? CHome
            
        else
        {
            return CGSize.zero
        }
        
        let size:CGSize
        
        if controller.model.items.count > 0
        {
            size = CGSize.zero
        }
        else
        {
            size = CGSize(width:0, height:kFooterHeight)
        }
        
        return size
    }
    
    func collectionView(_ collectionView:UICollectionView, layout collectionViewLayout:UICollectionViewLayout, sizeForItemAt indexPath:IndexPath) -> CGSize
    {
        let width:CGFloat = collectionView.bounds.size.width
        let size:CGSize = CGSize(width:width, height:kCellHeight)
        
        return size
    }
    
    func numberOfSections(in collectionView:UICollectionView) -> Int
    {
        return 1
    }
    
    func collectionView(_ collectionView:UICollectionView, numberOfItemsInSection section:Int) -> Int
    {
        guard
        
            let controller:CHome = self.controller as? CHome
        
        else
        {
            return 0
        }
        
        let count:Int = controller.model.items.count
        
        return count
    }
    
    func collectionView(_ collectionView:UICollectionView, viewForSupplementaryElementOfKind kind:String, at indexPath:IndexPath) -> UICollectionReusableView
    {
        let footer:UICollectionReusableView = collectionView.dequeueReusableSupplementaryView(
            ofKind:kind,
            withReuseIdentifier:VHomeFooter.reusableIdentifier,
            for:indexPath)
        
        return footer
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let item:MHomeItem = modelAtIndex(index:indexPath)
        let cell:VHomeCell = collectionView.dequeueReusableCell(
            withReuseIdentifier:
            VHomeCell.reusableIdentifier,
            for:indexPath) as! VHomeCell
        cell.config(model:item)
        
        return cell
    }
}
