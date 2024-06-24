function varargout = hmstr(varargin)
% HMSTR MATLAB code for hmstr.fig
%      HMSTR, by itself, creates a new HMSTR or raises the existing
%      singleton*.
%
%      H = HMSTR returns the handle to a new HMSTR or the handle to
%      the existing singleton*.
%
%      HMSTR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HMSTR.M with the given input arguments.
%
%      HMSTR('Property','Value',...) creates a new HMSTR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before hmstr_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to hmstr_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help hmstr

% Last Modified by GUIDE v2.5 24-Jun-2024 22:03:20

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @hmstr_OpeningFcn, ...
                   'gui_OutputFcn',  @hmstr_OutputFcn, ...
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


% --- Executes just before hmstr is made visible.
function hmstr_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to hmstr (see VARARGIN)

% Choose default command line output for hmstr
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes hmstr wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = hmstr_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama,path] = uigetfile('*.jpg;*.png;*.jpeg');
img = fullfile(path,nama);
imgreplace = imread(img);
handles.img = imgreplace;
guidata(hObject, handles);
axes(handles.axes1);
imshow(imgreplace);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
awal = handles.bg;
objek = handles.img;

awal_gray = rgb2gray(awal);
objek_gray = rgb2gray(objek);

hasil = double(awal_gray) - double(objek_gray);

hasil_min = min(hasil(:)); %min (min (hasil));
hasil_max = max(hasil(:));

hasil = ((hasil-hasil_min)/(hasil_max-hasil_min))*255;
hasil = uint8(hasil);


hasil = ~im2bw(hasil, graythresh(hasil));

bw = imfill(hasil,'holes');

bw = bwareaopen(bw,900);

[abc banyak] = bwlabel(bw);

H = regionprops(abc,'BoundingBox');
Hbox = cat(1,H.BoundingBox); 
angka = 1:banyak;

baru = insertObjectAnnotation(objek, 'rectangle',Hbox,angka);
data = ['Ada ' num2str(banyak) ' Mobil'];
set(handles.text2,'String',data);
axes(handles.axes2);
imshow(baru);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[nama,path] = uigetfile('*.jpg;*.png;*.jpeg');
img = fullfile(path,nama);
imgbg = imread(img);
handles.bg = imgbg;
guidata(hObject, handles);
axes(handles.axes4);
imshow(imgbg);
