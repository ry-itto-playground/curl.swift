import Foundation
import PathKit

extension CurlCommand {
    func run() throws {
        guard let url = URL(string: url) else { fatalError() }

        let semaphore = DispatchSemaphore(value: 0)

        let request: URLRequest = {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            return request
        }()

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let responseString = String(data: data!, encoding: .utf8) else {
                return
            }
            if let output = self.output {
                let path = Path.current + Path(output)
                try? path.write(responseString)
            } else {
                print(responseString)
            }
            semaphore.signal()
        }.resume()

        semaphore.wait()
    }
}

CurlCommand.main()
