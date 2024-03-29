//
//  MovieListViewController+UITableView.swift
//  IMDB
//
//  Created by Muhammad Abdul Subhan on 02/06/2019.
//  Copyright © 2019 VentureDive. All rights reserved.
//

import UIKit

extension MovieListViewController : UITableViewDataSource , UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfMovies
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movieListCell: MovieListTableViewCell  = tableView.dequeueReusableCell(for: indexPath)
        let cellViewModel = viewModel.getMovieListCellViewModel(index: indexPath.row)
        movieListCell.populateWithViewModel(cellViewModel: cellViewModel)
        return movieListCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectMovie(index: indexPath.row)
    }
}

extension MovieListViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        if scrollView.isAtBottom() {
            viewModel.tableViewDidReachToEnd()
        }
    }
}
