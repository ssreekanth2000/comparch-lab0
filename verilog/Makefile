ICARUS_OPTIONS := -Wall
IVERILOG := iverilog $(ICARUS_OPTIONS)
SIM := vvp

CIRCUITS := adder.v
TEST := adder

%.vvp: %.t.v $(CIRCUITS)
	$(IVERILOG) -o $@ $<

compile: $(TEST).vvp

run: $(TEST).vvp
	$(SIM) $<

clean:
	-rm -f $(TEST).vvp

.PHONY: compile run clean
