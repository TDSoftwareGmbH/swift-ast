/*
   Copyright 2017 Ryuichi Laboratories and the Yanagiba project contributors

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
*/

import Source
import AST
import Lexer

extension Parser {
  func assert(_ cond: Bool, orFatal fatalError: ParserErrorKind) throws {
    guard cond else { throw _raiseFatal(fatalError) }
  }

  func match(_ kinds: [Token.Kind], exactMatch: Bool = false, orFatal fatalError: ParserErrorKind) throws {
    try assert(_lexer.match(kinds, exactMatch: exactMatch), orFatal: fatalError)
  }

  func match(_ kind: Token.Kind, exactMatch: Bool = false, orFatal fatalError: ParserErrorKind) throws {
    try match([kind], exactMatch: exactMatch, orFatal: fatalError)
  }

  func readIdentifier(_ id: String, orFatal fatalError: ParserErrorKind) throws {
    try assert(_lexer.read(.dummyIdentifier) == .identifier(id), orFatal: fatalError)
  }
}
