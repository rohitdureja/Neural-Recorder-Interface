function varargout = recorder(varargin)
%RECORDER M-file for recorder.fig
%      RECORDER, by itself, creates a new RECORDER or raises the existing
%      singleton*.
%
%      H = RECORDER returns the handle to a new RECORDER or the handle to
%      the existing singleton*.
%
%      RECORDER('Property','Value',...) creates a new RECORDER using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to recorder_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      RECORDER('CALLBACK') and RECORDER('CALLBACK',hObject,...) call the
%      local function named CALLBACK in RECORDER.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help recorder

% Last Modified by GUIDE v2.5 17-Oct-2014 01:09:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @recorder_OpeningFcn, ...
                   'gui_OutputFcn',  @recorder_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before recorder is made visible.
function recorder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for recorder
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

imshow('UPenn_logo.png', 'Parent', handles.axes1);

handles.countChannels = 0; % count of number of channels
handles.selectedChannels = []; % array holding selected channels
guidata(hObject, handles);
set(handles.edit1, 'String', num2str(handles.countChannels));
set(handles.pushbutton3, 'Enable', 'off');
set(handles.pushbutton1, 'Enable', 'off');
set(handles.radiobutton16, 'Value', 1);
set(handles.radiobutton3, 'Value', 1);


global COMsetup
COMsetup = 0;

% UIWAIT makes recorder wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = recorder_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox1 = get(handles.checkbox1, 'Value');
if(checkbox1 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox1, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 0];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=0);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over checkbox1.
function checkbox1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on key press with focus on checkbox1 and none of its controls.
function checkbox1_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)

% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2
checkbox2 = get(handles.checkbox2, 'Value');
if(checkbox2 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox2, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 1];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=1);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox3_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox3 = get(handles.checkbox3, 'Value');
if(checkbox3 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox3, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 2];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=2);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox4_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox4 = get(handles.checkbox4, 'Value');
if(checkbox4 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox4, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 3];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=3);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox5_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox5 = get(handles.checkbox5, 'Value');
if(checkbox5 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox5, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 4];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=4);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox6_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox6 = get(handles.checkbox6, 'Value');
if(checkbox6 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox6, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 5];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=5);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));


% --- Executes on button press in checkbox1.
function checkbox7_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox7 = get(handles.checkbox7, 'Value');
if(checkbox7 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox7, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 6];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=6);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox8_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox8 = get(handles.checkbox8, 'Value');
if(checkbox8 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox8, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 7];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=7);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox9 = get(handles.checkbox9, 'Value');
if(checkbox9 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox9, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 8];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=8);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox10_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox10 = get(handles.checkbox10, 'Value');
if(checkbox10 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox10, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 9];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=9);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox11_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox11 = get(handles.checkbox11, 'Value');
if(checkbox11 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox11, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 10];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=10);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox12_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox12 = get(handles.checkbox12, 'Value');
if(checkbox12 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox12, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 11];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=11);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox13_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox13 = get(handles.checkbox13, 'Value');
if(checkbox13 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox13, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 12];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
                handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=12);

        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox14_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox14 = get(handles.checkbox14, 'Value');
