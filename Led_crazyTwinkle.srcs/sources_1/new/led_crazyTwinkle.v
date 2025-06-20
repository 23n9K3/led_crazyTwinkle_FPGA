`timescale 1ns / 1ps
//LED0��1,2,3�ֱ���1,2,4,10HZ��˸������ת����ֱ�Ϊ500,250,125,50ms
//��������led_twinkleģ������4�Σ�ÿ���������Ʋ���һ�����ٶ�ÿ��ģ���MCNT���¶���,��һ��ģ�鲻�����¶���
module led_crazyTwinkle(
    Clk,
    Rset_n,
    Led
    );
    input Clk;
    input Rset_n;
    output [3:0]Led;
    //����ע�Ͱ汾��4��ģ����ø��Ĳ���MCNT������ͨ������Ĳ���ͳһ���أ�ʹ�÷���ʵ���е���
//    //����led_twinkleģ��4������
//    led_twinkle led_twinkle_inst0(
//    .Clk(Clk),//�ĸ�ģ���Clk���ӵ�����ģ���Clk
//    .Rset_n(Rset_n),//�ĸ�ģ���Rset_n���ӵ�����ģ���Rset_n
//    .Led(Led[0])//���Ƶ�1���ƣ��Դ�����
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


//���°汾��ͨ������MCNT0,1,2,3������4����ģ��MCNT����,�ڷ���ʱ���������¶���MCNT0,1,2,3ʹ�÷���ʵ���ܿ��
    //    //����led_twinkleģ��4������
    parameter MCNT0=25000000-1;
    parameter MCNT1=12500000-1;
    parameter MCNT2=6250000-1;
    parameter MCNT3=2500000-1;
    led_twinkle led_twinkle_inst0(
    .Clk(Clk),//�ĸ�ģ���Clk���ӵ�����ģ���Clk
    .Rset_n(Rset_n),//�ĸ�ģ���Rset_n���ӵ�����ģ���Rset_n
    .Led(Led[0])//���Ƶ�1���ƣ��Դ�����
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
