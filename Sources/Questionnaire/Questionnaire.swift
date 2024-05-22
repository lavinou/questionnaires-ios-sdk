// The Swift Programming Language
// https://docs.swift.org/swift-book

public class Questionnaire {
    
    private init(builder: Builder) {
        
    }
    
    
    public class Builder {
        
        public func build() -> Questionnaire {
            return Questionnaire(builder: self)
        }
    }
}
