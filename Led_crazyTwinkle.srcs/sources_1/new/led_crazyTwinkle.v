`timescale 1ns / 1ps
//LED0，1,2,3分别以1,2,4,10HZ闪烁，即翻转间隔分别为500,250,125,50ms
//方法：对led_twinkle模块例化4次，每次例化名称不能一样，再对每个模块的MCNT重新定义,第一个模块不用重新定义
module led_crazyTwinkle(
    Clk,
    Rset_n,
    Led
    );
    input Clk;
    input Rset_n;
    output [3:0]Led;
    //以下注释版本是4个模块各用各的参数MCNT，不能通过顶层的参数统一调控，使得仿真实验有点慢
//    //例化led_twinkle模块4次如下
//    led_twinkle led_twinkle_inst0(
//    .Clk(Clk),//四个模块的Clk链接到顶层模块的Clk
//    .Rset_n(Rset_n),//四个模块的Rset_n链接到顶层模块的Rset_n
//    .Led(Led[0])//控制第1个灯，以此类推
//);
//    led_twinkle#(
//        .MCNT(12499999)
//    )
//    led_twinkle_inst1(
//    .Clk(Clk),
//    .Rset_n(Rset_n),
//    .Led(Led[1])
//);
//    led_twinkle#(
//        .MCNT(6249999)
//    ) 
//    led_twinkle_inst2(
//    .Clk(Clk),
//    .Rset_n(Rset_n),
//    .Led(Led[2])
//);
//    led_twinkle led_twinkle_inst3(
//    .Clk(Clk),
//    .Rset_n(Rset_n),
//    .Led(Led[3])
//);
//defparam led_twinkle_inst3.MCNT=2500000-1;


//以下版本是通过顶层MCNT0,1,2,3数调控4个子模块MCNT参数,在仿真时，可以重新定义MCNT0,1,2,3使得仿真实验跑快点
    //    //例化led_twinkle模块4次如下
    parameter MCNT0=25000000-1;
    parameter MCNT1=12500000-1;
    parameter MCNT2=6250000-1;
    parameter MCNT3=2500000-1;
    led_twinkle led_twinkle_inst0(
    .Clk(Clk),//四个模块的Clk链接到顶层模块的Clk
    .Rset_n(Rset_n),//四个模块的Rset_n链接到顶层模块的Rset_n
    .Led(Led[0])//控制第1个灯，以此类推
);
    led_twinkle#(
        .MCNT(MCNT1)
    )
    led_twinkle_inst1(
    .Clk(Clk),
    .Rset_n(Rset_n),
    .Led(Led[1])
);
    led_twinkle#(
        .MCNT(MCNT2)
    ) 
    led_twinkle_inst2(
    .Clk(Clk),
    .Rset_n(Rset_n),
    .Led(Led[2])
);
    led_twinkle led_twinkle_inst3(
    .Clk(Clk),
    .Rset_n(Rset_n),
    .Led(Led[3])
);
defparam led_twinkle_inst3.MCNT=MCNT3;
endmodule
