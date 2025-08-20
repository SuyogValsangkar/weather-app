//
//  LoadingView.swift
//  WeatherApp
//
//  Created by suva on 8/18/25.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
            ProgressView("Fetching Live Weather Data")
                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}

#Preview {
    LoadingView()
}
