module lcd2(input Clock, reset, output reg [6:0] seg, output reg [7:0] Anode 
    );
	 
	 reg [3:0] Cnt,Tens,Ones;
	 reg [27:0] count1;
	 reg [27:0] count2;
	 reg count;
	 reg Clock_out;
	 reg Clock_100;
	
	integer a; 
	
	always @(posedge Clock or posedge reset)
begin
    if(reset) begin
	 
        count1 <= 0;
        Clock_out <= 0;
    end else if (count1 == 27'd50000000) begin 
        count1 <= 0;
        Clock_out <= ~Clock_out;
    end else 
	 begin
        count1 <= count1 + 1'b1;    
    end 
end
always @(posedge Clock or posedge reset)
begin
    if(reset) begin
	 
        count2 <= 0;
        Clock_100 <= 0;
    end else if (count2 == 27'd500000) begin 
        count2 <= 0;
        Clock_100 <= ~Clock_100;
    end else 
	 begin
        count2 <= count2 + 1'b1;    
    end 
end
	
	always @(posedge Clock_out or posedge reset)
	begin
	if(reset)begin
	count <= 1'b0;
	Cnt <= 4'b0000;
	end
	else begin
	Cnt <= Cnt + 1;
	count <= count + 1;
	end
	end	

always @(Cnt)

   begin
	Tens = 4'd0;
	Ones = 4'd0;
	
		for(a=3; a>=0; a=a-1) begin
			if (Tens >= 5)	Tens = Tens +3;
			if(Ones >= 5)	Ones = Ones + 3;
			Tens = Tens<< 1;
			Tens[0]= Ones[3];
			Ones = Ones <<1;
			Ones[0] = Cnt[a];
		end
end
always @(Clock_100)begin	
	if (reset)
	Anode <= 8'b11111111;
	else begin
		  if (Clock_100 == 1'b0)begin
		  Anode <= 8'b11111110;
		  case (Ones) 
            0 : seg = 7'b0000001;
            1 : seg = 7'b1001111;
            2 : seg = 7'b0010010;
            3 : seg = 7'b0000110;
            4 : seg = 7'b1001100;
            5 : seg = 7'b0100100;
            6 : seg = 7'b0100000;
            7 : seg = 7'b0001111;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0000100;
            default : seg = 7'b1111111; 
        endcase
			end
			else begin
			Anode <= 8'b11111101;
		  case (Tens) 
            0 : seg = 7'b0000001;
            1 : seg = 7'b1001111;
            2 : seg = 7'b0010010;
            3 : seg = 7'b0000110;
            4 : seg = 7'b1001100;
            5 : seg = 7'b0100100;
            6 : seg = 7'b0100000;
            7 : seg = 7'b0001111;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0000100;
            default : seg = 7'b1111111; 
        endcase
			end
		end
end
	
endmodule
		
 
    


