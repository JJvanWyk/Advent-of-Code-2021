const std = @import("std");
const day_1_data = @embedFile("input.txt");
const tokenize = std.mem.tokenize;
const print = std.debug.print;
const parseInt = std.fmt.parseInt;

fn part_1() !void {
    var file_line_iterator = tokenize(day_1_data, "\n");
    var previous_num: usize = 0;
    var current_num: usize = 0;
    var answer: usize = 0;

    while (file_line_iterator.next()) |line| {
        current_num = try parseInt(usize, line, 10);
        if (current_num > previous_num and previous_num != 0) answer += 1;
        previous_num = current_num;
    }
    print("Answer 1: {d}\n", .{answer});
}

fn part_2() !void {
    var file_line_iterator = tokenize(day_1_data, "\n");
    var answer: usize = 0;
    var current_num: usize = 0;
    var first_num: usize = 0;
    var second_num: usize = 0;
    var third_num: usize = 0;
    var fourth_num: usize = 0;
    var iter_count: usize = 1;

    while (file_line_iterator.next()) |line| {
        if (iter_count == 2002) break;
        current_num = try parseInt(usize, line, 10);
        if (iter_count == 1) first_num = current_num;
        if (iter_count == 2) second_num = current_num;
        if (iter_count == 3) third_num = current_num;
        if (iter_count == 4) fourth_num = current_num;
        if ((second_num + third_num + fourth_num) > (first_num + second_num + third_num)) answer += 1;
        if (iter_count > 4) {
            first_num = second_num;
            second_num = third_num;
            third_num = fourth_num;
            fourth_num = current_num;
        }
        iter_count += 1;
    }
    print("Answer 2: {d}\n", .{answer});
}

pub fn main() anyerror!void {
    try part_1();
    try part_2(); // Getting wrong answer. I get one less than real answer.
}
