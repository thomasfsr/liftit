const user = @import("../entities/user/user.zig");
const User = user.User;
pub const UserRepository = struct {
    ptr: *anyopaque,
    vtable: *const VTable,

    pub const VTable = struct {
        findById: *const fn (ptr: *anyopaque, id: i64) ?User,
        create: *const fn (ptr: *anyopaque, user: User) ?User,
        update: *const fn (ptr: *anyopaque, user: User) ?User,
        delete: *const fn (ptr: *anyopaque, id: i64) anyerror!void,
    };
};
