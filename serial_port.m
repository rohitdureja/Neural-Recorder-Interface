clear all;
close all;

s = serial('COM9');
set(s, 'InputBufferSize', 2048);
set(s, 'FlowControl', 'hardware');
set(s, 'BaudRate', 115200);
set(s, 'Parity', 'none');
set(s, 'DataBits', 8);
set(s, 'StopBit', 1);
set(s, 'Timeout', 1);

disp(get(s,'Name'));
prop(1)=(get(s,'BaudRate'));
prop(2)=(get(s,'DataBits'));
prop(3)=(get(s, 'StopBit'));
prop(4)=(get(s, 'InputBufferSize'));

disp(['Port Setup Done!!',num2str(prop)]);

fopen(s);           %opens the serial port

signal = fread(s);
hold on
flp = 300;
fhi = 6000;
npts = 2048;
delt = 1/20000;
n = 2;
fnq = 1/(2*delt);
Wn = [flp/fnq fhi/fnq];
[b,a] = butter(n, Wn);
d = filtfilt(b, a, signal);
plot(signal, '-or');
plot(d);
fclose(s); %close the serial port