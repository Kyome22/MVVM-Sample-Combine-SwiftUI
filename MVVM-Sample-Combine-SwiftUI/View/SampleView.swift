//
//  SampleView.swift
//  MVVM-Sample-Combine-SwiftUI
//
//  Created by Takuto Nakamura on 2021/12/11.
//

import SwiftUI
import Combine

struct SampleView: View {
    @ObservedObject var viewModel = SampleViewModel()
    
    var body: some View {
        VStack {
            TextField("ID", text: $viewModel.idInputText)
                .accessibilityIdentifier("text-field-id")
                .textFieldStyle(SquareBorderTextFieldStyle())
                .padding(.bottom, 16)
            TextField("Password", text: $viewModel.passwordInputText)
                .accessibilityIdentifier("text-field-password")
                .textFieldStyle(SquareBorderTextFieldStyle())
                .padding(.bottom, 16)
            Text(viewModel.validationResult)
                .accessibilityIdentifier("label-validation")
                .foregroundColor(viewModel.loadLabelColor)
            Spacer(minLength: 0)
        }
        .frame(minWidth: 240)
        .padding(20)
    }
}

struct SampleView_Previews: PreviewProvider {
    static var previews: some View {
        SampleView()
    }
}
