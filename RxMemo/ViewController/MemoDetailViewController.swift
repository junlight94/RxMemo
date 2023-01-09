//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by Junyoung on 2023/01/09.
//

import UIKit

class MemoDetailViewController: UIViewController, ViewModelBindableType {

    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var deleteButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var viewModel: MemoDetailViewModel!
    
    func bindViewModel() {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

}