if(checkbox14 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox14, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 13];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=13);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox15_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox15 = get(handles.checkbox15, 'Value');
if(checkbox15 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox15, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 14];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=14);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox16_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox16 = get(handles.checkbox16, 'Value');
if(checkbox16 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox16, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 15];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=15);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox17_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox17 = get(handles.checkbox17, 'Value');
if(checkbox17 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox17, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 16];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=16);
        
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox18_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox18 = get(handles.checkbox18, 'Value');
if(checkbox18 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox18, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 17];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=17);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox19_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox19 = get(handles.checkbox19, 'Value');
if(checkbox19 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox19, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 18];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=18);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox20_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox20 = get(handles.checkbox20, 'Value');
if(checkbox20 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox20, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 19];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=19);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox21_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox21 = get(handles.checkbox21, 'Value');
if(checkbox21 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox21, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 20];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=20);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox22_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox22 = get(handles.checkbox22, 'Value');
if(checkbox22 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox22, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 21];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=21);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox23_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox23 = get(handles.checkbox23, 'Value');
if(checkbox23 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox23, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 22];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=22);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox24_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox24 = get(handles.checkbox24, 'Value');
if(checkbox24 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox24, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 23];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=23);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox1.
function checkbox25_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
checkbox25 = get(handles.checkbox25, 'Value');
if(checkbox25 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox25, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 24];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=24);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox26.
function checkbox26_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox26 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox26
checkbox26 = get(handles.checkbox26, 'Value');
if(checkbox26 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox26, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 25];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=25);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox27.
function checkbox27_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox27
checkbox27 = get(handles.checkbox27, 'Value');
if(checkbox27 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox27, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 26];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=26);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox28.
function checkbox28_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox28 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox28
checkbox28 = get(handles.checkbox28, 'Value');
if(checkbox28 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox28, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 27];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=27);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox29.
function checkbox29_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox29 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox29
checkbox29 = get(handles.checkbox29, 'Value');
if(checkbox29 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox29, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 28];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=28);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox30.
function checkbox30_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox30 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox30
checkbox30 = get(handles.checkbox30, 'Value');
if(checkbox30 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox30, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 29];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=29);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox31.
function checkbox31_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox31 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox31
checkbox31 = get(handles.checkbox31, 'Value');
if(checkbox31 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox31, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 30];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=30);
        guidata(hObject, handles);
    end
end
set(handles.edit1, 'String', num2str(handles.countChannels));

% --- Executes on button press in checkbox32.
function checkbox32_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox32 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox32
checkbox32 = get(handles.checkbox32, 'Value');
if(checkbox32 == 1)
   if(handles.countChannels == 4)
      error = msgbox('Cannot selected more than 4 channels');
      set(handles.checkbox32, 'Value', 0);
   else
       handles.countChannels = handles.countChannels + 1;
       handles.selectedChannels = [handles.selectedChannels 31];
       guidata(hObject, handles);
   end 
else
    if(handles.countChannels > 0)
        handles.countChannels = handles.countChannels - 1;
        handles.selectedChannels = handles.selectedChannels(handles.selectedChannels~=31);
        guidata(hObject, handles);
    end
end

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global start
global syspause
global COMsetup
global s
start = 0;
syspause = 0;
COMsetup = 0;
disp('Recording stopped');

%Stop the recorder
fwrite(s, 13, 'uint8');
pause(0.1);

%Close the COM port
fclose(s);

