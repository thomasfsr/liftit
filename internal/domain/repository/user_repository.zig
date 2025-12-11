const user_entity = @import("../entities/user/user.zig");
const User = user_entity.User;
pub const UserRepository = struct {
    ptr: *anyopaque,
    vtable: *const VTable,

    pub const VTable = struct {
        findById: *const fn (ptr: *anyopaque, id: u32) ?User,
        create: *const fn (ptr: *anyopaque, user: User) ?User,
        update: *const fn (ptr: *anyopaque, user: User) ?User,
        delete: *const fn (ptr: *anyopaque, id: u32) anyerror!void,
    };

    pub fn findById(self: @This(), id: u32) ?User {
        return self.vtable.findById(self.ptr, id);
    }

    pub fn create(self: @This(), user: User) !User {
        return self.vtable.create(self.ptr, user);
    }

    pub fn update(self: @This(), user: User) !User {
        return self.vtable.update(self.ptr, user);
    }

    pub fn delete(self: @This(), id: u32) !void {
        return self.vtable.delete(self.ptr, id);
    }
};
