VERILOG = iverilog
TARGET = test.vcd
$(TARGET) : simple.vvp
	vvp simple.vvp
simple.vvp: decoder_3_8_tb.v decoder_3_8.v
	$(VERILOG) -o simple.vvp decoder_3_8_tb.v decoder_3_8.v
clean:
	rm $(TARGET)
