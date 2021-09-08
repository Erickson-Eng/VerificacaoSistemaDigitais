module contador8bitsUpDown(
    input clock,
    input reset,
    input key,
    input load,
    input bit[7:0] entrada,
    output bit[7:0] count
);
always @(negedge clock ) begin
    if (load && reset) begin
        count <= entrada;
    end
end

always @(posedge clock or negedge reset) begin
    if (!reset) begin
        count <= 8'b00000000;
    end else begin
        if (!load) begin
            if (key) begin
                count <= count + 1;
            end else begin
                count <= count - 1;
            end
        end
    end
end
endmodule