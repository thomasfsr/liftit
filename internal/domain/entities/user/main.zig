const std = @import("std");

const User = struct {
    ID : u32,
    FirstName : FirstName,
    LastName : LastName,
    PhoneNumber : PhoneNumber,
    IsActivate : bool
};

const NameError = error {
    EmptyName,
    NameTooLong,
    InvalidNameFormat,
};

const FirstName = struct {
    firstname: []const u8,
    fn init(firstname: []const u8) !@This() {
        try validate(firstname);
        return .{.firstname = firstname};
    }
    fn update(self: *@This(), new_name : []const u8) !void {
        try validate(new_name);
        self.firstname = new_name;
    }
    fn validate(firstname: []const u8) !void {
        if (firstname.len == 0) {
            return NameError.EmptyName;
        }
        if (firstname.len > 20) {
            return NameError.NameTooLong;
        }
    }
};
const LastName = struct {
    lastname: []const u8,
    fn init(lastname: []const u8) !@This() {
        try validate(lastname);
        return .{.lastname = lastname};
    }
    fn update(self: *@This(), new_name : []const u8) !void {
        try validate(new_name);
        self.lastname = new_name;
    }
    fn validate(lastname: []const u8) !void {
        if (lastname.len == 0) {
            return NameError.EmptyName;
        }
        if (lastname.len > 20) {
            return NameError.NameTooLong;
        }
    }
};

const PhoneNumber = u64;

const Activate = bool;


pub fn main() !void {
    const fname = try FirstName.init("Thomas");
    const lname = try LastName.init("Freire");

    const myuser = User{
        .ID = 1,
        .FirstName = fname,
        .LastName = lname,
        .PhoneNumber = 5513982272630,
        .IsActivate = true,
    };

    std.debug.print("{any}\n", .{myuser});
}

