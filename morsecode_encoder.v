module morsecode_encoder (z,w,clk);
output reg z;
input w,clk;
reg [0:2] state, nextstate;

//for letter B -...
initial 
begin
state=3'b000; nextstate=3'b000;
end
always @(state,w)
begin 
case (state)

3'b000: begin
if (w===1)
nextstate=3'b001;
else if (w===0)
nextstate=3'b000;
z=0;
end

3'b001: begin
if (w===1)
nextstate=3'b001;
else if (w===0)
nextstate=3'b010;
z=0;
end

3'b010: begin
if (w===1)
nextstate=3'b001;
else if (w===0)
nextstate=3'b011;
z=0;
end

3'b011: begin
if (w===1)
nextstate=3'b001;
else if (w===0)
nextstate=3'b100;
z=0;
end

3'b100: begin
if (w===1)
nextstate=3'b001;
else if (w===0)
nextstate=3'b000;
z=1;
end


default:
begin
nextstate = 3'b000;
end
endcase
end

always @(posedge clk)
begin
state <= nextstate;
end
endmodule
