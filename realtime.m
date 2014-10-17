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

% % Real time plot
% n = 0;
% t = 0;
% % x = linspace(t, t + 0.2, 4096);
% % signal = fread(s, 4096);
% % filt_signal = filter(b, a, signal);
% % set(gcf, 'color', 'white');
% % drawnow;
% % plot(x, filt_signal,'-dk'), axis([t t + 0.2 -150 150]);
% % grid on;
% % title('Sine Wave');
% % xlabel('Time');
% % ylabel('Amplitude');
% % t = t + 0.02;
% while (n < 20)
%     x = linspace(0, 0.2, 4096);
% %     signal_temp = fread(s, 512);
% %     signal = [signal; signal_temp];
% %     signal = signal(end-4096+1:end);
%     signal = fread(s, 4096);
%     filt_signal = filter(b, a, signal);
%     set(gcf, 'color', 'white');
%     drawnow;
%     plot(x, signal,'-dk'), axis([0 0.2 -127 127]);
%     grid on;
%     title('Sine Wave');
%     xlabel('Time');
%     ylabel('Amplitude');
%     n = n + 1;
% %     t = t + 0.02;
%    % t = t + 0.2;
%     pause(0.1);
%     
% end
% % hold on

% Real time plot
n = 0;
while(n < 2)
    signal_0 = [];
    signal_1 = [];
    signal_2 = [];
    signal_3 = [];
    active_sign = [];
    signal = fread(s);
%     signal_1 = signal;
%     signal = fread(s,256);
%     signal_2 = signal;
%     signal = fread(s,256);
%     signal_3 = signasignal
    for i = 1 : 1 : length(signal)
        if(signal(i) == 0)
            active_sign = 0;
            continue;
        end
        if(signal(i)==1)
            active_sign = 1;
            continue;
        end
        if(signal(i)==2)
            active_sign = 2;
            continue;
        end
        if(signal(i)==3)
            active_sign = 3;
            continue;
        end
        if(active_sign==0)
            signal_0 = [signal_0 signal(i)];
        end
        if(active_sign==1)
            signal_1 = [signal_1 signal(i)];
        end
        if(active_sign==2)
            signal_2 = [signal_2 signal(i)];
        end
        if(active_sign==3)
            signal_3 = [signal_3 signal(i)];
        end
    end
    x = linspace(0, 0.2, length(signal_0));
    filt_signal = filter(b, a, signal_0);
    set(gcf, 'color', 'white');
    drawnow;
    plot(x, signal_0,'-dk'), axis([0 0.2 0 300]);
    grid on;
    title('Sine Wave');
    xlabel('Time');
    ylabel('Amplitude');
     n = n + 1;
end


% plot(signal, '-or');
% plot(d); 

% Close the serial port.
 fclose(s); %close the serial port



    
    


    
