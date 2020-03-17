import Foundation

extension CurlCommand {
    func run() throws {
        let semaphore = DispatchSemaphore(value: 0)
        guard let url = URL(string: url) else { fatalError() }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let responseString = String(data: data!, encoding: .utf8)
            print(responseString!)
            semaphore.signal()
        }.resume()

        semaphore.wait()
    }
}

CurlCommand.main()
