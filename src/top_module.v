module signal_generator #
(
    parameter FFT_SIZE = 2048,
    parameter MODE = 0
)
(
    input wire clk,
    input wire rst,

    output reg [15:0] real_out,
    output reg [15:0] imag_out,

    output reg tvalid,
    output reg tlast
);

integer sample_count;

reg signed [15:0] lut [0:31];

initial begin
    lut[0]=0;
    lut[1]=6392;
    lut[2]=12539;
    lut[3]=18204;
    lut[4]=23170;
    lut[5]=27245;
    lut[6]=30273;
    lut[7]=32137;
    lut[8]=32767;
    lut[9]=32137;
    lut[10]=30273;
    lut[11]=27245;
    lut[12]=23170;
    lut[13]=18204;
    lut[14]=12539;
    lut[15]=6392;
    lut[16]=0;
    lut[17]=-6392;
    lut[18]=-12539;
    lut[19]=-18204;
    lut[20]=-23170;
    lut[21]=-27245;
    lut[22]=-30273;
    lut[23]=-32137;
    lut[24]=-32767;
    lut[25]=-32137;
    lut[26]=-30273;
    lut[27]=-27245;
    lut[28]=-23170;
    lut[29]=-18204;
    lut[30]=-12539;
    lut[31]=-6392;
end

always @(posedge clk)
begin
    if(rst)
    begin
        sample_count <= 0;
        tvalid <= 0;
        tlast <= 0;
        real_out <= 0;
        imag_out <= 0;
    end
    else
    begin
        tvalid <= 1;

        case(MODE)

        // Single tone
        0:
        begin
            real_out <= lut[sample_count % 32];
            imag_out <= 16'd0;
        end

        // Sinc approximation
        1:
        begin
            if(sample_count == 0)
                real_out <= 16'd32767;
            else
                real_out <= 16'd32767 / sample_count;
            imag_out <= 0;
        end

        // Rectangular pulse
        2:
        begin
            if(sample_count < FFT_SIZE/4)
                real_out <= 16'd32767;
            else
                real_out <= 16'd0;
            imag_out <= 0;
        end

        default:
        begin
            real_out <= 0;
            imag_out <= 0;
        end

        endcase

        if(sample_count == FFT_SIZE-1)
        begin
            tlast <= 1;
            sample_count <= 0;
        end
        else
        begin
            tlast <= 0;
            sample_count <= sample_count + 1;
        end
    end
end

endmodule
