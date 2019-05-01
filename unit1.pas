unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, process, Forms, Controls, Graphics, Dialogs, StdCtrls,
  EditBtn, ButtonPanel, ExtCtrls, Menus, IniFiles, FileUtil;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonPanel1: TButtonPanel;
    EditBrows: TEdit;
    GiteaPatch: TFileNameEdit;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    MenuSetting: TMenuItem;
    MenuStart: TMenuItem;
    MenuStop: TMenuItem;
    MenuItem3: TMenuItem;
    MenuOpenGitea: TMenuItem;
    MenuItem5: TMenuItem;
    MenuClose: TMenuItem;
    PopupMenu1: TPopupMenu;
    TrayIcon1: TTrayIcon;
    procedure CancelButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MenuCloseClick(Sender: TObject);
    procedure MenuOpenGiteaClick(Sender: TObject);
    procedure MenuSettingClick(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    GiPatch:String;
    Brows:String;
    Conf:TIniFile;
    function IsRuning(AProcName:string):Boolean;
    procedure SetTrayIcon;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.frm}

{ TForm1 }

function TForm1.IsRuning(AProcName:String):Boolean;
var t:Tprocess;
    s:TStringList;
begin
  Result:=False;
  t:=TProcess.Create(nil);
  t.Executable:=FindDefaultExecutablePath('pgrep');
  t.Parameters.Add('-x');
  t.Parameters.Add(AProcName);
  t.Options:=[poUsePipes, poWaitOnExit];
  t.Execute;
  s:=TStringList.Create;
  s.LoadFromStream(t.Output);
  Result:= s.Text <> '';
  t.Free;
  s.Free;
end;

procedure TForm1.SetTrayIcon;
var GiFile:String;
begin
  if GiPatch='' then GiFile:= 'gitea'
  else GiFile:=ExtractFileName(GiPatch);
  if IsRuning(GiFile) then
     begin
       TrayIcon1.Icon.LoadFromResourceName(HINSTANCE, 'GITEAGREEN');
       MenuStart.Enabled:=False;
       MenuOpenGitea.Enabled:=True;
       MenuStop.Enabled:=True;
     end
  else
     begin
       TrayIcon1.Icon.LoadFromResourceName(HINSTANCE, 'GITEARED');
       MenuStart.Enabled:=True;
       MenuOpenGitea.Enabled:=False;
       MenuStop.Enabled:=False;
     end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Conf:= TIniFile.Create('giteapanel.conf');
  GiPatch:=Conf.ReadString('DATA','GiteaPath','');
  Brows:=Conf.ReadString('DATA','Browser','');
  GiteaPatch.Text:=GiPatch;
  EditBrows.Text:=Brows;

  SetTrayIcon;

  TrayIcon1.Visible:=true;
end;

procedure TForm1.CancelButtonClick(Sender: TObject);
begin
  Form1.Hide;
end;

procedure TForm1.MenuCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TForm1.MenuOpenGiteaClick(Sender: TObject);
var t:TProcess;
begin
  t:=TProcess.Create(nil);
  t.Executable:= FindDefaultExecutablePath(Brows);
  t.Parameters.Add('http://localhost:3000');
  t.Execute;
  t.Free
end;

procedure TForm1.MenuSettingClick(Sender: TObject);
begin
  if Form1.Visible then Form1.Hide
  else Form1.Show;
end;

procedure TForm1.OKButtonClick(Sender: TObject);
begin
  if (GiPatch <> GiteaPatch.Text) or (Brows <> EditBrows.Text) then
     begin
       Conf.WriteString('DATA','GiteaPath',GiteaPatch.Text);
       Conf.WriteString('DATA','Browser',EditBrows.Text);
       GiPatch:=GiteaPatch.Text;
       Brows:=EditBrows.Text;
     end;
  Form1.Hide;
end;

procedure TForm1.TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  SetTrayIcon;
end;

end.

