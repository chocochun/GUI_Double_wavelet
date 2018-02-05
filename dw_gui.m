
% cd ~/'Box Sync'/gui/MATLAB

function varargout = dw_gui(varargin)
% DW_GUI MATLAB code for dw_gui.fig
%      DW_GUI, by itself, creates a new DW_GUI or raises the existing
%      singleton*.
%
%      H = DW_GUI returns the handle to a new DW_GUI or the handle to
%      the existing singleton*.
%
%      DW_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DW_GUI.M with the given input arguments.
%
%      DW_GUI('Property','Value',...) creates a new DW_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dw_gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dw_gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dw_gui

% Last Modified by GUIDE v2.5 08-May-2017 16:30:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dw_gui_OpeningFcn, ...
                   'gui_OutputFcn',  @dw_gui_OutputFcn, ...
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


% --- Executes just before dw_gui is made visible.
function dw_gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dw_gui (see VARARGIN)

%addpath '/Users/minchunzhou/Box Sync/gui/MATLAB/code/';

%path = pwd
%addpath ([path,'/code'])

% Choose default command line output for dw_gui
handles.output = hObject;
handles.SpatialWavelet='db3';
handles.TemporalWavelet = 'sym8';

% Update handles structure
guidata(hObject, handles);
axes(handles.axes1)
matlabImage = imread('vumc.jpg');
image(matlabImage)
axis off
axis image



% UIWAIT makes dw_gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = dw_gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject,'String');
val = get(hObject,'Value');
handles.TemporalWavelet = str{val};
guidata(hObject, handles)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str = get(hObject,'String');
val = get(hObject,'Value');
handles.SpatialWavelet =  str{val};
guidata(hObject, handles)


% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
% select data
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.nii;*.nii.gz','NIFTI Files (*.nii, *.nii.gz)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'on');
fullpathname = strcat(filename);
set(handles.text3, 'String',fullpathname);
filename = cellstr(filename);
handles.datafilename = filename;
handles.datafilepath = pathname;
handles.filterindex = filterindex;

set(handles.edit8, 'String', strtok(filename(1),'.') );
handles.IDname = strtok(filename(1),'.') ;

guidata(hObject, handles)




% --- Executes on button press in pushbutton3.
% stimulus
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.csv','CSV Files (*.csv)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'on');
fullpathname = strcat(filename);
set(handles.text30, 'String',fullpathname);
filename = cellstr(filename);
handles.stimulusfilename = filename;
handles.stimulusfilepath = pathname;
guidata(hObject, handles)



% --- Executes on button press in radiobutton2.
function radiobutton2_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)




% Hint: get(hObject,'Value') returns toggle state of radiobutton2


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hint: get(hObject,'Value') returns toggle state of radiobutton3



% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CenterX=str2num(get(hObject, 'string'));
handles.centerX = CenterX;
guidata(hObject, handles)



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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
CenterY=str2num(get(hObject, 'string'));
handles.centerY = CenterY;
guidata(hObject, handles)


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
CenterZ=str2num(get(hObject, 'string'));
handles.centerZ = CenterZ;
guidata(hObject, handles)



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



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SizeX=str2num(get(hObject, 'string'));
handles.SizeX = SizeX;
guidata(hObject, handles)


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


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SizeY=str2num(get(hObject, 'string'));
handles.SizeY = SizeY;
guidata(hObject, handles)


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



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SizeZ=str2num(get(hObject, 'string'));
handles.SizeZ = SizeZ;
guidata(hObject, handles)


% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end




% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)







% --- Executes on button press in pushbutton12.
function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton14.
function pushbutton14_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.nii;*.nii.gz','NIFTI Files (*.nii, *.nii.gz)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'off');
handles.maskfilename = filename;
handles.maskpathname = pathname;
set(handles.edit12, 'String', strtok(filename,'.') );
handles.ROIname = strtok(filename,'.') ;
guidata(hObject, handles)

set(handles.text26, 'String',filename);

% --- Executes on button press in pushbutton15.
function pushbutton15_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



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



