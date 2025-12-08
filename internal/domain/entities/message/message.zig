const Message = struct {
    ID : ID,
    UserID : ID,
    Role : Role,
    Content : Content,
};

const ID = u32;
const Role =enum{user, assistant}; 
const Content = []u8;
