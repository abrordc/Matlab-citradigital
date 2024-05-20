function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 21-May-2024 00:28:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
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


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
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
%subplot(1,2,1);
%title('Gambar Asli');
%subplot(1,2,2);
%texte = ['Jumlah Wajah: ', num2str(numFaces)];
%disp(['Jumlah wajah yang terdeteksi: ', num2str(numFaces)]);
axes(handles.axes1);
imshow(imgreplace);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
imgreplace = handles.img
faceDetector = vision.CascadeObjectDetector();
bbox = step(faceDetector, imgreplace);
numFaces = size(bbox, 1);
%detectedImg = insertShape(imgreplace, 'Rectangle', bbox, 'LineWidth', 3);
faces = cell(numFaces, 1);
for i = 1:numFaces
    % Crop each face from the image
    faces{i} = imcrop(imgreplace, bbox(i, :));
end
totalWidth = sum(cellfun(@(x) size(x, 2), faces));
maxHeight = max(cellfun(@(x) size(x, 1), faces));
combinedImg = uint8(255 * ones(maxHeight, totalWidth, 3));
currentX = 1;
for i = 1:numFaces
    faceImg = faces{i};
    faceHeight = size(faceImg, 1);
    faceWidth = size(faceImg, 2);
    
    combinedImg(1:faceHeight, currentX:currentX+faceWidth-1, :) = faceImg;
    currentX = currentX + faceWidth;
end
detectedImg = insertShape(imgreplace, 'Rectangle', bbox, 'LineWidth', 3);
axes(handles.axes4);
imshow(detectedImg);

axes(handles.axes5);
imshow(combinedImg)
number =  num2str(numFaces);
set(handles.text2, 'String', ['Jumlah Wajah: ' number]);
