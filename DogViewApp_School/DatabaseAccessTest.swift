//
//  DatabaseAccessTest.swift
//  DogViewApp_School
//
//  Created by user on 2023/09/15.
//

import Foundation
import SQLite3

final class DatabaseAccessTest {
    static let shared = DatabaseAccessTest()
    
    private let dbFile = "DBVer1.sqlite"
    private var db: OpaquePointer?
    
    private init() {
        print(NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true))

        db = openDatabase()
        if !createTable() {
            print("Failed to create table")
        }
    }
    
    private func openDatabase() -> OpaquePointer? {
        let fileURL = try! FileManager.default.url(for: .documentDirectory,
                                                   in: .userDomainMask,
                                                   appropriateFor: nil,
                                                   create: false).appendingPathComponent(dbFile)
        
        var db: OpaquePointer? = nil
        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Failed to open database")
            return nil
        }
        else {
            print("Opened connection to database")
            return db
        }
    }
    
    private func createTable() -> Bool {
        let createSql = """
        CREATE TABLE IF NOT EXISTS breeds (
            breed_name TEXT NOT NULL PRIMARY KEY
        );
        """
        
        var createStmt: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, (createSql as NSString).utf8String, -1, &createStmt, nil) != SQLITE_OK {
            print("db error: \(getDBErrorMessage(db))")
            return false
        }
        
        if sqlite3_step(createStmt) != SQLITE_DONE {
            print("db error: \(getDBErrorMessage(db))")
            sqlite3_finalize(createStmt)
            return false
        }
        
        sqlite3_finalize(createStmt)
        print("table created.")
        return true
    }
    
    private func getDBErrorMessage(_ db: OpaquePointer?) -> String {
        if let err = sqlite3_errmsg(db) {
            return String(cString: err)
        } else {
            return ""
        }
    }
    
    func insertBreed(breed: Breed) -> Bool {
        let insertSql = """
                        INSERT INTO breeds
                            (breed_name)
                            VALUES
                            (?);
                        """;
        var insertStmt: OpaquePointer? = nil
        
        if sqlite3_prepare_v2(db, (insertSql as NSString).utf8String, -1, &insertStmt, nil) != SQLITE_OK {
            print("db error: \(getDBErrorMessage(db))")
            return false
        }
        
        sqlite3_bind_text(insertStmt, 1, (breed.breed as NSString).utf8String, -1, nil)
        
        if sqlite3_step(insertStmt) != SQLITE_DONE {
            print("db error: \(getDBErrorMessage(db))")
            sqlite3_finalize(insertStmt)
            return false
        }
        sqlite3_finalize(insertStmt)
        return true
    }
    
}


struct Breed {
    var breed: String
    
    init(breed: String) {
        self.breed = breed
    }
}
