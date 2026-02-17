//
//  CharactersHeaderView.swift
//  RickAndMorty
//
//  Created by Natali Zhgenti on 03.12.25.
//

import SwiftUI

enum Pages {
    case characters
    case episodes
    case search
    case locations
    
    var title: String {
        switch self {
        case .characters:
            "Characters"
        case .episodes:
            "Episodes"
        case .search:
            "Search"
        case .locations:
            "Locations"
        }
    }
}

struct CustomHeaderView: View {
    
    //MARK: - Properties
    @ObservedObject var searchViewModel: SearchViewModel
    
    @Binding var text: String
    @Binding var selectedSegment: String
    
    private var page: Pages
    
    //MARK: - Init
    init(page: Pages) {
        self.page = page
        self._text = .constant("")
        self._selectedSegment = .constant("")
        self.searchViewModel = SearchViewModel()
    }
    
    init(page: Pages, searchViewModel: SearchViewModel, text: Binding<String>, selectedSegment: Binding<String>) {
        self.page = page
        self.searchViewModel = searchViewModel
        self._text = text
        self._selectedSegment = selectedSegment
    }
    
    //MARK: - Body
    var body: some View {
        VStack {
            makeHeaderView(for: page)
        }
    }
    
    //MARK: - Methods
    @ViewBuilder
    func makeHeaderView(for page: Pages) -> some View {
        ZStack(alignment: .top) {
            Color.black
            VStack {
                Text(page.title)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(.white)
                
                if page == .search {
                    TextField("", text: $text, prompt: Text("Search")
                        .foregroundColor(.customGray)
                    )
                    .foregroundStyle(.customGray)
                    
                    //search
                    .onChange(of: text) {
                        Task {
                            await searchViewModel.loadSearchedItems(for: text, selectedSegment: selectedSegment)
                        }
                    }
                    
                    .onChange(of: selectedSegment) {
                        searchViewModel.clearAll()
                        Task {
                            await searchViewModel.loadSearchedItems(for: text, selectedSegment: selectedSegment)
                        }
                    }
                    
                    .safeAreaInset(edge: .leading) {
                        Image(systemName: "magnifyingglass")
                            .font(.system(size: 22))
                            .foregroundStyle(.customGray)
                            .padding(.leading, 16)
                    }
                    .padding(8)
                    
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill()
                            .strokeBorder(style: .init(lineWidth: 1))
                            .foregroundStyle(Color.customBlue)
                            .padding(.horizontal, 16)
                    }
                }
            }
        }
        .frame(height: page == .search ? 110 : 50)
    }
}


#Preview {
    //    CustomHeaderView(page: .search)
    //    CustomHeaderView(page: .episodes)
    SearchView()
}
