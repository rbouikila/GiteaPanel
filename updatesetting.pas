unit updatesetting;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, Spin, ButtonPanel;

type

  { TForm3 }

  TForm3 = class(TForm)
    ButtonPanel1: TButtonPanel;
    CheckBoxUseProxy: TCheckBox;
    CoBoxOsIdent: TComboBox;
    EditProxyHost: TEdit;
    EditProxyUser: TEdit;
    EditProxyPass: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditProxyPort: TSpinEdit;
    procedure CheckBoxUseProxyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;

implementation

uses Unit1;

{$R *.frm}

{ TForm3 }

procedure TForm3.CheckBoxUseProxyChange(Sender: TObject);
begin
  GroupBox1.Enabled:= CheckBoxUseProxy.Checked;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
  CoBoxOsIdent.ItemIndex:= CoBoxOsIdent.Items.IndexOf(OSIdent);
  CheckBoxUseProxy.Checked:= UseProxyStatus;
  EditProxyHost.Text:= ProxyHost;
  EditProxyPort.Value:= ProxyPort;
  EditProxyUser.Text:= ProxyUser;
  EditProxyPass.Text:= ProxyPass;
end;

procedure TForm3.OKButtonClick(Sender: TObject);
begin
  OSIdent:= CoBoxOsIdent.Text;
  UseProxyStatus:= CheckBoxUseProxy.Checked;
  ProxyHost:= EditProxyHost.Text;
  ProxyPort:= EditProxyPort.Value;
  ProxyUser:= EditProxyUser.Text;
  ProxyPass:= EditProxyPass.Text;
end;

end.
