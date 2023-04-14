output: imRun

imRun: im_tb.v taylor.v fetch.v registers.v control.v aluControl.v
	iverilog -o imRun im_tb.v taylor.v fetch.v registers.v control.v aluControl.v

clean:
	rm -f imRun