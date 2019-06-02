//
//  MovieListViewController.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 30/05/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import UIKit
import SVProgressHUD

/// MovieListViewController
class MovieListViewController: UIViewController {
    
    /// Outlets
    @IBOutlet weak var rightBarButton: UIBarButtonItem!
    @IBOutlet weak var movieListTableview: UITableView!
    @IBOutlet weak var datePickerView: DatePickerView!
    @IBOutlet var noDataView: UIView!
    
    var datePickerTopConstraint = NSLayoutConstraint()
    var viewModel: MovieListViewModelProtocol!
 
    
    /// View Life cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindViewModelOutput()
        viewModel.didLoad()
    }
    
    /// Outlet Actions
    @IBAction func onRightBarButtonTapped(_ sender: UIBarButtonItem) {
        viewModel.performCTA()
    }
  
    /// Methods
    private func setupUI() {
        setupDatePickerView()
        movieListTableview.register(cellType: MovieListTableViewCell.self)
        movieListTableview.backgroundView = noDataView
    }

    func bindViewModelOutput() {
        viewModel.output = { [weak self] output in
            
            guard let self = self else { return }
            
            switch output {
            case .reloadMovies:
                self.movieListTableview.reloadData()
            case .showActivityIndicator(let show):
            show ? SVProgressHUD.show() : SVProgressHUD.dismiss()
            case .showError(let error):
                UIAlertController.showAlert(withMessage: error.localizedDescription)
            case .showDatePicker(let show):
                (show) ? self.showDatePicker()  :  self.hideDatePicker()
            case .showFilterImage(let show):
                self.rightBarButton.image = show ? UIImage(named: "resetIcon") : UIImage(named: "filterIcon")
            }
        }
    }
}
