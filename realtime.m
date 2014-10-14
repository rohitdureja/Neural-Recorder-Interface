clear all;
close all;

% Set the COM interface
s = serial('COM9');
set(s, 'InputBufferSize', 4096);
set(s, 'FlowControl', 'hardware');
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

% Design the filter
flp = 300;
fhi = 6000;
npts = 2048;
delt = 1/20000;
n = 2;
fnq = 1/(2*delt);
Wn = [flp/fnq fhi/fnq];
[b,a] = butter(n, Wn);

% Real time plot
n = 0;
t = 0;
% x = linspace(t, t + 0.2, 4096);
% signal = fread(s, 4096);
% filt_signal = filter(b, a, signal);
% set(gcf, 'color', 'white');
% drawnow;
% plot(x, filt_signal,'-dk'), axis([t t + 0.2 -150 150]);
% grid on;
% title('Sine Wave');
% xlabel('Time');
% ylabel('Amplitude');
% t = t + 0.02;
while (n < 200)
    x = linspace(0, 0.2, 4096);
%     signal_temp = fread(s, 512);
%     signal = [signal; signal_temp];
%     signal = signal(end-4096+1:end);
    signal = fread(s, 4096);
    filt_signal = filter(b, a, signal);
    set(gcf, 'color', 'white');
    drawnow;
    plot(x, filt_signal,'-dk');%, axis([0 0.2 -127 127]);
    grid on;
    title('Sine Wave');
    xlabel('Time');
    ylabel('Amplitude');
    n = n + 1;
%     t = t + 0.02;
   % t = t + 0.2;
    pause(0.1);
    
end
% hold on


% plot(signal, '-or');
% plot(d); 

% Close the serial port.
fclose(s); %close the serial port