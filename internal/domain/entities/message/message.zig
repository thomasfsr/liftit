const Message = struct {
    ID : u32,
    UserID : u32,
    Role : enum{user, assistant},
    Content : Content,
    tokens : u32
};

const Content = struct {
    content : []const u8,
    fn init(content: []const u8) @This() {
        return .{.content = content};
    }
    fn update(self: @This(), new_content: []const u8) void {
        self.content = new_content;
    }
    fn get_value(self: @This()) []const u8 {
        return self.content;
    }
};

