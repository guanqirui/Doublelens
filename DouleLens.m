function varargout = DouleLens(varargin)
% DOULELENS MATLAB code for DouleLens.fig
%      DOULELENS, by itself, creates a new DOULELENS or raises the existing
%      singleton*.
%
%      H = DOULELENS returns the handle to a new DOULELENS or the handle to
%      the existing singleton*.
%
%      DOULELENS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DOULELENS.M with the given input arguments.
%
%      DOULELENS('Property','Value',...) creates a new DOULELENS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DouleLens_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DouleLens_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DouleLens

% Last Modified by GUIDE v2.5 03-Apr-2019 11:17:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DouleLens_OpeningFcn, ...
                   'gui_OutputFcn',  @DouleLens_OutputFcn, ...
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


% --- Executes just before DouleLens is made visible.
function DouleLens_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DouleLens (see VARARGIN)

% Choose default command line output for DouleLens
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DouleLens wait for user response (see UIRESUME)
% uiwait(handles.figure_DoubleLens);
setappdata(handles.figure_DoubleLens,'img_data',0); %% ���øý����Ӧ�ó������ݳ�ʼֵ
setappdata(handles.figure_DoubleLens,'Lens_f1i',200); %% ���øý����Ӧ�ó������ݳ�ʼֵ
setappdata(handles.figure_DoubleLens,'Lens_f2i',-100); %% ���øý����Ӧ�ó������ݳ�ʼֵ
setappdata(handles.figure_DoubleLens,'Lens_d',20); %% ��øý����Ӧ�ó������ݳ�ʼֵ
setappdata(handles.figure_DoubleLens,'Lens_dmin',0); %% ���øý����Ӧ�ó������ݳ�ʼֵ
setappdata(handles.figure_DoubleLens,'Lens_dmax',300); %% ��øý����Ӧ�ó������ݳ�ʼֵ
set(handles.edit_f1i, 'String',num2str(200));
set(handles.edit_f2i, 'String',num2str(-100));
set(handles.edit_d, 'String',num2str(20));
set(handles.edit_dmin, 'String',num2str(0));
set(handles.edit_dmax, 'String',num2str(300));
set(handles.slider_val, 'Value',0);
set(handles.slider_val, 'Min',0);
set(handles.slider_val, 'Max',300);
set(handles.txt_d0_val, 'String',num2str(0));

% set(handles.m_file_save,'Enable','off');    %% ����������֮ǰ���رղ˵��е����ݱ��湦��
% set(handles.m_calc,'Enable','off');     %% ����������֮ǰ���رղ˵��еļ��㹦��
% set(handles.m_disp,'Enable','off');     %% �ڼ���֮ǰ���رղ˵��е���ʾ����
% set(handles.tbl_save,'Enable','off');   %% ����ʾ֮ǰ���رղ˵��е�ͼ�񱣴湦��
setappdata(handles.figure_DoubleLens,'bSave',false);   %% ��ʼ״̬����
setappdata(handles.figure_DoubleLens,'bChanged',false);
setappdata(handles.figure_DoubleLens,'fstSave',true);
setappdata(handles.figure_DoubleLens,'fstPath',0);


% --- Outputs from this function are returned to the command line.
function varargout = DouleLens_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

%%%%%%%%%%%%%
%% �˵�
%%%%%%%%%%%%%

