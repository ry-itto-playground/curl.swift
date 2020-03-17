import Foundation

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
            let responseString = String(data: data!, encoding: .utf8)
            print(responseString!)
            semaphore.signal()
        }.resume()

        semaphore.wait()
    }
}

CurlCommand.main()
