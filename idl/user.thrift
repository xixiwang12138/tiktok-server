namespace go user

struct UserRequest {
    1:required i64 user_id
    2:required string token
}

struct UserResponse {
    1:required i32 status_code
    2:optional string status_msg
    3:required User user
}

struct UserRegisterRequest {
    1:required string username
    2:required string password
}

struct UserRegisterResponse {
    1:required i32 status_code
    2:optional string status_msg
    3:required i64 user_id
    4:required string token
}

struct UserLoginRequest {
    1:required string username
    2:required string password
}

struct UserLoginResponse {
    1:required i32 status_code
    2:optional string status_msg
    3:required i64 user_id
    4:required string token
}

struct UsersMGetRequest {
    1:required i64 user_id            // 执行查询操作的用户 id
    2:required list<i64> user_id_list // 需要查询的用户 id 列表
}

struct UsersMGetResponse {
    1:required i32 status_code
    2:optional string status_msg
    3:required map<i64, User> users
}

struct User {
    1:required i64 id
    2:required string name
    3:required i64 follow_count
    4:required i64 follower_count
    5:required bool is_follow
}

service UserService {
    UserResponse User(1:required UserRequest req)
    UserRegisterResponse RegisterUser(1:required UserRegisterRequest req)
    UserLoginResponse LoginUser(1:required UserLoginRequest req)
    // protect
    UsersMGetResponse MGetUsers(1:required UsersMGetRequest req)
}