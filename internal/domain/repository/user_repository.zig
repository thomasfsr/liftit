pub const UserRepository = struct {
    ptr: *anyopaque,
    vtable: *const VTable,

    pub const VTable = struct {
        findById: *const fn (ptr: *anyopaque, id: i64) anyerror!?User,
        create: *const fn (ptr: *anyopaque, user: User) anyerror!User,
        update: *const fn (ptr: *anyopaque, user: User) anyerror!User,
        delete: *const fn (ptr: *anyopaque, id: i64) anyerror!void,
    };
};
