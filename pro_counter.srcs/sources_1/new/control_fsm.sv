module control_fsm(
    input  logic clk,
    input  logic reset,
    input  logic start,
    input  logic stop,
    input  logic enable,

    output logic run
);

typedef enum logic [1:0] {
    IDLE,
    RUN,
    STOP
} state_t;

state_t state, next_state;


// State register
always_ff @(posedge clk) begin
    if(reset)
        state <= IDLE;
    else
        state <= next_state;
end


// Next state logic
always_comb begin
    next_state = state;

    case(state)

        IDLE:
            if(enable && start)
                next_state = RUN;

        RUN:
            if(stop)
                next_state = STOP;

        STOP:
            if(start)
                next_state = RUN;

    endcase
end


// Output logic
assign run = (state == RUN);

endmodule