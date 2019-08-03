%%Mohamed Ahmed Ibrahim Gomaa

clc;
close all;
clear all;

SF = input('Sampling frequency of signal : ');

start = input('Start time : ');
End = input('End time : ');

BP = input('Number of the break points : ');
positions = [];
for i=1:BP
    pos = input(strcat('position_' , int2str(i) , ' : '));
	positions = [positions pos];
end

time = linspace(start , End , (End-start)*SF);
Final_Signal = [];

s = start;
for i=1:BP+1
	if i == BP+1
		e = End;
	else
		e = positions(i);
	end
	n = (e-s)*SF;
	t = linspace(s , e , n);
	signal = [];
	
	%choice = input('ch : ');
	choice = menu('Choose a signal : ' , 'Impulse' , 'DC' , 'Ramp' , 'Exponential' , 'Sinusoidal');
	switch choice
		case 1
			amp = input('Amplitude : ');
            signal = zeros(1,n);
            signal(n/2) = amp;
		case 2
			amp = input('Amplitude : ');
			signal = amp*ones(1,n);
		case 3
			slope = input('slope : ');
			intercept = input('Intercept : ');
			signal = slope*t + intercept;
		case 4
			amp = input('Amplitude : ');
			exponent = input('Exponent : ');
			signal = amp*exp(exponent*t);
		case 5
			amp = input('Amplitude : ');
			f = input('Frequency : ');
			phase = input('Phase : ');
			signal = amp*sin(2*pi*f*t + phase);
    end
	
	Final_Signal = [Final_Signal signal];
	s = e;
end
plot(time , Final_Signal);