function edit8_Callback(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
IDname=get(hObject, 'string');
handles.IDname = IDname;
guidata(hObject, handles)



% Hints: get(hObject,'String') returns contents of edit8 as text
%        str2double(get(hObject,'String')) returns contents of edit8 as a double


% --- Executes during object creation, after setting all properties.
function edit8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
LengthNeeded=str2num(get(hObject, 'string'));
handles.LengthNeeded = LengthNeeded;
guidata(hObject, handles)



% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end





function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit12_Callback(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ROIname=get(hObject, 'string');
handles.ROIname = ROIname;
guidata(hObject, handles)


% Hints: get(hObject,'String') returns contents of edit12 as text
%        str2double(get(hObject,'String')) returns contents of edit12 as a double


% --- Executes during object creation, after setting all properties.
function edit12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton9.
function radiobutton9_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BinaryMask = get(hObject,'Value');


% Hint: get(hObject,'Value') returns toggle state of radiobutton9



function edit15_Callback(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
TR = get(hObject,'String');
handles.TR = TR; 
guidata(hObject, handles)
% Hints: get(hObject,'String') returns contents of edit15 as text
%        str2double(get(hObject,'String')) returns contents of edit15 as a double


% --- Executes during object creation, after setting all properties.
function edit15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure wi14th handles and user data (see GUIDATA)

str = get(hObject,'String');
val = get(hObject,'Value');
handles.aalnumber = str{val};

guidata(hObject, handles)



% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes during object creation, after setting all properties.
function radiobutton3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% --- Executes during object creation, after setting all properties.
function uibuttongroup2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function uibuttongroup2_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function pushbutton13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



%%%%%%%%%%%%%%%%%%%% Main function to do analysis
% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 
% test here


%%% get ROI mask
selected = get(handles.uibuttongroup2, 'SelectedObject' );
roitype = get(selected, 'String'); 

if strcmp(roitype,'AAL')
    aalfile = load_nii('AAL.nii');
    aalimg = aalfile.img;
    aalnumber = str2num(handles.aalnumber)
    roimask = (aalimg == aalnumber);
    roicord = findn(roimask);
    sizeroi = size(roimask);
    
    numvox = size(roicord);
    meancor1 = [round(mean(roicord(:,1))) round(mean(roicord(:,2))) round(mean(roicord(:,3)))];
    
    rangeX = max(roicord(:,1)) - min(roicord(:,1));
    rangeY = max(roicord(:,2)) - min(roicord(:,2));
    rangeZ = max(roicord(:,3)) - min(roicord(:,3));

    portation = numvox(1)/ (rangeX*rangeY*rangeZ);
    
    roisizeX = ceil(rangeX*portation);
    roisizeY = ceil(rangeY*portation);
    roisizeZ = ceil(rangeZ*portation);

    newtemp = zeros(roisizeX*roisizeY*roisizeZ, 3);
    count = 1;
    for i= 1: roisizeX
        for j = 1: roisizeY
            for k = 1: roisizeZ
                newtemp(count,:) = meancor1 + [ i j k ];
                count= count+1;
            end
        end
    end
    
    finalroicord = newtemp;
    
elseif strcmp(roitype,'Binary Mask')
    maskname = strcat(handles.maskpathname,handles.maskfilename);
    maskfile = load_nii(maskname);
    %maskfile= load_nii('example_data/binary_mask/con2_clust84_bin.nii');
    roimask = maskfile.img;
    roicord = findn(roimask);
    sizeroi = size(roimask);
    
    numvox = size(roicord);
    meancor1 = [round(mean(roicord(:,1))) round(mean(roicord(:,2))) round(mean(roicord(:,3)))];
    
    rangeX = max(roicord(:,1)) - min(roicord(:,1));
    rangeY = max(roicord(:,2)) - min(roicord(:,2));
    rangeZ = max(roicord(:,3)) - min(roicord(:,3));

    portation = numvox(1)/ (rangeX*rangeY*rangeZ);
    
    roisizeX = ceil(rangeX*portation);
    roisizeY = ceil(rangeY*portation);
    roisizeZ = ceil(rangeZ*portation);

    newtemp = zeros(roisizeX*roisizeY*roisizeZ, 3);
    count = 1;
    for i= 1: roisizeX
        for j = 1: roisizeY
            for k = 1: roisizeZ
                newtemp(count,:) = meancor1 + [ i j k ];
                count= count+1;
            end
        end
    end
    
    finalroicord = newtemp;

end

%%% Load data and Extract ROI

num_run = length(handles.datafilename);

allboxdata = cell(num_run,1 );
% read data get ROI
for i = 1:num_run
    dataname = strcat(handles.datafilepath,handles.datafilename(i));

    disp(sprintf('Loading Data %d', i ))    
    datafile = load_nii(char(dataname));
    %datafile = load_nii('example_data/106/106_1.nii')
    data = datafile.img;
    data = data(:,:,:,1:handles.LengthNeeded);
    sizedata = size(data);
    sizedata3d = sizedata(1:3);

 if strcmp(roitype,'Coordinator')
        roicord = zeros(handles.SizeX * handles.SizeY * handles.SizeZ, 3);
        count = 1;
        ROIcenter = [handles.centerX handles.centerY handles.centerZ];
        
        Xrange = (1:handles.SizeX) - round(handles.SizeX/2) + handles.centerX;
        Yrange = (1:handles.SizeY) - round(handles.SizeY/2) + handles.centerY;
        Zrange = (1:handles.SizeZ) - round(handles.SizeZ/2) + handles.centerZ;
        
        for ii = Xrange
            for j = Yrange
                for k = Zrange
                    roicord(count,:) = [ ii j k ];
                    count= count+1;
                end
            end
        end
        
        finalroicord = roicord;
        roisizeX = handles.SizeX;
        roisizeY = handles.SizeY;
        roisizeZ = handles.SizeZ;
 end
    
    disp(sprintf('Extracting ROI from Data %d', i ))    
    
    Scord = size(finalroicord);
    boxdata = zeros(roisizeX,roisizeY,roisizeZ, sizedata(4));
    
    count=0;
    for sizeX = 1:roisizeX
        for sizeY = 1:roisizeY
            for sizeZ = 1:roisizeZ
                count= count+1;
                newcord = finalroicord(count,:);
                boxdata(sizeX,sizeY,sizeZ,:)= ...
                    data(newcord(1),newcord(2),newcord(3),:);
            end
        end
    end

    allboxdata{i} = boxdata;
    
end

%%%%%%%% wavelet inniation

    Sdata = size(boxdata);
    dim = Sdata(1:3);

    % wavelet parameters
    wavePname = handles.SpatialWavelet;
    waveTname = handles.TemporalWavelet;
    N.level = 1;
    T = Sdata(4);

    WT = wavedec3(ones(dim(1), dim(2),dim(3)), N.level ,wavePname);
    sWT = size(WT.dec{1});
    coefband = prod(sWT);
    N.wavecoef = prod(sWT); 

    usecoefband = 1:coefband;
    [TC,TS] = wavedec(zeros(1,T),1,waveTname);
     Ntime = length(TC);
    waveband = 1:(Ntime/2) ;

    waveT = zeros(N.wavecoef, Ntime);

    wavedata =  zeros(num_run, coefband, Ntime);
    
    
%%% Load Stimulus

num_stimulusfile = length(handles.stimulusfilename);
TR=str2num(handles.TR);
hrf = spm_hrf(TR);

wave_stimulus = zeros(Ntime/2,num_stimulusfile);
allstimulus = cell(num_stimulusfile,1 );

for i = 1:num_stimulusfile
    
    disp(sprintf('Loading Stimulus %d', i ))    

    stimulusname = strcat(handles.stimulusfilepath,handles.stimulusfilename(i));
    stimulus = csvread(char(stimulusname));
    stimulus = stimulus(1:handles.LengthNeeded,:);
    Sstimulus = size(stimulus);
    stimulus_num = Sstimulus(2);
    
    for j = 1: stimulus_num
        onset = stimulus(:,j);
        s1 = conv(onset, hrf); 
        s1 = s1(1:handles.LengthNeeded);
        [stan1,TS1] = wavedec(s1,1,waveTname);
        wave_stimulus(:,j) = stan1(waveband);
    end
    
    allstimulus{i} = wave_stimulus;
    
end

%%% Perform Analysis

First_inv_temp = zeros(stimulus_num);
Second_part = zeros(stimulus_num,1);

for i = 1:num_stimulusfile
    
    disp(sprintf('Transforming Data %d', i ))    

    data = allboxdata{i};
    
    disp(sprintf('Spatial Transforming Data %d', i ))    

    for t = 1:T
        subjbrain = reshape(data(:,:,:,t), dim(1), dim(2),dim(3));    
        WT_temp = wavedec3(subjbrain, N.level ,wavePname);    
        waveC(t,:) = reshape(WT_temp.dec{1},coefband,1 );
    end
    
    disp(sprintf('Temporal Transforming Data %d', i ))    

    for coef = 1:N.wavecoef
        subjT = reshape(waveC(:,coef),1,T);    
        [waveT(coef, :),TS] = wavedec(subjT,1,waveTname);
    end 
    
    disp(sprintf('Analyzing Data %d', i ))    

    dsize = size(waveT);
    
    waveX = allstimulus{i};

    wavedata_use = waveT;
    wavedata_use = wavedata_use(usecoefband,waveband);
            
    wavedata_use1 = mean(wavedata_use,1 );%/coefband /8*  prod(dim) ;
    
    size(First_inv_temp)
    First_inv_temp = First_inv_temp+  waveX'*waveX
    Second_part= waveX'*wavedata_use1'+ Second_part          
      
end

allinv = inv(First_inv_temp);

beta_hat_glm = allinv*Second_part;
        
handles.estimate = beta_hat_glm;
guidata(hObject, handles)

disp('Finish')


set(handles.text24, 'String', beta_hat_glm);



% --- Executes on button press in pushbutton13. 
% create and save result
function pushbutton13_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

[file,path] = uiputfile('*.csv','Save Estimate As');

numStu = length(handles.estimate);


result = cell( 2 , 4+numStu);

result{1,1} = 'SubjectID';
result{2,1} = char(handles.IDname);

result{1,2} = 'ROIname';
result{2,2} = char(handles.ROIname);

result{1,3} = 'SpatialWavelet';
result{2,3} = char(handles.SpatialWavelet);

result{1,4} = 'TemporalWavelet';
result{2,4} = char(handles.TemporalWavelet);


for i =1:numStu
    result{1,4+i} = sprintf('Stimulus%d',i);
    result{2,4+i} = handles.estimate(i);
end


cell2csv(strcat(path,file),result);

disp(['Save result to',strcat(path,file)])


% --- Executes on button press in pushbutton11.
% save to exist file
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.csv','CSV Files (*.csv)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'on');

resultname = strcat(pathname,filename);
result = readtable(char(resultname));

resultcell = table2cell(result);
Sresult= size(resultcell);

newresult = cell(1, Sresult(2) );
newresult{1} = char(handles.IDname);
newresult{2} = char(handles.ROIname);
newresult{3} = char(handles.SpatialWavelet);
newresult{4} = char(handles.TemporalWavelet);
for i =1:(Sresult(2) - 4 )
    newresult{1,4+i} = handles.estimate(i);
end

resultcell = [result.Properties.VariableNames;resultcell; newresult];
cell2csv(strcat(pathname,filename),resultcell);
disp(['Save result to',strcat(pathname,filename)])



% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% multiple read
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname, filterindex] = uigetfile( ...
{  '*.csv','CSV Files (*.csv)'; ...
   '*.*',  'All Files (*.*)'}, ...
   'Pick a file', ...
   'MultiSelect', 'on');
fullpathname = strcat(filename);
set(handles.text18, 'String',fullpathname);

resultname = strcat(pathname,filename);
result = readtable(char(resultname));
resultcell = table2cell(result);
resultcell = [result.Properties.VariableNames;resultcell];

handles.multiresult = result;

handles.selectstimulus1 = 1;
handles.selectstimulus2 = 1;
guidata(hObject, handles)

set(handles.popupmenu4, 'String', result.Properties.VariableNames(5:end) );
set(handles.popupmenu5, 'String', result.Properties.VariableNames(5:end) );

set(handles.uitable2, 'Data',resultcell);



% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

resultcell = table2cell(handles.multiresult);

ROIall = unique(resultcell(:,2));

finalresult = cell(1+ length(ROIall) , 3 );
finalresult{1,1} = 'ROI';
finalresult{1,2} = 'T-stat';
finalresult{1,3} = 'p-val';

for i = 1:length(ROIall)
    
    finalresult{1+i,1} = char(ROIall(i));
    
    
    subresult = resultcell( cellfun(@(x) ~isempty(strfind(x,finalresult{1+i,1})),resultcell(:,2)) ,:);

    
    [rows1 cols1] = size(handles.selectstimulus1);
    [rows2 cols2] = size(handles.selectstimulus1);
    
    if cols1 > 1
        stimulus1 = mean(cell2mat(subresult(:, 4+ handles.selectstimulus1)),1);
    else
        stimulus1 = cell2mat(subresult(:, 4+ handles.selectstimulus1));
    end
    
    if cols2 > 1
        stimulus2 = mean(cell2mat(subresult(:, 4+ handles.selectstimulus2)),1);
    else
        stimulus2 = cell2mat(subresult(:, 4+ handles.selectstimulus2));
    end
    
    contrast = stimulus1 - stimulus2;
    
    meancontrast = mean(contrast);
    secontrast = std(contrast)/sqrt(length(contrast));
    finalresult{1+i,2} =  meancontrast/secontrast;
    finalresult{1+i,3}=2*(1-normcdf(abs(finalresult{1+i,2}),0,1));
    
    
end

set(handles.uitable3, 'Data',finalresult);
handles.finalresult = finalresult;
guidata(hObject, handles)



% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(hObject,'Value');
handles.selectstimulus1 = val;
guidata(hObject, handles)



% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val = get(hObject,'Value');
handles.selectstimulus2 = val;
guidata(hObject, handles)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5


% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton16.
function pushbutton16_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


[file,path] = uiputfile('*.csv','Save Estimate As');

cell2csv(strcat(path,file),handles.finalresult);

disp(['Saved multiple subject result to',strcat(path,file)])



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
