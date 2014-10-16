clear all;
close all;

% Set the COM interface
s = serial('COM9');
set(s, 'InputBufferSize', 4096);
%set(s, 'FlowControl', 'hardware');
set(s, 'BaudRate', 115200);
set(s, 'Parity', 'none');
set(s, 'DataBits', 8);
set(s, 'StopBit', 1);
set(s, 'Timeout', 1);

% Check the properties of the COM interface
disp(get(s,'Name'));
prop(1)=(get(s,'BaudRate'));
prop(2)=(get(s,'DataBits'));
prop(3)=(get(s, 'StopBit'));
prop(4)=(get(s, 'InputBufferSize'));
disp(['Port Setup Done!',num2str(prop)]);

%Open the serial port
fopen(s);           

numofchannels = 3;
buffersize = 256;
samplingfrequency = 20000;
% 
fwrite(s, [3 samplingfrequency], 'uint16');
pause(0.1);
% fwrite(s, [2 buffersize], 'uint16');
% pause(0.1);
% fwrite(s, [1 numofchannels], 'uint16');
% pause(0.1);
% fwrite(s, 10, 'uint8');
% pause(10);
% fwrite(s, 13, 'uint8');

fclose(s);

