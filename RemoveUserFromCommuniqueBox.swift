
import Foundation

class RemoveUserFromCommuniqueBox: NSObject, NSXMLParserDelegate, _IFaceAPI{
    var methodName: String = "RemoveUserFromCommuniqueBox"
    var pageTarget: _IFaceCallTarget?
    var soapEnv: String = ""
    var respCode: Int = 10
    
    func request(params:[String])
    {
        self.soapEnv = "<?xml version='1.0' encoding='utf-8'?><soap:Envelope xmlns:xsi='http://www.w3.org/2001/XMLSchema-instance' xmlns:xsd='http://www.w3.org/2001/XMLSchema' xmlns:soap='http://schemas.xmlsoap.org/soap/envelope/'><soap:Body><RemoveUserFromCommuniqueBox xmlns='http://tempuri.org/'><suidSession>\(params[0])</suidSession><suidComminiqueBox>\(params[1])</suidComminiqueBox></RemoveUserFromCommuniqueBox></soap:Body></soap:Envelope>"
    }
    
    func response(response responseData: NSMutableData)
    {
        do {
            let xmlDoc = try AEXMLDocument(xmlData: responseData)
            respCode=Int(xmlDoc.root["soap:Body"]["\(methodName)Response"]["\(methodName)Result"]["_jResponseCode"].value!)!
            // pageTarget?.serviceResponse(self)
        } catch _ {
        }
    }
}
