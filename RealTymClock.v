module RealTymClock( input clk, rst,
			output [6:0]Sec_L, Sec_M, Min_L, Min_M, Hour_L, Hour_M);

		wire [3:0]Count_Sec_L, Count_Sec_M, Count_Min_L, Count_Min_M, Count_Hour_L, Count_Hour_M ;

	// For Seconds L 
	Universal_counter #(9) Counter_Sec_L(.clk(clk), .rst(rst), .en(1'b1), .Count(Count_Sec_L));
			seg7  Seg_Sec_L(.data_in(Count_Sec_L), .display_out(Sec_L));

	wire Sec_M_en;
	assign Sec_M_en = (Count_Sec_L==4'b1001);
	
	// For Seconds M 
	Universal_counter #(5) Counter_Sec_M(.clk(clk), .rst(rst), .en(Sec_M_en), .Count(Count_Sec_M));
			seg7  Seg_Sec_M(.data_in(Count_Sec_M), .display_out(Sec_M));

	wire Min_L_en;
	assign Min_L_en= (Count_Sec_M==4'b0101) && (Count_Sec_L==4'b1001);

	// For Minutes L
	Universal_counter #(9) Counter_Min_L(.clk(clk), .rst(rst), .en(Min_L_en), .Count(Count_Min_L));
			seg7  Seg_Min_L(.data_in(Count_Min_L), .display_out(Min_L));
	
	wire Min_M_en;
	assign Min_M_en = (Count_Min_L==4'b1001) && (Min_L_en);

	// For Minutes M
	Universal_counter #(5) Counter_Min_M(.clk(clk), .rst(rst), .en(Min_M_en), .Count(Count_Min_M));
			seg7  Seg_Min_M(.data_in(Count_Min_M), .display_out(Min_M));

	wire Hour_L_en;
	assign Hour_L_en = (Count_Min_M==4'b0101) && (Min_M_en);

	// For Hours L
	wire clr;
	assign clr=(Count_Hour_M == 4'b0010) && (Count_Hour_L==4'b0011)&&(Count_Min_M==4'b0101) && (Min_M_en);

	Universal_counter #(9) Counter_Hour_L(.clk(clk), .rst(rst),.clr(clr), .en(Hour_L_en), .Count(Count_Hour_L));
			seg7  Seg_Hour_L(.data_in(Count_Hour_L), .display_out(Hour_L));

	wire Hour_M_en;
	assign Hour_M_en = (Count_Hour_L == 4'b1001) && (Hour_L_en);	

	// For Hours M 
	Universal_counter #(2) Counter_Hour_M(.clk(clk), .rst(rst), .en(Hour_M_en), .Count(Count_Hour_M));
			seg7  Seg_Hour_M(.data_in(Count_Hour_M), .display_out(Hour_M));

endmodule 













module	RealTymClock_tb();
		reg clk, rst, en, Sec_M_en, Min_L_en, Min_M_en, Hour_L_en, Hour_M_en; 
		wire [6:0]Sec_L, Sec_M, Min_L, Min_M, Hour_L, Hour_M;
	
	RealTymClock RTC_Sec_L (.clk(clk), .rst(rst), .en(1'b1),    	     .Sec_L(Sec_L));
	RealTymClock RTC_Sec_M (.clk(clk), .rst(rst), .Sec_M_en(Sec_M_en),   .Sec_M(Sec_M));
	RealTymClock RTC_Min_L (.clk(clk), .rst(rst), .Min_L_en(Min_L_en),   .Min_L(Min_L));
	RealTymClock RTC_Min_M (.clk(clk), .rst(rst), .Min_M_en(Min_M_en),   .Min_M(Min_M));
	RealTymClock RTC_Hour_L(.clk(clk), .rst(rst), .Hour_L_en(Hour_L_en), .Hour_L(Hour_L));
	RealTymClock RTC_Hour_M(.clk(clk), .rst(rst), .Hour_M_en(Hour_M_en), .Hour_M(Hour_M));

	initial begin 
		clk=0;
	forever #5 clk= ~clk;
	end

	initial begin 
	rst=0;		#10;
	rst=1;	
	end
endmodule
	
	
	