% --------------------------------------------------------------------
function m_file_Callback(hObject, eventdata, handles)
% hObject    handle to m_file (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_calc_Callback(hObject, eventdata, handles)
% hObject    handle to m_calc (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function m_file_open_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_open (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.txt','Data Files (*.txt)'},...
    'Pick an data file');
if isequal(filename,0) || isequal(pathname,0)
    return;
end
fpath = [pathname filename];
[A,delimiterOut,headerlinesOut] = importdata(fpath,',',1);
setappdata(handles.figure_DoubleLens,'Lens_form',A.colheaders); %% ���øý����Ӧ�ó������ݳ�ʼֵ
setappdata(handles.figure_DoubleLens,'Lens_f1i',A.data(1)); %% ���øý����Ӧ�ó������ݳ�ʼֵ
setappdata(handles.figure_DoubleLens,'Lens_f2i',A.data(2)); %% ���øý����Ӧ�ó������ݳ�ʼֵ
setappdata(handles.figure_DoubleLens,'Lens_d',A.data(3)); %% ���øý����Ӧ�ó������ݳ�ʼֵ
setappdata(handles.figure_DoubleLens,'Lens_dmin',A.data(4)); %% ���øý����Ӧ�ó������ݳ�ʼֵ
setappdata(handles.figure_DoubleLens,'Lens_dmax',A.data(5)); %% ���øý����Ӧ�ó������ݳ�ʼֵ
set(handles.edit_f1i, 'String',num2str(A.data(1)));
set(handles.edit_f2i, 'String',num2str(A.data(2)));
set(handles.edit_d, 'String',num2str(A.data(3)));
set(handles.edit_dmin, 'String',num2str(A.data(4)));
set(handles.edit_dmax, 'String',num2str(A.data(5)));
set(handles.txt_d0_val, 'String',num2str(A.data(4)));
set(handles.slider_val, 'Value',A.data(4));
set(handles.slider_val, 'Min',A.data(4));
set(handles.slider_val, 'Max',A.data(5));


% --------------------------------------------------------------------
function m_file_save_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uiputfile({'*.txt'},'Pick a Lens Data file');
if isequal(filename,0) || isequal(pathname,0)
    return;
else
    fpath = fullfile(pathname, filename);
end
lensForm = getappdata(handles.figure_DoubleLens,'Lens_form'); %% ��ȡ�ý����Ӧ�ó������ݣ�����ý����Դͼ��
lensData1 = getappdata(handles.figure_DoubleLens,'Lens_f1i'); %% ��ȡ�ý����Ӧ�ó������ݣ�����ý����Դͼ��
lensData2 = getappdata(handles.figure_DoubleLens,'Lens_f2i'); %% ��ȡ�ý����Ӧ�ó������ݣ�����ý����Դͼ��
lensData3 = getappdata(handles.figure_DoubleLens,'Lens_d'); %% ��ȡ�ý����Ӧ�ó������ݣ�����ý����Դͼ��
lensData4 = getappdata(handles.figure_DoubleLens,'Lens_dmin'); %% ��ȡ�ý����Ӧ�ó������ݣ�����ý����Դͼ��
lensData5 = getappdata(handles.figure_DoubleLens,'Lens_dmax'); %% ��ȡ�ý����Ӧ�ó������ݣ�����ý����Դͼ��
fid=fopen(fpath,'wt');
fprintf(fid,'f1i,f2i,d,dmin,dmax\n');
fprintf(fid,'%d,%d,%d,%d,%d',lensData1,lensData2,lensData3,lensData4,lensData5);
fprintf(fid,'\n'); 
fclose(fid);


% --------------------------------------------------------------------
function m_file_exit_Callback(hObject, eventdata, handles)
% hObject    handle to m_file_exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function m_calc_single_Callback(hObject, eventdata, handles)
% hObject    handle to m_calc_single (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
feval(@pb_args_Callback,handles.pb_args,eventdata,handles);


% --------------------------------------------------------------------
function m_calc_shift_Callback(hObject, eventdata, handles)
% hObject    handle to m_calc_shift (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1i = getappdata(handles.figure_DoubleLens,'Lens_f1i');
f2i = getappdata(handles.figure_DoubleLens,'Lens_f2i');
% d = getappdata(handles.figure_DoubleLens,'Lens_d');
dmin = getappdata(handles.figure_DoubleLens,'Lens_dmin');
dmax = getappdata(handles.figure_DoubleLens,'Lens_dmax');
di = 1;
axes(handles.axes_shift); % �趨��ǰ������������
Shift_multiLens(f1i,f2i,dmin,di,dmax);


%%%%%%%%%%%%%
%% �ؼ�
%%%%%%%%%%%%%
function edit_f1i_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f1i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f1i as text
%        str2double(get(hObject,'String')) returns contents of edit_f1i as a double
f1i = str2num(get(hObject,'String'));
setappdata(handles.figure_DoubleLens,'Lens_f1i',f1i); %% ���øý����Ӧ�ó������ݳ�ʼֵ


% --- Executes during object creation, after setting all properties.
function edit_f1i_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f1i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_f2i_Callback(hObject, eventdata, handles)
% hObject    handle to edit_f2i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_f2i as text
%        str2double(get(hObject,'String')) returns contents of edit_f2i as a double
f2i = str2num(get(hObject,'String'));
setappdata(handles.figure_DoubleLens,'Lens_f2i',f2i); %% ���øý����Ӧ�ó������ݳ�ʼֵ


% --- Executes during object creation, after setting all properties.
function edit_f2i_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_f2i (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function edit_d_Callback(hObject, eventdata, handles)
% hObject    handle to edit_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_d as text
%        str2double(get(hObject,'String')) returns contents of edit_d as a double
d = str2num(get(hObject,'String'));
setappdata(handles.figure_DoubleLens,'Lens_d',d); %% ���øý����Ӧ�ó������ݳ�ʼֵ


% --- Executes during object creation, after setting all properties.
function edit_d_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_d (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_dmin_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dmin as text
%        str2double(get(hObject,'String')) returns contents of edit_dmin as a double
dmin = str2num(get(hObject,'String'));
setappdata(handles.figure_DoubleLens,'Lens_dmin',dmin); %% ���øý����Ӧ�ó������ݳ�ʼֵ
set(handles.slider_val, 'Value',dmin);
set(handles.slider_val, 'Min',dmin);
set(handles.txt_d0_val, 'String',num2str(dmin));


% --- Executes during object creation, after setting all properties.
function edit_dmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function edit_dmax_Callback(hObject, eventdata, handles)
% hObject    handle to edit_dmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_dmax as text
%        str2double(get(hObject,'String')) returns contents of edit_dmax as a double
dmax = str2num(get(hObject,'String'));
setappdata(handles.figure_DoubleLens,'Lens_dmax',dmax); %% ���øý����Ӧ�ó������ݳ�ʼֵ
set(handles.slider_val, 'Max',dmax);


% --- Executes during object creation, after setting all properties.
function edit_dmax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_dmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function slider_val_Callback(hObject, eventdata, handles)
% hObject    handle to slider_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
val = get(hObject,'Value');
set(handles.txt_d0_val, 'String',num2str(val));
setappdata(handles.figure_DoubleLens,'Lens_d',val);   %% ����Ӧ�ó������ݼ���ֵ
set(handles.edit_d, 'String',val); %% ���õ�ǰ��ֹ̬��d��ֵ
feval(@pb_args_Callback,handles.pb_args,eventdata,handles);

% --- Executes during object creation, after setting all properties.
function slider_val_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_val (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pb_args.���㰴ť
function pb_args_Callback(hObject, eventdata, handles)
% hObject    handle to pb_args (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
f1i = getappdata(handles.figure_DoubleLens,'Lens_f1i');
f2i = getappdata(handles.figure_DoubleLens,'Lens_f2i');
d = getappdata(handles.figure_DoubleLens,'Lens_d');
%% ���ü��㺯��
[fi,lFo,lFi,lHo,lHi,L] = multiLens(f1i,f2i,d);  
setappdata(handles.figure_DoubleLens,'Lens_fi',fi);   %% ����Ӧ�ó������ݼ���ֵ
setappdata(handles.figure_DoubleLens,'Lens_lFo',lFo); %% ����Ӧ�ó������ݼ���ֵ
setappdata(handles.figure_DoubleLens,'Lens_lFi',lFi); %% ����Ӧ�ó������ݼ���ֵ
setappdata(handles.figure_DoubleLens,'Lens_lHo',lHo); %% ����Ӧ�ó������ݼ���ֵ
setappdata(handles.figure_DoubleLens,'Lens_lHi',lHi); %% ����Ӧ�ó������ݼ���ֵ
setappdata(handles.figure_DoubleLens,'Lens_L',L);     %% ����Ӧ�ó������ݼ���ֵ
set(handles.txt_fi_val, 'String',num2str(fi));
set(handles.txt_fi_val, 'String',num2str(fi));
set(handles.txt_lFo_val, 'String',num2str(lFo));
set(handles.txt_lFi_val, 'String',num2str(lFi));
set(handles.txt_lHo_val, 'String',num2str(lHo));
set(handles.txt_lHi_val, 'String',num2str(lHi));
set(handles.txt_delt_val, 'String',num2str(d-(f1i+f2i)));
set(handles.txt_L_val, 'String',num2str(L));
%% ������ʾ����
axes(handles.axes_shift); % �趨��ǰ������������
cla reset;
%%
axis([-4000 4000 -50 50]);    
draw_multiLens(f1i,f2i,d,lFo,lFi,lHo,lHi);


% --------------------------------------------------------------------
function axes_shift_menu_Callback(hObject, eventdata, handles)
% hObject    handle to axes_shift_menu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% --------------------------------------------------------------------
function tbl_save_Callback(hObject, eventdata, handles)
% hObject    handle to tbl_save (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
