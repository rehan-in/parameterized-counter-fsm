module counter_datapath #(
    parameter WIDTH = 8
)(
    input  logic clk,
    input  logic reset,
    input  logic run,
    input  logic direction,   // 1=UP
    input  logic [WIDTH-1:0] max_value,

    output logic [WIDTH-1:0] count
);

always_ff @(posedge clk) begin

    if(reset)
        count <= '0;

    else if(run) begin

        if(direction) begin
            count <= (count == max_value)
                     ? '0
                     : count + 1;
        end
        else begin
            count <= (count == 0)
                     ? max_value
                     : count - 1;
        end
    end
end

endmodule