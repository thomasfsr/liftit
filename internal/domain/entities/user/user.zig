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
    fn get_value(self: @This()) []const u8 {
        return self.firstname;
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
    fn get_value(self: @This()) []const u8 {
        return self.lastname;
    }
};

const PhoneNumber = struct {
    phonenumber : u64,
    fn init(phonenumber: u64) @This() {
        return .{.phonenumber = phonenumber};
    }
    fn update(self : @This(), new_phonenumber: u64) void {
        self.phonenumber = new_phonenumber;
    }
    fn get_value(self: @This()) u64 {
        return self.phonenumber;
    }
};