% Enable reconfiguration
set(handles.edit2, 'Enable', 'On');
set(handles.edit3, 'Enable', 'On');
set(handles.edit4, 'Enable', 'On');
set(handles.edit5, 'Enable', 'On');
set(handles.checkbox1, 'Enable', 'On');
set(handles.checkbox2, 'Enable', 'On');
set(handles.checkbox3, 'Enable', 'On');
set(handles.checkbox4, 'Enable', 'On');
set(handles.checkbox5, 'Enable', 'On');
set(handles.checkbox6, 'Enable', 'On');
set(handles.checkbox7, 'Enable', 'On');
set(handles.checkbox8, 'Enable', 'On');
set(handles.checkbox9, 'Enable', 'On');
set(handles.checkbox10, 'Enable', 'On');
set(handles.checkbox11, 'Enable', 'On');
set(handles.checkbox12, 'Enable', 'On');
set(handles.checkbox13, 'Enable', 'On');
set(handles.checkbox14, 'Enable', 'On');
set(handles.checkbox15, 'Enable', 'On');
set(handles.checkbox16, 'Enable', 'On');
set(handles.checkbox17, 'Enable', 'On');
set(handles.checkbox18, 'Enable', 'On');
set(handles.checkbox19, 'Enable', 'On');
set(handles.checkbox20, 'Enable', 'On');
set(handles.checkbox21, 'Enable', 'On');
set(handles.checkbox22, 'Enable', 'On');
set(handles.checkbox23, 'Enable', 'On');
set(handles.checkbox24, 'Enable', 'On');
set(handles.checkbox25, 'Enable', 'On');
set(handles.checkbox26, 'Enable', 'On');
set(handles.checkbox27, 'Enable', 'On');
set(handles.checkbox28, 'Enable', 'On');
set(handles.checkbox29, 'Enable', 'On');
set(handles.checkbox30, 'Enable', 'On');
set(handles.checkbox31, 'Enable', 'On');
set(handles.checkbox32, 'Enable', 'On');
set(handles.radiobutton16, 'Enable', 'On');
set(handles.radiobutton15, 'Enable', 'On');
set(handles.radiobutton3, 'Enable', 'On');
set(handles.radiobutton4, 'Enable', 'On');


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if(isempty(handles.selectedChannels))
    error = msgbox('No channel(s) selected!');
