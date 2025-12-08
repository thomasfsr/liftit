const WorkoutSet = struct {
    ID : ID,
    UserId : ID,
    Exercise : Exercise, 
    Weight : Weight, 
    Reps : Reps, 
};

const ID = u32;
const Exercise = []u8;
const Weight = u16;
const Reps = u8;
