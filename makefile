output: imRun

imRun: im_tb.v taylor.v fetch.v registers.v control.v aluControl.v alu.v
	iverilog -o imRun im_tb.v taylor.v fetch.v registers.v control.v aluControl.v alu.v

clean:
	rm -f imRun