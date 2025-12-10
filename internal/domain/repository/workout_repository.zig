const workout = @import("../entities/workout/workout.zig");
const Workout = workout.WorkoutSet;
pub const WorkoutRepository = struct {
    ptr: *anyopaque,
    vtable: *const VTable,

    pub const VTable = struct {
        findById: *const fn (ptr: *anyopaque, id: u32) ?Workout,
        create: *const fn (ptr: *anyopaque, workout: workout) ?Workout,
        update: *const fn (ptr: *anyopaque, workout: workout) ?Workout,
        delete: *const fn (ptr: *anyopaque, id: u32) void,
    };
};
