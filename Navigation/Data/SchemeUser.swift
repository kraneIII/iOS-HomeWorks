import UIKit
import Foundation

let userDebug = User(login: "kranelll",
fullName: "Nik",
avatar: UIImage(named: "avatar")!,
status:  "Sleeping")

let userRealese = User(login: "kranelll",
fullName: "Maks",
avatar: UIImage(named: "avatar")!,
status: "Online")

class UserModel {
    #if DEBUG
    let user = CurrentUserService(user: userDebug).checkLogin(login: userDebug)
    #else
    let user = TestUserService(user: userRealese).checkLogin(login: userRealese)
    #endif
        
}

