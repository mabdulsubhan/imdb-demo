//
//  MockMovieListViewController.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 01/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import Foundation
import UIKit
@testable import IMDB

class MockMovieListViewController: MovieListViewController {
    
    var isShowLoaderCalls = false
    var isReloadMoviesCalls = false
    var isShowErrorCalls = false
    var isShowDatePickerCalls = false
    var isShowFilterImageCalls = false
    
    
    override func bindViewModelOutput() {
        
        viewModel.output = { [weak self] output in
            
            guard let self = self else { return }
            switch output {
            case .reloadMovies:
                self.isReloadMoviesCalls = true
            case .showActivityIndicator(show: _):
                self.isShowLoaderCalls = true
            case .showError( _):
                self.isShowErrorCalls = true
            case .showDatePicker( _):
                self.isShowDatePickerCalls = true
            case .showFilterImage( _):
                self.isShowFilterImageCalls = true
            }
        }
    }
    
}