else
    global COMsetup
    global s
    if(COMsetup == 0) % first time configuration
        disp('Now setting up');
        % get configuration parameters
        handles.selectedChannels = sort(handles.selectedChannels);
        numofchannels = length(handles.selectedChannels)
        samplingfrequency = str2num(get(handles.edit2, 'String'))
        buffersize = str2num(get(handles.edit3, 'String'))
        flp = str2num(get(handles.edit4, 'String'))
        fhp = str2num(get(handles.edit5, 'String'))
        if(get(handles.radiobutton16, 'Value') == 1)
            gainsetting = 1
        else
            gainsetting = 2
        end
        if(get(handles.radiobutton3, 'Value') == 1)
            savetofile = 0
        else
            savetofile = 1
        end
        
        % Disable any changes
        set(handles.edit2, 'Enable', 'Off');
        set(handles.edit3, 'Enable', 'Off');
        set(handles.edit4, 'Enable', 'Off');
        set(handles.edit5, 'Enable', 'Off');
        set(handles.checkbox1, 'Enable', 'Off');
        set(handles.checkbox2, 'Enable', 'Off');
        set(handles.checkbox3, 'Enable', 'Off');
        set(handles.checkbox4, 'Enable', 'Off');
        set(handles.checkbox5, 'Enable', 'Off');
        set(handles.checkbox6, 'Enable', 'Off');
        set(handles.checkbox7, 'Enable', 'Off');
        set(handles.checkbox8, 'Enable', 'Off');
        set(handles.checkbox9, 'Enable', 'Off');
        set(handles.checkbox10, 'Enable', 'Off');
        set(handles.checkbox11, 'Enable', 'Off');
        set(handles.checkbox12, 'Enable', 'Off');
        set(handles.checkbox13, 'Enable', 'Off');
        set(handles.checkbox14, 'Enable', 'Off');
        set(handles.checkbox15, 'Enable', 'Off');
        set(handles.checkbox16, 'Enable', 'Off');
        set(handles.checkbox17, 'Enable', 'Off');
        set(handles.checkbox18, 'Enable', 'Off');
        set(handles.checkbox19, 'Enable', 'Off');
        set(handles.checkbox20, 'Enable', 'Off');
        set(handles.checkbox21, 'Enable', 'Off');
        set(handles.checkbox22, 'Enable', 'Off');
        set(handles.checkbox23, 'Enable', 'Off');
        set(handles.checkbox24, 'Enable', 'Off');
        set(handles.checkbox25, 'Enable', 'Off');
        set(handles.checkbox26, 'Enable', 'Off');
        set(handles.checkbox27, 'Enable', 'Off');
        set(handles.checkbox28, 'Enable', 'Off');
        set(handles.checkbox29, 'Enable', 'Off');
        set(handles.checkbox30, 'Enable', 'Off');
        set(handles.checkbox31, 'Enable', 'Off');
        set(handles.checkbox32, 'Enable', 'Off');
        set(handles.radiobutton16, 'Enable', 'Off');
        set(handles.radiobutton15, 'Enable', 'Off');
        set(handles.radiobutton3, 'Enable', 'Off');
        set(handles.radiobutton4, 'Enable', 'Off');
        
        % set display properties
        for i=1:numofchannels
            if(i==1)
               set(handles.text8, 'String', strcat('Channel-',num2str(handles.selectedChannels(i)+1)));
            end
            if(i==2)
               set(handles.text9, 'String', strcat('Channel-',num2str(handles.selectedChannels(i)+1))); 
            end
            if(i==3)
                set(handles.text10, 'String', strcat('Channel-',num2str(handles.selectedChannels(i)+1)));
            end
            if(i==4)
                set(handles.text11, 'String', strcat('Channel-',num2str(handles.selectedChannels(i)+1)));
            end
        end
        
        %set up COM port
        s = serial('COM9');
        set(s, 'InputBufferSize', 8192);
        set(s, 'BaudRate', 115200);
        set(s, 'Parity', 'none');
        set(s, 'DataBits', 8);
        set(s, 'StopBit', 1);
        set(s, 'Timeout', 1);
        
        % Design the filter, 4th order butterworth
        delt = 1/samplingfrequency;
        n = 4;
        fnq = 1/(2*delt);
        Wn = [flp/fnq fhp/fnq];
        [b,a] = butter(n, Wn);
        
        % Create directory and files for storage
        if(savetofile == 1)
            foldername = now;
            foldername = datestr(foldername, 'mm-dd-yy HH.MM.SS.PM');
            mkdir('data',  foldername); % make new folder
            null = [];
            % make binary files for storing data
            for i=1:numofchannels
                filename = strcat('Channel_', num2str(handles.selectedChannels(i)),'.data');
                filepath = fullfile('data',foldername,filename);
                if(i==1)
                    file_0 = fopen(filepath, 'wb');
                end
                if(i==2)
                    file_1 = fopen(filepath, 'wb');
                end
                if(i==3)
                    file_2 = fopen(filepath, 'wb');
                end
                if(i==4)
                    file_3 = fopen(filepath, 'wb');
                end
            end
        end
        
        fopen(s); % Open the COM port
       
        %Transmit configuration parameters
        fwrite(s, [3 samplingfrequency], 'uint16');
        pause(0.1);
        fwrite(s, [2 buffersize], 'uint16');
        pause(0.1);
        fwrite(s, [1 numofchannels handles.selectedChannels], 'uint16');
        pause(0.1);
        fwrite(s, [4 gainsetting],'uint16');
        pause(0.1);
        fwrite(s, 10, 'uint8');
        pause(1);
        
        %Serial port setup complete
        COMsetup = 1;
    end
    
    % recording enabled
    global start
    global syspause
    start = 1;
    syspause = 0;
    % enable stopping and pausing
    set(handles.pushbutton1, 'Enable', 'On');
	set(handles.pushbutton3, 'Enable', 'On');
    set(handles.pushbutton2, 'Enable', 'Off');
    % main control loop
    while(start == 1)
        % Check is Pause is pressed
        while(syspause == 1)
           %disp('System paused');
           pause(0.1);
        end
        % Main recording loop
        signal_0 = [];
	    signal_1 = [];
        signal_2 = [];
        signal_3 = [];
        active_sign = [];
        signal = fread(s);
        % parse signal;
        for i = 1 : 1 : length(signal)
            if(numofchannels >= 1)
                if(signal(i) == handles.selectedChannels(1))
                    active_sign = handles.selectedChannels(1);
                    continue;
                end
            end
            if(numofchannels >= 2)
                if(signal(i)==handles.selectedChannels(2))
                    active_sign = handles.selectedChannels(2);
                    continue;
                end
            end
            if(numofchannels >= 3)
                if(signal(i)==handles.selectedChannels(3))
                    active_sign = handles.selectedChannels(3);
                    continue;
                end
            end
            if(numofchannels >=4)
                if(signal(i)==handles.selectedChannels(4))
                    active_sign = handles.selectedChannels(4);
                    continue;
                end
            end
            if(numofchannels >= 1)
                if(active_sign == handles.selectedChannels(1))
                    signal_0 = [signal_0 signal(i)];
                end
            end
            if(numofchannels >= 2)
                if(active_sign == handles.selectedChannels(2))
                    signal_1 = [signal_1 signal(i)];
                end
            end
            if(numofchannels >= 3)
                if(active_sign == handles.selectedChannels(3))
                    signal_2 = [signal_2 signal(i)];
                end
            end
            if(numofchannels >= 4)
                if(active_sign == handles.selectedChannels(4))
                    signal_3 = [signal_3 signal(i)];
                end
            end
        end
        if(numofchannels >= 1)
            axes(handles.axes2);
            x = linspace(0, 0.4, length(signal_0));
            if(savetofile == 1)
                fwrite(file_0, signal_0, 'uint8');
            end
            signal_0 = filtfilt(b, a, signal_0);
            if(gainsetting == 1)
                plot(x, (signal_0.*13)./1000,'-'), axis([0 0.4 -2 2]), grid on, xlabel('seconds'), ylabel('mV');
            else
                plot(x, (signal_0.*790)./1000,'-'), axis([0 0.4 -200 200]), grid on, xlabel('seconds'), ylabel('uV');
            end
        end
        if(numofchannels >= 2)
            axes(handles.axes3);
            x = linspace(0, 0.2, length(signal_1));
            if(savetofile == 1)
                fwrite(file_1, signal_0, 'uint8');
            end
            signal_1 = filtfilt(b, a, signal_1);
            plot(x, signal_1/1000,'-'), axis([0 0.1 -15 1.6]);
            plot(x, signal_1,'-'), axis([0 0.1 -150 150]);
        end
        if(numofchannels >= 3)
            axes(handles.axes4);
            x = linspace(0, 0.2, length(signal_2));
            if(sabetofile == 1)
                fwrite(file_2, signal_0, 'uint8');
            end
            signal_2 = filtfilt(b, a, signal_2);
            plot(x, signal_2,'-'), axis([0 0.1 -150 150]);
        end
        if(numofchannels >= 4)
            axes(handles.axes5);
            x = linspace(0, 0.2, length(signal_3));
            if(savetofile == 1)
                fwrite(file_3, signal_0, 'uint8');
            end
            signal_3 = filtfilt(b, a, signal_3);
            plot(x, signal_3,'-'), axis([0 0.1 -150 150]);
        end
    end
    
    if(savetofile == 1)
        if(numofchannels >= 1)
            fclose(file_0);
        end
        if(numofchannels >= 2)
            fclose(file_1);
        end    
        if(numofchannels >= 3)
            fclose(file_2);
        end
        if(numofchannels >= 4)
            fclose(file_3);
        end    
    end  
    
    set(handles.pushbutton1, 'Enable', 'Off');
	set(handles.pushbutton3, 'Enable', 'Off');
    set(handles.pushbutton2, 'Enable', 'On');

end
  


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global syspause
syspause = 1;
set(handles.pushbutton2, 'Enable', 'On');
set(handles.pushbutton3, 'Enable', 'Off');



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1


% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton2



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --------------------------------------------------------------------
function uipanel2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object deletion, before destroying properties.
function uipanel2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function uipanel3_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton2.
function pushbutton2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a = 5;


% --- Executes on key press with focus on pushbutton2 and none of its controls.
function pushbutton2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)
disp('wefsdf');


% --- Executes when selected object is changed in uipanel15.
function uipanel15_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel15 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)


% --- Executes when selected object is changed in uipanel16.
function uipanel16_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uipanel16 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)

