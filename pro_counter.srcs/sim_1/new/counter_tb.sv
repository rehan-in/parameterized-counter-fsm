`timescale 1ns/1ps

module counter_tb;

parameter WIDTH = 8;

/////////////////////////////////////////////////
// DUT SIGNALS
/////////////////////////////////////////////////

logic clk;
logic reset;
logic start;
logic stop;
logic enable;
logic sel_mode;
logic [WIDTH-1:0] max_value;
logic [WIDTH-1:0] counting_val;

/////////////////////////////////////////////////
// DUT INSTANTIATION
/////////////////////////////////////////////////

counter_top #(.WIDTH(WIDTH)) dut (
    .clk(clk),
    .reset(reset),
    .start(start),
    .stop(stop),
    .enable(enable),
    .sel_mode(sel_mode),
    .max_value(max_value),
    .counting_val(counting_val)
);

/////////////////////////////////////////////////
// CLOCK GENERATION
/////////////////////////////////////////////////

initial clk = 0;
always #5 clk = ~clk;   // 10ns clock

/////////////////////////////////////////////////
// TASKS
/////////////////////////////////////////////////

// Reset task
task do_reset();
begin
    reset = 1;
    start = 0;
    stop  = 0;
    enable = 0;
    #20;
    reset = 0;
end
endtask


// Start counter
task start_counter();
begin
    enable = 1;
    start  = 1;
    #10;
    start  = 0;   // pulse start (FSM friendly)
end
endtask


// Stop counter
task stop_counter();
begin
    stop = 1;
    #10;
    stop = 0;
end
endtask

/////////////////////////////////////////////////
// MONITOR
/////////////////////////////////////////////////

initial begin
    $display("TIME   COUNT");
    $monitor("%0t    %0d",$time,counting_val);
end

/////////////////////////////////////////////////
// TEST SEQUENCE
/////////////////////////////////////////////////

initial begin

    /////////////////////////////////////////////
    // INITIAL VALUES
    /////////////////////////////////////////////
    max_value = 8'd10;
    sel_mode  = 1;   // UP MODE

    do_reset();

    /////////////////////////////////////////////
    // TEST 1 : UP COUNT
    /////////////////////////////////////////////
    $display("\n--- UP COUNT TEST ---");
    start_counter();

    repeat(15) @(posedge clk);

    /////////////////////////////////////////////
    // TEST 2 : STOP FUNCTION
    /////////////////////////////////////////////
    $display("\n--- STOP TEST ---");
    stop_counter();

    repeat(5) @(posedge clk);

    /////////////////////////////////////////////
    // TEST 3 : RESUME
    /////////////////////////////////////////////
    start_counter();

    repeat(10) @(posedge clk);

    /////////////////////////////////////////////
    // TEST 4 : DOWN COUNT
    /////////////////////////////////////////////
    $display("\n--- DOWN COUNT TEST ---");
    sel_mode = 0;

    repeat(20) @(posedge clk);

    /////////////////////////////////////////////
    // FINISH
    /////////////////////////////////////////////
    $display("TEST COMPLETE");
    #20;
    $finish;
end

endmodule