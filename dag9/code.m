close all, clear all;

proc = IntCodeProcessor;
proc.memory = [3,9,8,9,10,9,4,9,99,-1,8];
proc.input = 7;

proc.run();
proc.output
