// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetVideoUrlDataMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation GetVideoUrlData($videoId: String!) {
      getVideoUrlData(arg1: {videoId: $videoId}) {
        __typename
        videoUrl
      }
    }
    """

  public let operationName: String = "GetVideoUrlData"

  public var videoId: String

  public init(videoId: String) {
    self.videoId = videoId
  }

  public var variables: GraphQLMap? {
    return ["videoId": videoId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getVideoUrlData", arguments: ["arg1": ["videoId": GraphQLVariable("videoId")]], type: .nonNull(.object(GetVideoUrlDatum.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getVideoUrlData: GetVideoUrlDatum) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "getVideoUrlData": getVideoUrlData.resultMap])
    }

    public var getVideoUrlData: GetVideoUrlDatum {
      get {
        return GetVideoUrlDatum(unsafeResultMap: resultMap["getVideoUrlData"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getVideoUrlData")
      }
    }

    public struct GetVideoUrlDatum: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["GetVideoUrlDataOutput"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("videoUrl", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(videoUrl: String) {
        self.init(unsafeResultMap: ["__typename": "GetVideoUrlDataOutput", "videoUrl": videoUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var videoUrl: String {
        get {
          return resultMap["videoUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "videoUrl")
        }
      }
    }
  }
}

public final class UpdateVideoAsLikedByUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateVideoAsLikedByUser($userId: uuid!, $videoId: String!) {
      insert__User_likedVideos_one(object: {A: $userId, B: $videoId}) {
        __typename
        A
        B
      }
      delete__User_dislikedVideos(where: {A: {_eq: $userId}, B: {_eq: $videoId}}) {
        __typename
        returning {
          __typename
          User {
            __typename
            userUuid
          }
          Video {
            __typename
            id
          }
        }
      }
    }
    """

  public let operationName: String = "UpdateVideoAsLikedByUser"

  public var userId: String
  public var videoId: String

  public init(userId: String, videoId: String) {
    self.userId = userId
    self.videoId = videoId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "videoId": videoId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert__User_likedVideos_one", arguments: ["object": ["A": GraphQLVariable("userId"), "B": GraphQLVariable("videoId")]], type: .object(InsertUserLikedVideosOne.selections)),
        GraphQLField("delete__User_dislikedVideos", arguments: ["where": ["A": ["_eq": GraphQLVariable("userId")], "B": ["_eq": GraphQLVariable("videoId")]]], type: .object(DeleteUserDislikedVideo.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertUserLikedVideosOne: InsertUserLikedVideosOne? = nil, deleteUserDislikedVideos: DeleteUserDislikedVideo? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert__User_likedVideos_one": insertUserLikedVideosOne.flatMap { (value: InsertUserLikedVideosOne) -> ResultMap in value.resultMap }, "delete__User_dislikedVideos": deleteUserDislikedVideos.flatMap { (value: DeleteUserDislikedVideo) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "_User_likedVideos"
    public var insertUserLikedVideosOne: InsertUserLikedVideosOne? {
      get {
        return (resultMap["insert__User_likedVideos_one"] as? ResultMap).flatMap { InsertUserLikedVideosOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert__User_likedVideos_one")
      }
    }

    /// delete data from the table: "_User_dislikedVideos"
    public var deleteUserDislikedVideos: DeleteUserDislikedVideo? {
      get {
        return (resultMap["delete__User_dislikedVideos"] as? ResultMap).flatMap { DeleteUserDislikedVideo(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete__User_dislikedVideos")
      }
    }

    public struct InsertUserLikedVideosOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["_User_likedVideos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("A", type: .nonNull(.scalar(String.self))),
          GraphQLField("B", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(a: String, b: String) {
        self.init(unsafeResultMap: ["__typename": "_User_likedVideos", "A": a, "B": b])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var a: String {
        get {
          return resultMap["A"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "A")
        }
      }

      public var b: String {
        get {
          return resultMap["B"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "B")
        }
      }
    }

    public struct DeleteUserDislikedVideo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["_User_dislikedVideos_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("returning", type: .nonNull(.list(.nonNull(.object(Returning.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(returning: [Returning]) {
        self.init(unsafeResultMap: ["__typename": "_User_dislikedVideos_mutation_response", "returning": returning.map { (value: Returning) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// data from the rows affected by the mutation
      public var returning: [Returning] {
        get {
          return (resultMap["returning"] as! [ResultMap]).map { (value: ResultMap) -> Returning in Returning(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Returning) -> ResultMap in value.resultMap }, forKey: "returning")
        }
      }

      public struct Returning: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_User_dislikedVideos"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("User", type: .nonNull(.object(User.selections))),
            GraphQLField("Video", type: .nonNull(.object(Video.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(user: User, video: Video) {
          self.init(unsafeResultMap: ["__typename": "_User_dislikedVideos", "User": user.resultMap, "Video": video.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var user: User {
          get {
            return User(unsafeResultMap: resultMap["User"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "User")
          }
        }

        /// An object relationship
        public var video: Video {
          get {
            return Video(unsafeResultMap: resultMap["Video"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Video")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("userUuid", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(userUuid: String) {
            self.init(unsafeResultMap: ["__typename": "User", "userUuid": userUuid])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var userUuid: String {
            get {
              return resultMap["userUuid"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "userUuid")
            }
          }
        }

        public struct Video: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Video"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String) {
            self.init(unsafeResultMap: ["__typename": "Video", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}

public final class UpdateVideoAsDislikedByUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateVideoAsDislikedByUser($userId: uuid!, $videoId: String!) {
      insert__User_dislikedVideos_one(object: {A: $userId, B: $videoId}) {
        __typename
        A
        B
      }
      delete__User_likedVideos(where: {A: {_eq: $userId}, B: {_eq: $videoId}}) {
        __typename
        returning {
          __typename
          User {
            __typename
            userUuid
          }
          Video {
            __typename
            id
          }
        }
      }
    }
    """

  public let operationName: String = "UpdateVideoAsDislikedByUser"

  public var userId: String
  public var videoId: String

  public init(userId: String, videoId: String) {
    self.userId = userId
    self.videoId = videoId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "videoId": videoId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("insert__User_dislikedVideos_one", arguments: ["object": ["A": GraphQLVariable("userId"), "B": GraphQLVariable("videoId")]], type: .object(InsertUserDislikedVideosOne.selections)),
        GraphQLField("delete__User_likedVideos", arguments: ["where": ["A": ["_eq": GraphQLVariable("userId")], "B": ["_eq": GraphQLVariable("videoId")]]], type: .object(DeleteUserLikedVideo.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(insertUserDislikedVideosOne: InsertUserDislikedVideosOne? = nil, deleteUserLikedVideos: DeleteUserLikedVideo? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "insert__User_dislikedVideos_one": insertUserDislikedVideosOne.flatMap { (value: InsertUserDislikedVideosOne) -> ResultMap in value.resultMap }, "delete__User_likedVideos": deleteUserLikedVideos.flatMap { (value: DeleteUserLikedVideo) -> ResultMap in value.resultMap }])
    }

    /// insert a single row into the table: "_User_dislikedVideos"
    public var insertUserDislikedVideosOne: InsertUserDislikedVideosOne? {
      get {
        return (resultMap["insert__User_dislikedVideos_one"] as? ResultMap).flatMap { InsertUserDislikedVideosOne(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "insert__User_dislikedVideos_one")
      }
    }

    /// delete data from the table: "_User_likedVideos"
    public var deleteUserLikedVideos: DeleteUserLikedVideo? {
      get {
        return (resultMap["delete__User_likedVideos"] as? ResultMap).flatMap { DeleteUserLikedVideo(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete__User_likedVideos")
      }
    }

    public struct InsertUserDislikedVideosOne: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["_User_dislikedVideos"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("A", type: .nonNull(.scalar(String.self))),
          GraphQLField("B", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(a: String, b: String) {
        self.init(unsafeResultMap: ["__typename": "_User_dislikedVideos", "A": a, "B": b])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var a: String {
        get {
          return resultMap["A"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "A")
        }
      }

      public var b: String {
        get {
          return resultMap["B"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "B")
        }
      }
    }

    public struct DeleteUserLikedVideo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["_User_likedVideos_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("returning", type: .nonNull(.list(.nonNull(.object(Returning.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(returning: [Returning]) {
        self.init(unsafeResultMap: ["__typename": "_User_likedVideos_mutation_response", "returning": returning.map { (value: Returning) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// data from the rows affected by the mutation
      public var returning: [Returning] {
        get {
          return (resultMap["returning"] as! [ResultMap]).map { (value: ResultMap) -> Returning in Returning(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Returning) -> ResultMap in value.resultMap }, forKey: "returning")
        }
      }

      public struct Returning: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_User_likedVideos"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("User", type: .nonNull(.object(User.selections))),
            GraphQLField("Video", type: .nonNull(.object(Video.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(user: User, video: Video) {
          self.init(unsafeResultMap: ["__typename": "_User_likedVideos", "User": user.resultMap, "Video": video.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var user: User {
          get {
            return User(unsafeResultMap: resultMap["User"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "User")
          }
        }

        /// An object relationship
        public var video: Video {
          get {
            return Video(unsafeResultMap: resultMap["Video"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Video")
          }
        }

        public struct User: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["User"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("userUuid", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(userUuid: String) {
            self.init(unsafeResultMap: ["__typename": "User", "userUuid": userUuid])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var userUuid: String {
            get {
              return resultMap["userUuid"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "userUuid")
            }
          }
        }

        public struct Video: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Video"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String) {
            self.init(unsafeResultMap: ["__typename": "Video", "id": id])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }
        }
      }
    }
  }
}

public final class DeleteVideoLikeStatusForUserMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteVideoLikeStatusForUser($userId: uuid!, $videoId: String!) {
      delete__User_dislikedVideos(where: {A: {_eq: $userId}, B: {_eq: $videoId}}) {
        __typename
        affected_rows
      }
      delete__User_likedVideos(where: {A: {_eq: $userId}, B: {_eq: $videoId}}) {
        __typename
        affected_rows
      }
    }
    """

  public let operationName: String = "DeleteVideoLikeStatusForUser"

  public var userId: String
  public var videoId: String

  public init(userId: String, videoId: String) {
    self.userId = userId
    self.videoId = videoId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId, "videoId": videoId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("delete__User_dislikedVideos", arguments: ["where": ["A": ["_eq": GraphQLVariable("userId")], "B": ["_eq": GraphQLVariable("videoId")]]], type: .object(DeleteUserDislikedVideo.selections)),
        GraphQLField("delete__User_likedVideos", arguments: ["where": ["A": ["_eq": GraphQLVariable("userId")], "B": ["_eq": GraphQLVariable("videoId")]]], type: .object(DeleteUserLikedVideo.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteUserDislikedVideos: DeleteUserDislikedVideo? = nil, deleteUserLikedVideos: DeleteUserLikedVideo? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "delete__User_dislikedVideos": deleteUserDislikedVideos.flatMap { (value: DeleteUserDislikedVideo) -> ResultMap in value.resultMap }, "delete__User_likedVideos": deleteUserLikedVideos.flatMap { (value: DeleteUserLikedVideo) -> ResultMap in value.resultMap }])
    }

    /// delete data from the table: "_User_dislikedVideos"
    public var deleteUserDislikedVideos: DeleteUserDislikedVideo? {
      get {
        return (resultMap["delete__User_dislikedVideos"] as? ResultMap).flatMap { DeleteUserDislikedVideo(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete__User_dislikedVideos")
      }
    }

    /// delete data from the table: "_User_likedVideos"
    public var deleteUserLikedVideos: DeleteUserLikedVideo? {
      get {
        return (resultMap["delete__User_likedVideos"] as? ResultMap).flatMap { DeleteUserLikedVideo(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete__User_likedVideos")
      }
    }

    public struct DeleteUserDislikedVideo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["_User_dislikedVideos_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("affected_rows", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(affectedRows: Int) {
        self.init(unsafeResultMap: ["__typename": "_User_dislikedVideos_mutation_response", "affected_rows": affectedRows])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// number of rows affected by the mutation
      public var affectedRows: Int {
        get {
          return resultMap["affected_rows"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "affected_rows")
        }
      }
    }

    public struct DeleteUserLikedVideo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["_User_likedVideos_mutation_response"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("affected_rows", type: .nonNull(.scalar(Int.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(affectedRows: Int) {
        self.init(unsafeResultMap: ["__typename": "_User_likedVideos_mutation_response", "affected_rows": affectedRows])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// number of rows affected by the mutation
      public var affectedRows: Int {
        get {
          return resultMap["affected_rows"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "affected_rows")
        }
      }
    }
  }
}

public final class GetAppleIdRefreshTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation GetAppleIdRefreshToken($code: String!) {
      getAppleIdRefreshToken(arg1: {code: $code}) {
        __typename
        refreshToken
      }
    }
    """

  public let operationName: String = "GetAppleIdRefreshToken"

  public var code: String

  public init(code: String) {
    self.code = code
  }

  public var variables: GraphQLMap? {
    return ["code": code]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getAppleIdRefreshToken", arguments: ["arg1": ["code": GraphQLVariable("code")]], type: .object(GetAppleIdRefreshToken.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getAppleIdRefreshToken: GetAppleIdRefreshToken? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "getAppleIdRefreshToken": getAppleIdRefreshToken.flatMap { (value: GetAppleIdRefreshToken) -> ResultMap in value.resultMap }])
    }

    public var getAppleIdRefreshToken: GetAppleIdRefreshToken? {
      get {
        return (resultMap["getAppleIdRefreshToken"] as? ResultMap).flatMap { GetAppleIdRefreshToken(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "getAppleIdRefreshToken")
      }
    }

    public struct GetAppleIdRefreshToken: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["GetAppleIdRefreshTokenOutput"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(refreshToken: String) {
        self.init(unsafeResultMap: ["__typename": "GetAppleIdRefreshTokenOutput", "refreshToken": refreshToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var refreshToken: String {
        get {
          return resultMap["refreshToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "refreshToken")
        }
      }
    }
  }
}

public final class RevokeAppleIdRefreshTokenMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation RevokeAppleIdRefreshToken($refreshToken: String!) {
      revokeAppleIdRefreshToken(arg1: {refreshToken: $refreshToken}) {
        __typename
        isRevoked
      }
    }
    """

  public let operationName: String = "RevokeAppleIdRefreshToken"

  public var refreshToken: String

  public init(refreshToken: String) {
    self.refreshToken = refreshToken
  }

  public var variables: GraphQLMap? {
    return ["refreshToken": refreshToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("revokeAppleIdRefreshToken", arguments: ["arg1": ["refreshToken": GraphQLVariable("refreshToken")]], type: .object(RevokeAppleIdRefreshToken.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(revokeAppleIdRefreshToken: RevokeAppleIdRefreshToken? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "revokeAppleIdRefreshToken": revokeAppleIdRefreshToken.flatMap { (value: RevokeAppleIdRefreshToken) -> ResultMap in value.resultMap }])
    }

    public var revokeAppleIdRefreshToken: RevokeAppleIdRefreshToken? {
      get {
        return (resultMap["revokeAppleIdRefreshToken"] as? ResultMap).flatMap { RevokeAppleIdRefreshToken(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "revokeAppleIdRefreshToken")
      }
    }

    public struct RevokeAppleIdRefreshToken: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RevokeAppleIdRefreshTokenOutput"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("isRevoked", type: .nonNull(.scalar(Bool.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(isRevoked: Bool) {
        self.init(unsafeResultMap: ["__typename": "RevokeAppleIdRefreshTokenOutput", "isRevoked": isRevoked])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var isRevoked: Bool {
        get {
          return resultMap["isRevoked"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "isRevoked")
        }
      }
    }
  }
}

public final class DeleteAllUserDataMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteAllUserData($id: uuid!) {
      delete_User_by_pk(id: $id) {
        __typename
        userEmail
        userUuid
      }
    }
    """

  public let operationName: String = "DeleteAllUserData"

  public var id: String

  public init(id: String) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["mutation_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("delete_User_by_pk", arguments: ["id": GraphQLVariable("id")], type: .object(DeleteUserByPk.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteUserByPk: DeleteUserByPk? = nil) {
      self.init(unsafeResultMap: ["__typename": "mutation_root", "delete_User_by_pk": deleteUserByPk.flatMap { (value: DeleteUserByPk) -> ResultMap in value.resultMap }])
    }

    /// delete single row from the table: "User"
    public var deleteUserByPk: DeleteUserByPk? {
      get {
        return (resultMap["delete_User_by_pk"] as? ResultMap).flatMap { DeleteUserByPk(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "delete_User_by_pk")
      }
    }

    public struct DeleteUserByPk: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("userEmail", type: .nonNull(.scalar(String.self))),
          GraphQLField("userUuid", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(userEmail: String, userUuid: String) {
        self.init(unsafeResultMap: ["__typename": "User", "userEmail": userEmail, "userUuid": userUuid])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var userEmail: String {
        get {
          return resultMap["userEmail"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userEmail")
        }
      }

      public var userUuid: String {
        get {
          return resultMap["userUuid"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userUuid")
        }
      }
    }
  }
}

public final class GetAllChannelsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllChannels {
      Channel {
        __typename
        id
        channelName
        ChannelType {
          __typename
          channelTypeCode
        }
        locationLat
        locationLong
        regionCode
        addressText
      }
    }
    """

  public let operationName: String = "GetAllChannels"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Channel", type: .nonNull(.list(.nonNull(.object(Channel.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(channel: [Channel]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Channel": channel.map { (value: Channel) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Channel"
    public var channel: [Channel] {
      get {
        return (resultMap["Channel"] as! [ResultMap]).map { (value: ResultMap) -> Channel in Channel(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Channel) -> ResultMap in value.resultMap }, forKey: "Channel")
      }
    }

    public struct Channel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Channel"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          GraphQLField("ChannelType", type: .object(ChannelType.selections)),
          GraphQLField("locationLat", type: .nonNull(.scalar(String.self))),
          GraphQLField("locationLong", type: .nonNull(.scalar(String.self))),
          GraphQLField("regionCode", type: .nonNull(.scalar(String.self))),
          GraphQLField("addressText", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, channelName: String, channelType: ChannelType? = nil, locationLat: String, locationLong: String, regionCode: String, addressText: String) {
        self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName, "ChannelType": channelType.flatMap { (value: ChannelType) -> ResultMap in value.resultMap }, "locationLat": locationLat, "locationLong": locationLong, "regionCode": regionCode, "addressText": addressText])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var channelName: String {
        get {
          return resultMap["channelName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "channelName")
        }
      }

      /// An object relationship
      public var channelType: ChannelType? {
        get {
          return (resultMap["ChannelType"] as? ResultMap).flatMap { ChannelType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "ChannelType")
        }
      }

      public var locationLat: String {
        get {
          return resultMap["locationLat"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "locationLat")
        }
      }

      public var locationLong: String {
        get {
          return resultMap["locationLong"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "locationLong")
        }
      }

      public var regionCode: String {
        get {
          return resultMap["regionCode"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "regionCode")
        }
      }

      public var addressText: String {
        get {
          return resultMap["addressText"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "addressText")
        }
      }

      public struct ChannelType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ChannelType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelTypeCode", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelTypeCode: String) {
          self.init(unsafeResultMap: ["__typename": "ChannelType", "channelTypeCode": channelTypeCode])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelTypeCode: String {
          get {
            return resultMap["channelTypeCode"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelTypeCode")
          }
        }
      }
    }
  }
}

public final class GetHomeScreenDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetHomeScreenData {
      documentaries: Video(
        where: {VideoType: {videoTypeName: {_eq: "documentary"}}}
        order_by: {datePublished: desc}
        limit: 15
      ) {
        __typename
        id
        Channel {
          __typename
          id
          channelName
        }
        datePublished
        title
        _Video_speakers {
          __typename
          Speaker {
            __typename
            speakerName
          }
        }
        thumbnailUrl
        VideoType {
          __typename
          videoTypeName
        }
      }
      sermons: Video(
        where: {VideoType: {videoTypeName: {_eq: "sermon"}}}
        order_by: {datePublished: desc}
        limit: 15
      ) {
        __typename
        id
        Channel {
          __typename
          id
          channelName
        }
        datePublished
        title
        _Video_speakers {
          __typename
          Speaker {
            __typename
            speakerName
          }
        }
        thumbnailUrl
        VideoType {
          __typename
          videoTypeName
        }
      }
      shorts: Video(
        where: {VideoType: {videoTypeName: {_eq: "short"}}}
        order_by: {datePublished: desc}
        limit: 15
      ) {
        __typename
        id
        Channel {
          __typename
          id
          channelName
        }
        datePublished
        title
        _Video_speakers {
          __typename
          Speaker {
            __typename
            speakerName
          }
        }
        thumbnailUrl
        VideoType {
          __typename
          videoTypeName
        }
      }
      musicVideos: Video(
        where: {VideoType: {videoTypeName: {_eq: "music"}}}
        order_by: {datePublished: desc}
        limit: 15
      ) {
        __typename
        id
        Channel {
          __typename
          id
          channelName
        }
        datePublished
        title
        _Video_speakers {
          __typename
          Speaker {
            __typename
            speakerName
          }
        }
        thumbnailUrl
        VideoType {
          __typename
          videoTypeName
        }
      }
      interviews: Video(
        where: {VideoType: {videoTypeName: {_eq: "interview"}}}
        order_by: {datePublished: desc}
        limit: 15
      ) {
        __typename
        id
        Channel {
          __typename
          id
          channelName
        }
        datePublished
        title
        _Video_speakers {
          __typename
          Speaker {
            __typename
            speakerName
          }
        }
        thumbnailUrl
        VideoType {
          __typename
          videoTypeName
        }
      }
    }
    """

  public let operationName: String = "GetHomeScreenData"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Video", alias: "documentaries", arguments: ["where": ["VideoType": ["videoTypeName": ["_eq": "documentary"]]], "order_by": ["datePublished": "desc"], "limit": 15], type: .nonNull(.list(.nonNull(.object(Documentary.selections))))),
        GraphQLField("Video", alias: "sermons", arguments: ["where": ["VideoType": ["videoTypeName": ["_eq": "sermon"]]], "order_by": ["datePublished": "desc"], "limit": 15], type: .nonNull(.list(.nonNull(.object(Sermon.selections))))),
        GraphQLField("Video", alias: "shorts", arguments: ["where": ["VideoType": ["videoTypeName": ["_eq": "short"]]], "order_by": ["datePublished": "desc"], "limit": 15], type: .nonNull(.list(.nonNull(.object(Short.selections))))),
        GraphQLField("Video", alias: "musicVideos", arguments: ["where": ["VideoType": ["videoTypeName": ["_eq": "music"]]], "order_by": ["datePublished": "desc"], "limit": 15], type: .nonNull(.list(.nonNull(.object(MusicVideo.selections))))),
        GraphQLField("Video", alias: "interviews", arguments: ["where": ["VideoType": ["videoTypeName": ["_eq": "interview"]]], "order_by": ["datePublished": "desc"], "limit": 15], type: .nonNull(.list(.nonNull(.object(Interview.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(documentaries: [Documentary], sermons: [Sermon], shorts: [Short], musicVideos: [MusicVideo], interviews: [Interview]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "documentaries": documentaries.map { (value: Documentary) -> ResultMap in value.resultMap }, "sermons": sermons.map { (value: Sermon) -> ResultMap in value.resultMap }, "shorts": shorts.map { (value: Short) -> ResultMap in value.resultMap }, "musicVideos": musicVideos.map { (value: MusicVideo) -> ResultMap in value.resultMap }, "interviews": interviews.map { (value: Interview) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Video"
    public var documentaries: [Documentary] {
      get {
        return (resultMap["documentaries"] as! [ResultMap]).map { (value: ResultMap) -> Documentary in Documentary(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Documentary) -> ResultMap in value.resultMap }, forKey: "documentaries")
      }
    }

    /// fetch data from the table: "Video"
    public var sermons: [Sermon] {
      get {
        return (resultMap["sermons"] as! [ResultMap]).map { (value: ResultMap) -> Sermon in Sermon(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Sermon) -> ResultMap in value.resultMap }, forKey: "sermons")
      }
    }

    /// fetch data from the table: "Video"
    public var shorts: [Short] {
      get {
        return (resultMap["shorts"] as! [ResultMap]).map { (value: ResultMap) -> Short in Short(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Short) -> ResultMap in value.resultMap }, forKey: "shorts")
      }
    }

    /// fetch data from the table: "Video"
    public var musicVideos: [MusicVideo] {
      get {
        return (resultMap["musicVideos"] as! [ResultMap]).map { (value: ResultMap) -> MusicVideo in MusicVideo(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: MusicVideo) -> ResultMap in value.resultMap }, forKey: "musicVideos")
      }
    }

    /// fetch data from the table: "Video"
    public var interviews: [Interview] {
      get {
        return (resultMap["interviews"] as! [ResultMap]).map { (value: ResultMap) -> Interview in Interview(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Interview) -> ResultMap in value.resultMap }, forKey: "interviews")
      }
    }

    public struct Documentary: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("VideoType", type: .object(VideoType.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, channel: Channel? = nil, datePublished: String, title: String, _videoSpeakers: [_VideoSpeaker], thumbnailUrl: String, videoType: VideoType? = nil) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "datePublished": datePublished, "title": title, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      /// An object relationship
      public var videoType: VideoType? {
        get {
          return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }

      public struct VideoType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VideoType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoTypeName: String) {
          self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoTypeName: String {
          get {
            return resultMap["videoTypeName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "videoTypeName")
          }
        }
      }
    }

    public struct Sermon: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("VideoType", type: .object(VideoType.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, channel: Channel? = nil, datePublished: String, title: String, _videoSpeakers: [_VideoSpeaker], thumbnailUrl: String, videoType: VideoType? = nil) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "datePublished": datePublished, "title": title, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      /// An object relationship
      public var videoType: VideoType? {
        get {
          return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }

      public struct VideoType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VideoType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoTypeName: String) {
          self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoTypeName: String {
          get {
            return resultMap["videoTypeName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "videoTypeName")
          }
        }
      }
    }

    public struct Short: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("VideoType", type: .object(VideoType.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, channel: Channel? = nil, datePublished: String, title: String, _videoSpeakers: [_VideoSpeaker], thumbnailUrl: String, videoType: VideoType? = nil) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "datePublished": datePublished, "title": title, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      /// An object relationship
      public var videoType: VideoType? {
        get {
          return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }

      public struct VideoType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VideoType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoTypeName: String) {
          self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoTypeName: String {
          get {
            return resultMap["videoTypeName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "videoTypeName")
          }
        }
      }
    }

    public struct MusicVideo: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("VideoType", type: .object(VideoType.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, channel: Channel? = nil, datePublished: String, title: String, _videoSpeakers: [_VideoSpeaker], thumbnailUrl: String, videoType: VideoType? = nil) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "datePublished": datePublished, "title": title, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      /// An object relationship
      public var videoType: VideoType? {
        get {
          return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }

      public struct VideoType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VideoType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoTypeName: String) {
          self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoTypeName: String {
          get {
            return resultMap["videoTypeName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "videoTypeName")
          }
        }
      }
    }

    public struct Interview: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("VideoType", type: .object(VideoType.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, channel: Channel? = nil, datePublished: String, title: String, _videoSpeakers: [_VideoSpeaker], thumbnailUrl: String, videoType: VideoType? = nil) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "datePublished": datePublished, "title": title, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      /// An object relationship
      public var videoType: VideoType? {
        get {
          return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }

      public struct VideoType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VideoType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoTypeName: String) {
          self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoTypeName: String {
          get {
            return resultMap["videoTypeName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "videoTypeName")
          }
        }
      }
    }
  }
}

public final class GetVideoDetailDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideoDetailData($videoId: String!, $channelId: String!, $userUuid: String!) {
      videoDetail: Video(where: {id: {_eq: $videoId}}) {
        __typename
        id
        title
        datePublished
        description
        _Video_speakers {
          __typename
          Speaker {
            __typename
            id
            speakerName
          }
        }
        Channel {
          __typename
          id
          channelName
          ChannelType {
            __typename
            channelTypeCode
          }
        }
        Language {
          __typename
          languageCode
          sourceCountryFlag
        }
        thumbnailUrl
        VideoType {
          __typename
          videoTypeName
        }
      }
      moreVideosInChannel: Video(
        where: {channel: {_eq: $channelId}, id: {_neq: $videoId}}
        limit: 10
      ) {
        __typename
        id
        title
        Channel {
          __typename
          id
          channelName
        }
        datePublished
        _Video_speakers {
          __typename
          Speaker {
            __typename
            speakerName
          }
        }
        thumbnailUrl
      }
      _User_likedVideos_aggregate(
        where: {B: {_eq: $videoId}, User: {userUuid: {_eq: $userUuid}}}
      ) {
        __typename
        aggregate {
          __typename
          count
        }
      }
      _User_dislikedVideos_aggregate(
        where: {B: {_eq: $videoId}, User: {userUuid: {_eq: $userUuid}}}
      ) {
        __typename
        aggregate {
          __typename
          count
        }
      }
    }
    """

  public let operationName: String = "GetVideoDetailData"

  public var videoId: String
  public var channelId: String
  public var userUuid: String

  public init(videoId: String, channelId: String, userUuid: String) {
    self.videoId = videoId
    self.channelId = channelId
    self.userUuid = userUuid
  }

  public var variables: GraphQLMap? {
    return ["videoId": videoId, "channelId": channelId, "userUuid": userUuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Video", alias: "videoDetail", arguments: ["where": ["id": ["_eq": GraphQLVariable("videoId")]]], type: .nonNull(.list(.nonNull(.object(VideoDetail.selections))))),
        GraphQLField("Video", alias: "moreVideosInChannel", arguments: ["where": ["channel": ["_eq": GraphQLVariable("channelId")], "id": ["_neq": GraphQLVariable("videoId")]], "limit": 10], type: .nonNull(.list(.nonNull(.object(MoreVideosInChannel.selections))))),
        GraphQLField("_User_likedVideos_aggregate", arguments: ["where": ["B": ["_eq": GraphQLVariable("videoId")], "User": ["userUuid": ["_eq": GraphQLVariable("userUuid")]]]], type: .nonNull(.object(_UserLikedVideosAggregate.selections))),
        GraphQLField("_User_dislikedVideos_aggregate", arguments: ["where": ["B": ["_eq": GraphQLVariable("videoId")], "User": ["userUuid": ["_eq": GraphQLVariable("userUuid")]]]], type: .nonNull(.object(_UserDislikedVideosAggregate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(videoDetail: [VideoDetail], moreVideosInChannel: [MoreVideosInChannel], _userLikedVideosAggregate: _UserLikedVideosAggregate, _userDislikedVideosAggregate: _UserDislikedVideosAggregate) {
      self.init(unsafeResultMap: ["__typename": "query_root", "videoDetail": videoDetail.map { (value: VideoDetail) -> ResultMap in value.resultMap }, "moreVideosInChannel": moreVideosInChannel.map { (value: MoreVideosInChannel) -> ResultMap in value.resultMap }, "_User_likedVideos_aggregate": _userLikedVideosAggregate.resultMap, "_User_dislikedVideos_aggregate": _userDislikedVideosAggregate.resultMap])
    }

    /// fetch data from the table: "Video"
    public var videoDetail: [VideoDetail] {
      get {
        return (resultMap["videoDetail"] as! [ResultMap]).map { (value: ResultMap) -> VideoDetail in VideoDetail(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: VideoDetail) -> ResultMap in value.resultMap }, forKey: "videoDetail")
      }
    }

    /// fetch data from the table: "Video"
    public var moreVideosInChannel: [MoreVideosInChannel] {
      get {
        return (resultMap["moreVideosInChannel"] as! [ResultMap]).map { (value: ResultMap) -> MoreVideosInChannel in MoreVideosInChannel(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: MoreVideosInChannel) -> ResultMap in value.resultMap }, forKey: "moreVideosInChannel")
      }
    }

    /// An aggregate relationship
    public var _userLikedVideosAggregate: _UserLikedVideosAggregate {
      get {
        return _UserLikedVideosAggregate(unsafeResultMap: resultMap["_User_likedVideos_aggregate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "_User_likedVideos_aggregate")
      }
    }

    /// An aggregate relationship
    public var _userDislikedVideosAggregate: _UserDislikedVideosAggregate {
      get {
        return _UserDislikedVideosAggregate(unsafeResultMap: resultMap["_User_dislikedVideos_aggregate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "_User_dislikedVideos_aggregate")
      }
    }

    public struct VideoDetail: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("Language", type: .object(Language.selections)),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("VideoType", type: .object(VideoType.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, title: String, datePublished: String, description: String, _videoSpeakers: [_VideoSpeaker], channel: Channel? = nil, language: Language? = nil, thumbnailUrl: String, videoType: VideoType? = nil) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "title": title, "datePublished": datePublished, "description": description, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "Language": language.flatMap { (value: Language) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      /// An object relationship
      public var language: Language? {
        get {
          return (resultMap["Language"] as? ResultMap).flatMap { Language(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Language")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      /// An object relationship
      public var videoType: VideoType? {
        get {
          return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: String, speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "id": id, "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: String {
            get {
              return resultMap["id"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
            GraphQLField("ChannelType", type: .object(ChannelType.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String, channelType: ChannelType? = nil) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName, "ChannelType": channelType.flatMap { (value: ChannelType) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }

        /// An object relationship
        public var channelType: ChannelType? {
          get {
            return (resultMap["ChannelType"] as? ResultMap).flatMap { ChannelType(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "ChannelType")
          }
        }

        public struct ChannelType: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ChannelType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("channelTypeCode", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(channelTypeCode: String) {
            self.init(unsafeResultMap: ["__typename": "ChannelType", "channelTypeCode": channelTypeCode])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var channelTypeCode: String {
            get {
              return resultMap["channelTypeCode"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "channelTypeCode")
            }
          }
        }
      }

      public struct Language: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Language"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("languageCode", type: .nonNull(.scalar(String.self))),
            GraphQLField("sourceCountryFlag", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(languageCode: String, sourceCountryFlag: String) {
          self.init(unsafeResultMap: ["__typename": "Language", "languageCode": languageCode, "sourceCountryFlag": sourceCountryFlag])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var languageCode: String {
          get {
            return resultMap["languageCode"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "languageCode")
          }
        }

        public var sourceCountryFlag: String {
          get {
            return resultMap["sourceCountryFlag"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "sourceCountryFlag")
          }
        }
      }

      public struct VideoType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VideoType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoTypeName: String) {
          self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoTypeName: String {
          get {
            return resultMap["videoTypeName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "videoTypeName")
          }
        }
      }
    }

    public struct MoreVideosInChannel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, title: String, channel: Channel? = nil, datePublished: String, _videoSpeakers: [_VideoSpeaker], thumbnailUrl: String) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "title": title, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "datePublished": datePublished, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }
    }

    public struct _UserLikedVideosAggregate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["_User_likedVideos_aggregate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("aggregate", type: .object(Aggregate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(aggregate: Aggregate? = nil) {
        self.init(unsafeResultMap: ["__typename": "_User_likedVideos_aggregate", "aggregate": aggregate.flatMap { (value: Aggregate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var aggregate: Aggregate? {
        get {
          return (resultMap["aggregate"] as? ResultMap).flatMap { Aggregate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "aggregate")
        }
      }

      public struct Aggregate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_User_likedVideos_aggregate_fields"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "_User_likedVideos_aggregate_fields", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }
    }

    public struct _UserDislikedVideosAggregate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["_User_dislikedVideos_aggregate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("aggregate", type: .object(Aggregate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(aggregate: Aggregate? = nil) {
        self.init(unsafeResultMap: ["__typename": "_User_dislikedVideos_aggregate", "aggregate": aggregate.flatMap { (value: Aggregate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var aggregate: Aggregate? {
        get {
          return (resultMap["aggregate"] as? ResultMap).flatMap { Aggregate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "aggregate")
        }
      }

      public struct Aggregate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_User_dislikedVideos_aggregate_fields"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "_User_dislikedVideos_aggregate_fields", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}

public final class GetVideosForSearchTextQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideosForSearchText($searchText: String!, $limit: Int!, $offset: Int!) {
      Video(
        where: {_or: [{Channel: {channelName: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}]}
        limit: $limit
        offset: $offset
      ) {
        __typename
        id
        VideoType {
          __typename
          videoTypeName
        }
        title
        Channel {
          __typename
          id
          channelName
        }
        datePublished
        _Video_speakers {
          __typename
          Speaker {
            __typename
            speakerName
          }
        }
        thumbnailUrl
      }
      Video_aggregate(
        where: {_or: [{Channel: {channelName: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}]}
      ) {
        __typename
        aggregate {
          __typename
          count
        }
      }
    }
    """

  public let operationName: String = "GetVideosForSearchText"

  public var searchText: String
  public var limit: Int
  public var offset: Int

  public init(searchText: String, limit: Int, offset: Int) {
    self.searchText = searchText
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["searchText": searchText, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Video", arguments: ["where": ["_or": [["Channel": ["channelName": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]]], "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Video.selections))))),
        GraphQLField("Video_aggregate", arguments: ["where": ["_or": [["Channel": ["channelName": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]]]], type: .nonNull(.object(VideoAggregate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(video: [Video], videoAggregate: VideoAggregate) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Video": video.map { (value: Video) -> ResultMap in value.resultMap }, "Video_aggregate": videoAggregate.resultMap])
    }

    /// fetch data from the table: "Video"
    public var video: [Video] {
      get {
        return (resultMap["Video"] as! [ResultMap]).map { (value: ResultMap) -> Video in Video(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Video) -> ResultMap in value.resultMap }, forKey: "Video")
      }
    }

    /// fetch aggregated fields from the table: "Video"
    public var videoAggregate: VideoAggregate {
      get {
        return VideoAggregate(unsafeResultMap: resultMap["Video_aggregate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "Video_aggregate")
      }
    }

    public struct Video: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("VideoType", type: .object(VideoType.selections)),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, videoType: VideoType? = nil, title: String, channel: Channel? = nil, datePublished: String, _videoSpeakers: [_VideoSpeaker], thumbnailUrl: String) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }, "title": title, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "datePublished": datePublished, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An object relationship
      public var videoType: VideoType? {
        get {
          return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      public struct VideoType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VideoType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoTypeName: String) {
          self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoTypeName: String {
          get {
            return resultMap["videoTypeName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "videoTypeName")
          }
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }
    }

    public struct VideoAggregate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video_aggregate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("aggregate", type: .object(Aggregate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(aggregate: Aggregate? = nil) {
        self.init(unsafeResultMap: ["__typename": "Video_aggregate", "aggregate": aggregate.flatMap { (value: Aggregate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var aggregate: Aggregate? {
        get {
          return (resultMap["aggregate"] as? ResultMap).flatMap { Aggregate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "aggregate")
        }
      }

      public struct Aggregate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Video_aggregate_fields"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "Video_aggregate_fields", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}

public final class GetVideosForSearchTextAndVideoTypeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideosForSearchTextAndVideoType($searchText: String!, $videoType: String!, $limit: Int!, $offset: Int!) {
      Video(
        where: {_or: [{Channel: {channelName: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], VideoType: {videoTypeName: {_eq: $videoType}}}
        limit: $limit
        offset: $offset
      ) {
        __typename
        id
        VideoType {
          __typename
          videoTypeName
        }
        title
        Channel {
          __typename
          id
          channelName
        }
        datePublished
        _Video_speakers {
          __typename
          Speaker {
            __typename
            speakerName
          }
        }
        thumbnailUrl
      }
      Video_aggregate(
        where: {_or: [{Channel: {channelName: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], VideoType: {videoTypeName: {_eq: $videoType}}}
      ) {
        __typename
        aggregate {
          __typename
          count
        }
      }
    }
    """

  public let operationName: String = "GetVideosForSearchTextAndVideoType"

  public var searchText: String
  public var videoType: String
  public var limit: Int
  public var offset: Int

  public init(searchText: String, videoType: String, limit: Int, offset: Int) {
    self.searchText = searchText
    self.videoType = videoType
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["searchText": searchText, "videoType": videoType, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Video", arguments: ["where": ["_or": [["Channel": ["channelName": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "VideoType": ["videoTypeName": ["_eq": GraphQLVariable("videoType")]]], "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Video.selections))))),
        GraphQLField("Video_aggregate", arguments: ["where": ["_or": [["Channel": ["channelName": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "VideoType": ["videoTypeName": ["_eq": GraphQLVariable("videoType")]]]], type: .nonNull(.object(VideoAggregate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(video: [Video], videoAggregate: VideoAggregate) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Video": video.map { (value: Video) -> ResultMap in value.resultMap }, "Video_aggregate": videoAggregate.resultMap])
    }

    /// fetch data from the table: "Video"
    public var video: [Video] {
      get {
        return (resultMap["Video"] as! [ResultMap]).map { (value: ResultMap) -> Video in Video(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Video) -> ResultMap in value.resultMap }, forKey: "Video")
      }
    }

    /// fetch aggregated fields from the table: "Video"
    public var videoAggregate: VideoAggregate {
      get {
        return VideoAggregate(unsafeResultMap: resultMap["Video_aggregate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "Video_aggregate")
      }
    }

    public struct Video: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("VideoType", type: .object(VideoType.selections)),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, videoType: VideoType? = nil, title: String, channel: Channel? = nil, datePublished: String, _videoSpeakers: [_VideoSpeaker], thumbnailUrl: String) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }, "title": title, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "datePublished": datePublished, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An object relationship
      public var videoType: VideoType? {
        get {
          return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      public struct VideoType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VideoType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoTypeName: String) {
          self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoTypeName: String {
          get {
            return resultMap["videoTypeName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "videoTypeName")
          }
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }
    }

    public struct VideoAggregate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video_aggregate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("aggregate", type: .object(Aggregate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(aggregate: Aggregate? = nil) {
        self.init(unsafeResultMap: ["__typename": "Video_aggregate", "aggregate": aggregate.flatMap { (value: Aggregate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var aggregate: Aggregate? {
        get {
          return (resultMap["aggregate"] as? ResultMap).flatMap { Aggregate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "aggregate")
        }
      }

      public struct Aggregate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Video_aggregate_fields"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "Video_aggregate_fields", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}

public final class GetVideosForSearchTextAndLanguageCodeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideosForSearchTextAndLanguageCode($searchText: String!, $languageCode: String!, $limit: Int!, $offset: Int!) {
      Video(
        where: {_or: [{Channel: {channelName: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], Language: {languageCode: {_eq: $languageCode}}}
        limit: $limit
        offset: $offset
      ) {
        __typename
        id
        VideoType {
          __typename
          videoTypeName
        }
        title
        Channel {
          __typename
          id
          channelName
        }
        datePublished
        _Video_speakers {
          __typename
          Speaker {
            __typename
            speakerName
          }
        }
        thumbnailUrl
      }
      Video_aggregate(
        where: {_or: [{Channel: {channelName: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], Language: {languageCode: {_eq: $languageCode}}}
      ) {
        __typename
        aggregate {
          __typename
          count
        }
      }
    }
    """

  public let operationName: String = "GetVideosForSearchTextAndLanguageCode"

  public var searchText: String
  public var languageCode: String
  public var limit: Int
  public var offset: Int

  public init(searchText: String, languageCode: String, limit: Int, offset: Int) {
    self.searchText = searchText
    self.languageCode = languageCode
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["searchText": searchText, "languageCode": languageCode, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Video", arguments: ["where": ["_or": [["Channel": ["channelName": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "Language": ["languageCode": ["_eq": GraphQLVariable("languageCode")]]], "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Video.selections))))),
        GraphQLField("Video_aggregate", arguments: ["where": ["_or": [["Channel": ["channelName": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "Language": ["languageCode": ["_eq": GraphQLVariable("languageCode")]]]], type: .nonNull(.object(VideoAggregate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(video: [Video], videoAggregate: VideoAggregate) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Video": video.map { (value: Video) -> ResultMap in value.resultMap }, "Video_aggregate": videoAggregate.resultMap])
    }

    /// fetch data from the table: "Video"
    public var video: [Video] {
      get {
        return (resultMap["Video"] as! [ResultMap]).map { (value: ResultMap) -> Video in Video(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Video) -> ResultMap in value.resultMap }, forKey: "Video")
      }
    }

    /// fetch aggregated fields from the table: "Video"
    public var videoAggregate: VideoAggregate {
      get {
        return VideoAggregate(unsafeResultMap: resultMap["Video_aggregate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "Video_aggregate")
      }
    }

    public struct Video: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("VideoType", type: .object(VideoType.selections)),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, videoType: VideoType? = nil, title: String, channel: Channel? = nil, datePublished: String, _videoSpeakers: [_VideoSpeaker], thumbnailUrl: String) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }, "title": title, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "datePublished": datePublished, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An object relationship
      public var videoType: VideoType? {
        get {
          return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      public struct VideoType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VideoType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoTypeName: String) {
          self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoTypeName: String {
          get {
            return resultMap["videoTypeName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "videoTypeName")
          }
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }
    }

    public struct VideoAggregate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video_aggregate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("aggregate", type: .object(Aggregate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(aggregate: Aggregate? = nil) {
        self.init(unsafeResultMap: ["__typename": "Video_aggregate", "aggregate": aggregate.flatMap { (value: Aggregate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var aggregate: Aggregate? {
        get {
          return (resultMap["aggregate"] as? ResultMap).flatMap { Aggregate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "aggregate")
        }
      }

      public struct Aggregate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Video_aggregate_fields"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "Video_aggregate_fields", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}

public final class GetVideosForSearchTextVideoTypeAndLanguageCodeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetVideosForSearchTextVideoTypeAndLanguageCode($searchText: String!, $videoType: String!, $languageCode: String!, $limit: Int!, $offset: Int!) {
      Video(
        where: {_or: [{Channel: {channelName: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], Language: {languageCode: {_eq: $languageCode}}, VideoType: {videoTypeName: {_eq: $videoType}}}
        limit: $limit
        offset: $offset
      ) {
        __typename
        id
        VideoType {
          __typename
          videoTypeName
        }
        title
        Channel {
          __typename
          id
          channelName
        }
        datePublished
        _Video_speakers {
          __typename
          Speaker {
            __typename
            speakerName
          }
        }
        thumbnailUrl
      }
      Video_aggregate(
        where: {_or: [{Channel: {channelName: {_ilike: $searchText}}}, {title: {_ilike: $searchText}}], VideoType: {videoTypeName: {_eq: $videoType}}, Language: {languageCode: {_eq: $languageCode}}}
      ) {
        __typename
        aggregate {
          __typename
          count
        }
      }
    }
    """

  public let operationName: String = "GetVideosForSearchTextVideoTypeAndLanguageCode"

  public var searchText: String
  public var videoType: String
  public var languageCode: String
  public var limit: Int
  public var offset: Int

  public init(searchText: String, videoType: String, languageCode: String, limit: Int, offset: Int) {
    self.searchText = searchText
    self.videoType = videoType
    self.languageCode = languageCode
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["searchText": searchText, "videoType": videoType, "languageCode": languageCode, "limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Video", arguments: ["where": ["_or": [["Channel": ["channelName": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "Language": ["languageCode": ["_eq": GraphQLVariable("languageCode")]], "VideoType": ["videoTypeName": ["_eq": GraphQLVariable("videoType")]]], "limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .nonNull(.list(.nonNull(.object(Video.selections))))),
        GraphQLField("Video_aggregate", arguments: ["where": ["_or": [["Channel": ["channelName": ["_ilike": GraphQLVariable("searchText")]]], ["title": ["_ilike": GraphQLVariable("searchText")]]], "VideoType": ["videoTypeName": ["_eq": GraphQLVariable("videoType")]], "Language": ["languageCode": ["_eq": GraphQLVariable("languageCode")]]]], type: .nonNull(.object(VideoAggregate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(video: [Video], videoAggregate: VideoAggregate) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Video": video.map { (value: Video) -> ResultMap in value.resultMap }, "Video_aggregate": videoAggregate.resultMap])
    }

    /// fetch data from the table: "Video"
    public var video: [Video] {
      get {
        return (resultMap["Video"] as! [ResultMap]).map { (value: ResultMap) -> Video in Video(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Video) -> ResultMap in value.resultMap }, forKey: "Video")
      }
    }

    /// fetch aggregated fields from the table: "Video"
    public var videoAggregate: VideoAggregate {
      get {
        return VideoAggregate(unsafeResultMap: resultMap["Video_aggregate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "Video_aggregate")
      }
    }

    public struct Video: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("VideoType", type: .object(VideoType.selections)),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("Channel", type: .object(Channel.selections)),
          GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
          GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, videoType: VideoType? = nil, title: String, channel: Channel? = nil, datePublished: String, _videoSpeakers: [_VideoSpeaker], thumbnailUrl: String) {
        self.init(unsafeResultMap: ["__typename": "Video", "id": id, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }, "title": title, "Channel": channel.flatMap { (value: Channel) -> ResultMap in value.resultMap }, "datePublished": datePublished, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// An object relationship
      public var videoType: VideoType? {
        get {
          return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      /// An object relationship
      public var channel: Channel? {
        get {
          return (resultMap["Channel"] as? ResultMap).flatMap { Channel(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "Channel")
        }
      }

      public var datePublished: String {
        get {
          return resultMap["datePublished"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "datePublished")
        }
      }

      /// An array relationship
      public var _videoSpeakers: [_VideoSpeaker] {
        get {
          return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
        }
      }

      public var thumbnailUrl: String {
        get {
          return resultMap["thumbnailUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "thumbnailUrl")
        }
      }

      public struct VideoType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["VideoType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(videoTypeName: String) {
          self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var videoTypeName: String {
          get {
            return resultMap["videoTypeName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "videoTypeName")
          }
        }
      }

      public struct Channel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Channel"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, channelName: String) {
          self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var channelName: String {
          get {
            return resultMap["channelName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelName")
          }
        }
      }

      public struct _VideoSpeaker: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["_Video_speaker"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(speaker: Speaker) {
          self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// An object relationship
        public var speaker: Speaker {
          get {
            return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
          }
        }

        public struct Speaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speakerName: String) {
            self.init(unsafeResultMap: ["__typename": "Speaker", "speakerName": speakerName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var speakerName: String {
            get {
              return resultMap["speakerName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "speakerName")
            }
          }
        }
      }
    }

    public struct VideoAggregate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Video_aggregate"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("aggregate", type: .object(Aggregate.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(aggregate: Aggregate? = nil) {
        self.init(unsafeResultMap: ["__typename": "Video_aggregate", "aggregate": aggregate.flatMap { (value: Aggregate) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var aggregate: Aggregate? {
        get {
          return (resultMap["aggregate"] as? ResultMap).flatMap { Aggregate(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "aggregate")
        }
      }

      public struct Aggregate: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Video_aggregate_fields"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int) {
          self.init(unsafeResultMap: ["__typename": "Video_aggregate_fields", "count": count])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Int {
          get {
            return resultMap["count"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }
      }
    }
  }
}

public final class GetChannelDetailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetChannelDetail($channelId: String!) {
      Channel(where: {id: {_eq: $channelId}}) {
        __typename
        id
        channelName
        ChannelType {
          __typename
          channelTypeCode
        }
        locationLat
        locationLong
        regionCode
        websiteUrl
        videosInChannel: Videos {
          __typename
          id
          title
          VideoType {
            __typename
            videoTypeName
          }
          _Video_speakers {
            __typename
            Speaker {
              __typename
              id
              speakerName
            }
          }
          Language {
            __typename
            languageCode
            sourceCountryFlag
          }
          thumbnailUrl
          description
          datePublished
        }
      }
    }
    """

  public let operationName: String = "GetChannelDetail"

  public var channelId: String

  public init(channelId: String) {
    self.channelId = channelId
  }

  public var variables: GraphQLMap? {
    return ["channelId": channelId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Channel", arguments: ["where": ["id": ["_eq": GraphQLVariable("channelId")]]], type: .nonNull(.list(.nonNull(.object(Channel.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(channel: [Channel]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Channel": channel.map { (value: Channel) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Channel"
    public var channel: [Channel] {
      get {
        return (resultMap["Channel"] as! [ResultMap]).map { (value: ResultMap) -> Channel in Channel(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Channel) -> ResultMap in value.resultMap }, forKey: "Channel")
      }
    }

    public struct Channel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Channel"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("channelName", type: .nonNull(.scalar(String.self))),
          GraphQLField("ChannelType", type: .object(ChannelType.selections)),
          GraphQLField("locationLat", type: .nonNull(.scalar(String.self))),
          GraphQLField("locationLong", type: .nonNull(.scalar(String.self))),
          GraphQLField("regionCode", type: .nonNull(.scalar(String.self))),
          GraphQLField("websiteUrl", type: .nonNull(.scalar(String.self))),
          GraphQLField("Videos", alias: "videosInChannel", type: .nonNull(.list(.nonNull(.object(VideosInChannel.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, channelName: String, channelType: ChannelType? = nil, locationLat: String, locationLong: String, regionCode: String, websiteUrl: String, videosInChannel: [VideosInChannel]) {
        self.init(unsafeResultMap: ["__typename": "Channel", "id": id, "channelName": channelName, "ChannelType": channelType.flatMap { (value: ChannelType) -> ResultMap in value.resultMap }, "locationLat": locationLat, "locationLong": locationLong, "regionCode": regionCode, "websiteUrl": websiteUrl, "videosInChannel": videosInChannel.map { (value: VideosInChannel) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var channelName: String {
        get {
          return resultMap["channelName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "channelName")
        }
      }

      /// An object relationship
      public var channelType: ChannelType? {
        get {
          return (resultMap["ChannelType"] as? ResultMap).flatMap { ChannelType(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "ChannelType")
        }
      }

      public var locationLat: String {
        get {
          return resultMap["locationLat"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "locationLat")
        }
      }

      public var locationLong: String {
        get {
          return resultMap["locationLong"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "locationLong")
        }
      }

      public var regionCode: String {
        get {
          return resultMap["regionCode"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "regionCode")
        }
      }

      public var websiteUrl: String {
        get {
          return resultMap["websiteUrl"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "websiteUrl")
        }
      }

      /// An array relationship
      public var videosInChannel: [VideosInChannel] {
        get {
          return (resultMap["videosInChannel"] as! [ResultMap]).map { (value: ResultMap) -> VideosInChannel in VideosInChannel(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: VideosInChannel) -> ResultMap in value.resultMap }, forKey: "videosInChannel")
        }
      }

      public struct ChannelType: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ChannelType"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("channelTypeCode", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(channelTypeCode: String) {
          self.init(unsafeResultMap: ["__typename": "ChannelType", "channelTypeCode": channelTypeCode])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var channelTypeCode: String {
          get {
            return resultMap["channelTypeCode"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "channelTypeCode")
          }
        }
      }

      public struct VideosInChannel: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Video"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
            GraphQLField("VideoType", type: .object(VideoType.selections)),
            GraphQLField("_Video_speakers", type: .nonNull(.list(.nonNull(.object(_VideoSpeaker.selections))))),
            GraphQLField("Language", type: .object(Language.selections)),
            GraphQLField("thumbnailUrl", type: .nonNull(.scalar(String.self))),
            GraphQLField("description", type: .nonNull(.scalar(String.self))),
            GraphQLField("datePublished", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, title: String, videoType: VideoType? = nil, _videoSpeakers: [_VideoSpeaker], language: Language? = nil, thumbnailUrl: String, description: String, datePublished: String) {
          self.init(unsafeResultMap: ["__typename": "Video", "id": id, "title": title, "VideoType": videoType.flatMap { (value: VideoType) -> ResultMap in value.resultMap }, "_Video_speakers": _videoSpeakers.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, "Language": language.flatMap { (value: Language) -> ResultMap in value.resultMap }, "thumbnailUrl": thumbnailUrl, "description": description, "datePublished": datePublished])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var title: String {
          get {
            return resultMap["title"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "title")
          }
        }

        /// An object relationship
        public var videoType: VideoType? {
          get {
            return (resultMap["VideoType"] as? ResultMap).flatMap { VideoType(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "VideoType")
          }
        }

        /// An array relationship
        public var _videoSpeakers: [_VideoSpeaker] {
          get {
            return (resultMap["_Video_speakers"] as! [ResultMap]).map { (value: ResultMap) -> _VideoSpeaker in _VideoSpeaker(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: _VideoSpeaker) -> ResultMap in value.resultMap }, forKey: "_Video_speakers")
          }
        }

        /// An object relationship
        public var language: Language? {
          get {
            return (resultMap["Language"] as? ResultMap).flatMap { Language(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "Language")
          }
        }

        public var thumbnailUrl: String {
          get {
            return resultMap["thumbnailUrl"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "thumbnailUrl")
          }
        }

        public var description: String {
          get {
            return resultMap["description"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        public var datePublished: String {
          get {
            return resultMap["datePublished"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "datePublished")
          }
        }

        public struct VideoType: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["VideoType"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("videoTypeName", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(videoTypeName: String) {
            self.init(unsafeResultMap: ["__typename": "VideoType", "videoTypeName": videoTypeName])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var videoTypeName: String {
            get {
              return resultMap["videoTypeName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "videoTypeName")
            }
          }
        }

        public struct _VideoSpeaker: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["_Video_speaker"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("Speaker", type: .nonNull(.object(Speaker.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(speaker: Speaker) {
            self.init(unsafeResultMap: ["__typename": "_Video_speaker", "Speaker": speaker.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// An object relationship
          public var speaker: Speaker {
            get {
              return Speaker(unsafeResultMap: resultMap["Speaker"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "Speaker")
            }
          }

          public struct Speaker: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Speaker"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(String.self))),
                GraphQLField("speakerName", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String, speakerName: String) {
              self.init(unsafeResultMap: ["__typename": "Speaker", "id": id, "speakerName": speakerName])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var speakerName: String {
              get {
                return resultMap["speakerName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "speakerName")
              }
            }
          }
        }

        public struct Language: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Language"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("languageCode", type: .nonNull(.scalar(String.self))),
              GraphQLField("sourceCountryFlag", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(languageCode: String, sourceCountryFlag: String) {
            self.init(unsafeResultMap: ["__typename": "Language", "languageCode": languageCode, "sourceCountryFlag": sourceCountryFlag])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var languageCode: String {
            get {
              return resultMap["languageCode"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "languageCode")
            }
          }

          public var sourceCountryFlag: String {
            get {
              return resultMap["sourceCountryFlag"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "sourceCountryFlag")
            }
          }
        }
      }
    }
  }
}

public final class GetAllLanguagesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAllLanguages {
      Language {
        __typename
        languageCode
        sourceCountryFlag
      }
    }
    """

  public let operationName: String = "GetAllLanguages"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Language", type: .nonNull(.list(.nonNull(.object(Language.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(language: [Language]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "Language": language.map { (value: Language) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "Language"
    public var language: [Language] {
      get {
        return (resultMap["Language"] as! [ResultMap]).map { (value: ResultMap) -> Language in Language(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Language) -> ResultMap in value.resultMap }, forKey: "Language")
      }
    }

    public struct Language: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Language"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("languageCode", type: .nonNull(.scalar(String.self))),
          GraphQLField("sourceCountryFlag", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(languageCode: String, sourceCountryFlag: String) {
        self.init(unsafeResultMap: ["__typename": "Language", "languageCode": languageCode, "sourceCountryFlag": sourceCountryFlag])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var languageCode: String {
        get {
          return resultMap["languageCode"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "languageCode")
        }
      }

      public var sourceCountryFlag: String {
        get {
          return resultMap["sourceCountryFlag"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "sourceCountryFlag")
        }
      }
    }
  }
}

public final class GetUserDataQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserData($userUuid: String!) {
      User(where: {userUuid: {_eq: $userUuid}}) {
        __typename
        id
        userUuid
        userEmail
      }
    }
    """

  public let operationName: String = "GetUserData"

  public var userUuid: String

  public init(userUuid: String) {
    self.userUuid = userUuid
  }

  public var variables: GraphQLMap? {
    return ["userUuid": userUuid]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["query_root"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("User", arguments: ["where": ["userUuid": ["_eq": GraphQLVariable("userUuid")]]], type: .nonNull(.list(.nonNull(.object(User.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(user: [User]) {
      self.init(unsafeResultMap: ["__typename": "query_root", "User": user.map { (value: User) -> ResultMap in value.resultMap }])
    }

    /// fetch data from the table: "User"
    public var user: [User] {
      get {
        return (resultMap["User"] as! [ResultMap]).map { (value: ResultMap) -> User in User(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: User) -> ResultMap in value.resultMap }, forKey: "User")
      }
    }

    public struct User: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["User"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("userUuid", type: .nonNull(.scalar(String.self))),
          GraphQLField("userEmail", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, userUuid: String, userEmail: String) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id, "userUuid": userUuid, "userEmail": userEmail])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var userUuid: String {
        get {
          return resultMap["userUuid"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userUuid")
        }
      }

      public var userEmail: String {
        get {
          return resultMap["userEmail"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "userEmail")
        }
      }
    }
  }
}
