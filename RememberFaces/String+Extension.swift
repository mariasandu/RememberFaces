//
//  String+Extension.swift
//  RememberFaces
//
//  Created by Maria Sandu on 03.10.2023.
//

import Foundation

extension String {
    var isEmptyOrWithWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
