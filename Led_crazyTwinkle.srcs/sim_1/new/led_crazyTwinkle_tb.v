`timescale 1ns/1ns
module led_crazyTwinkle_tb();

    reg Clk;
    reg Rset_n;
    wire [3:0] Led;
    led_crazyTwinkle led_crazyTwinkle_inst(
    .Clk(Clk),
    .Rset_n(Rset_n),
    .Led(Led)
);
defparam led_crazyTwinkle_inst.MCNT0=25000-1;
defparam led_crazyTwinkle_inst.MCNT0=12500-1;
defparam led_crazyTwinkle_inst.MCNT0=6250-1;
defparam led_crazyTwinkle_inst.MCNT0=2500-1;
    initial Clk=1;
    always #10 Clk=~Clk;
    
    initial begin
        Rset_n=0;
        #201;
        Rset_n=1;
        #2000_000_000;
        #2000_000_000;
        $stop;
     end  
endmodule