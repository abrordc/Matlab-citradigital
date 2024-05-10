function varargout = pixelab(varargin)
% PIXELAB MATLAB code for pixelab.fig
%      PIXELAB, by itself, creates a new PIXELAB or raises the existing
%      singleton*.
%
%      H = PIXELAB returns the handle to a new PIXELAB or the handle to
%      the existing singleton*.
%
%      PIXELAB('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PIXELAB.M with the given input arguments.
%
%      PIXELAB('Property','Value',...) creates a new PIXELAB or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before pixelab_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to pixelab_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help pixelab

% Last Modified by GUIDE v2.5 10-May-2024 21:57:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pixelab_OpeningFcn, ...
                   'gui_OutputFcn',  @pixelab_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
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


% --- Executes just before pixelab is made visible.
function pixelab_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to pixelab (see VARARGIN)

% Choose default command line output for pixelab
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes pixelab wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = pixelab_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slide_Callback(hObject, eventdata, handles)
% hObject    handle to slide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


hasil = get(hObject,'Value');
imgoverite = handles.img;
imgkuk = imgoverite + hasil;
axes(handles.showImg);
imshow(imgkuk)




% --- Executes during object creation, after setting all properties.
function slide_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in imgpush.
function imgpush_Callback(hObject, eventdata, handles)
% hObject    handle to imgpush (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[nama,path] = uigetfile('*.jpg;*.png;*.jpeg');
img = fullfile(path,nama);
imgreplace = imread(img);
handles.img = imgreplace;
guidata(hObject, handles);

axes(handles.showImg);
imshow(imgreplace)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in gray.
function gray_Callback(hObject, eventdata, handles)
% hObject    handle to gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of gray
