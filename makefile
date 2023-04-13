output: imRun

imRun: im_tb.v taylor.v fetch.v control.v
	iverilog -o imRun im_tb.v taylor.v fetch.v control.v

clean:
	rm -f imRun