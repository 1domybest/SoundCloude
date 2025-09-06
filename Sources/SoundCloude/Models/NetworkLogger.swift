import Foundation
import SwiftUICore
import SwiftUI

/// 네트워크 로거 (DEBUG 빌드에서만 시끄럽게 출력)
enum NetworkLogger {
  static func log(request: URLRequest, response: HTTPURLResponse, data: Data) {
      print("➡️ [REQUEST]")
      if let method = request.httpMethod, let url = request.url?.absoluteString {
        print("  \(method) \(url)")
      }
      if let headers = request.allHTTPHeaderFields, !headers.isEmpty {
        print("  headers:", headers)
      }
      if let body = request.httpBody, !body.isEmpty {
        print("  body:", prettyJSONString(from: body) ?? String(data: body, encoding: .utf8) ?? "<binary>")
      }

      print("⬅️ [RESPONSE]")
      print("  status:", response.statusCode)
      print("  headers:", response.allHeaderFields)

      if let pretty = prettyJSONString(from: data) {
        print("  body(JSON):\n\(pretty)")
      } else if let text = String(data: data, encoding: .utf8) {
        print("  body(TEXT):\n\(text)")
      } else {
        print("  body: <\(data.count) bytes>")
      }
  }

  static func logDecodingError(_ error: Error, data: Data) {
      print("❌ [DECODING ERROR]:", error)
      if case let DecodingError.dataCorrupted(ctx) = error {
        print("  dataCorrupted:", ctx.debugDescription, "codingPath:", ctx.codingPath.map(\.stringValue))
      } else if case let DecodingError.keyNotFound(key, ctx) = error {
        print("  keyNotFound:", key.stringValue, "|", ctx.debugDescription, "path:", ctx.codingPath.map(\.stringValue))
      } else if case let DecodingError.typeMismatch(type, ctx) = error {
        print("  typeMismatch:", type, "|", ctx.debugDescription, "path:", ctx.codingPath.map(\.stringValue))
      } else if case let DecodingError.valueNotFound(type, ctx) = error {
        print("  valueNotFound:", type, "|", ctx.debugDescription, "path:", ctx.codingPath.map(\.stringValue))
      }

      if let pretty = prettyJSONString(from: data) {
        print("  RAW(JSON):\n\(pretty)")
      } else if let text = String(data: data, encoding: .utf8) {
        print("  RAW(TEXT):\n\(text)")
      } else {
        print("  RAW: <\(data.count) bytes>")
      }
  }

  private static func prettyJSONString(from data: Data) -> String? {
    guard
      let obj = try? JSONSerialization.jsonObject(with: data),
      JSONSerialization.isValidJSONObject(obj),
      let pretty = try? JSONSerialization.data(withJSONObject: obj, options: [.prettyPrinted]),
      let str = String(data: pretty, encoding: .utf8)
    else { return nil }
    return str
  }
}
