import CryptoSwift

let stringToEcrypt = "Nothing to see here!"
let key = "passwordpassword" // aes128
let iv = "drowssapdrowssap" // aes128

func aesEncrypt() throws -> String {
    let encrypted = try AES(key: key, iv: iv, padding: .pkcs7).encrypt(Array(stringToEcrypt.utf8))
    return Data(encrypted).base64EncodedString()
}

let encryptedString = try! aesEncrypt()

func aesDecrypt() throws -> String {
    guard let data = Data(base64Encoded: encryptedString) else { return "" }
    let decrypted = try AES(key: key, iv: iv, padding: .pkcs7).decrypt([UInt8](data))
    return String(bytes: Data(decrypted).bytes, encoding: .utf8) ?? "Could not decrypt"
}

let decryptedString = try! aesDecrypt()

if stringToEcrypt == decryptedString {
    print("Ecryption works!")
}

