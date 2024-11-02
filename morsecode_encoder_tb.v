module morsecode_encoder_tb;
    reg w, clk;
    wire z;
    morsecode_encoder uut (
        .z(z),
        .w(w),
        .clk(clk)
    );
    initial begin
        clk = 0;
        forever #10 clk = ~clk; 
    end

    
    initial begin
        
        w = 0;
        #5 w = 0;  

        // Dash '-'
        #20 w = 1;  

        // Dot '.'
        #20 w = 0;  
       
        // Dot '.'
        #20 w = 0; 
    
        // Dot '.'
        #20 w = 0;  
        
        #100; 
		      $finish;
    end

    initial begin
        $monitor("Time = %0d | w = %b | state = %b | z = %b", $time, w, uut.state, z);
    end
endmodule