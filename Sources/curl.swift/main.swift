import Foundation
import PathKit

extension CurlCommand {
    func run() throws {
        guard let url = URL(string: url) else { fatalError() }

        let semaphore = DispatchSemaphore(value: 0)

        let request: URLRequest = {
            var request = URLRequest(url: url)
            request.httpMethod = method.rawValue
            if let data = data {
                request.httpBody = data.data(using: .utf8)
            }
            return request
        }()

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let responseString = String(data: data!, encoding: .utf8) else {
                return
            }
            var outputString = ""

            if let response = response as? HTTPURLResponse {
                outputString += PrettyPrinter.printString(response.allHeaderFields) 
            }
            outputString += "\n" + responseString
            if let output = self.output {
                let path = Path.current + Path(output)
                try? path.write(outputString)
            } else {
                print(outputString)
            }
            semaphore.signal()
        }.resume()

        semaphore.wait()
    }
}

CurlCommand.main()
