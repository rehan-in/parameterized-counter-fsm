module counter_top #(
    parameter WIDTH = 8
)(
    input  logic clk,
    input  logic reset,
    input  logic start,
    input  logic stop,
    input  logic enable,
    input  logic sel_mode,
    input  logic [WIDTH-1:0] max_value,

    output logic [WIDTH-1:0] counting_val
);

logic run;


// CONTROL
control_fsm u_ctrl (
    .clk(clk),
    .reset(reset),
    .start(start),
    .stop(stop),
    .enable(enable),
    .run(run)
);


// DATAPATH
counter_datapath #(.WIDTH(WIDTH)) u_data (
    .clk(clk),
    .reset(reset),
    .run(run),
    .direction(sel_mode),
    .max_value(max_value),
    .count(counting_val)
);

endmodule