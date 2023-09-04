#if !os(Linux)
import Foundation

/// NSData is convertible to and from DatabaseValue.
extension NSData: DatabaseValueConvertible {
    
    /// Returns a BLOB database value.
    public var databaseValue: DatabaseValue {
        (self as Data).databaseValue
    }
    
    public var sqlJSON: SQLJSON {
        (self as Data).sqlJSON
    }
    
    /// Returns a `NSData` from the specified database value.
    ///
    /// If the database value contains a data blob, returns it.
    ///
    /// If the database value contains a string, returns this string converted
    /// to UTF8 data.
    ///
    /// Otherwise, returns nil.
    public static func fromDatabaseValue(_ dbValue: DatabaseValue) -> Self? {
        guard let data = Data.fromDatabaseValue(dbValue) else {
            return nil
        }
        return cast(data)
    }
}
#endif
