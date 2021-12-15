//
//  SampleViewModel.swift
//  MVVM-Sample-Combine-SwiftUI
//
//  Created by Takuto Nakamura on 2021/12/12.
//

import SwiftUI
import Combine

final class SampleViewModel: ObservableObject {
    private let model: SampleModelProtocol
    private var cancellables = Set<AnyCancellable>()
    
    @Published var idInputText = ""
    @Published var passwordInputText = ""
    @Published var validationResult = "IDとPasswordを入力してください。"
    @Published var loadLabelColor = Color.primary
    
    init(model: SampleModelProtocol = SampleModel()) {
        self.model = model
        
        $idInputText
            .combineLatest($passwordInputText)
            .dropFirst()
            .sink(receiveValue: { [weak self] (id, password) in
                self?.idPasswordChanged(id: id, password: password)
            })
            .store(in: &cancellables)
        
        model.validatePublisher
            .sink(receiveValue: { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success():
                    self.validationResult = "OK!!!"
                    self.loadLabelColor = Color.green
                case .failure(let error):
                    self.validationResult = error.errorText
                    self.loadLabelColor = Color.red
                }
            })
            .store(in: &cancellables)
    }
    
    private func idPasswordChanged(id: String, password: String) {
        model.validate(idText: id, passwordText: password)
    }
}
