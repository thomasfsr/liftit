const std = @import("std");

const UserRepository = struct {
    save_user : *const fn (ptr: *UserRepository) void,
    find_by_ID : *const fn (ptr: *UserRepository) void
};
