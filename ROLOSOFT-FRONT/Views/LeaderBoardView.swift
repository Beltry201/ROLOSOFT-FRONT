//
//  LeaderBoardView.swift
//  ROLOSOFT-FRONT
//
//  Created by Juan Camilo Bedoya Barbosa on 27/05/24.
//

import SwiftUI

struct LeaderBoardView: View {
    @StateObject var apiService = APIService()
    
    var body: some View {
        GeneralTable(apiService: apiService)
    }
}

struct LeaderBoardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderBoardView()
    }
}
