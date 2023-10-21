//
//  KeyboardState.swift
//  notesapp
//
//  Created by Clement Skosana on 2023/10/21.
//

import Combine
import SwiftUI
extension View {
    var keyboardPublisher: AnyPublisher<Bool, Never> {
        Publishers
          .Merge(
            NotificationCenter
              .default
              .publisher(for: UIResponder.keyboardWillShowNotification)
              .map { _ in true },
            NotificationCenter
              .default
              .publisher(for: UIResponder.keyboardWillHideNotification)
              .map { _ in false })
          .debounce(for: .seconds(0.1), scheduler: RunLoop.main)
          .eraseToAnyPublisher()
    }
}
