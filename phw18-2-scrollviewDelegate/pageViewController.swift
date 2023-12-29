//
//  pageViewController.swift
//  phw18-2-scrollviewDelegate
//
//  Created by jasonhung on 2023/12/29.
//

import UIKit

class pageViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet var drinkImageViews: [UIImageView]!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // 定義 protocol UIScrollViewDelegate 的 function
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let page = scrollView.contentOffset.x / scrollView.bounds.width
            pageControl.currentPage = Int(page)
    }
    func viewForZooming(in scrollView: UIScrollView) -> UIView?{ // return a view that will be scaled. if delegate returns nil, nothing happens
        //以Page Control的所在頁數判斷現在是哪一張圖片要進行縮放動作
        return drinkImageViews[pageControl.currentPage]
    }

    @IBAction func changePage(_ sender: UIPageControl) {
        let point = CGPoint(x: scrollView.bounds.width * CGFloat(sender.currentPage), y: 0)
                scrollView.setContentOffset(point, animated: true)
    }
}

extension pageViewController: UIScrollViewDelegate {
    
}
