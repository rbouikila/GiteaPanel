unit updatesetting;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, Spin, ButtonPanel, base64, resstr;

type

  { TUpdSettingForm }

  TUpdSettingForm = class(TForm)
    ButtonPanel1: TButtonPanel;
    CheckBoxUseProxy: TCheckBox;
    CoBoxOsIdent: TComboBox;
    EditConfirmPass: TEdit;
    EditProxyHost: TEdit;
    EditProxyUser: TEdit;
    EditProxyPass: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    EditProxyPort: TSpinEdit;
    procedure CheckBoxUseProxyChange(Sender: TObject);
    procedure FormHide(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
  private

  public

  end;

var
  UpdSettingForm: TUpdSettingForm;

implementation

uses mainunit;

{$R *.frm}

{ TUpdSettingForm }

procedure TUpdSettingForm.CheckBoxUseProxyChange(Sender: TObject);
begin
  GroupBox1.Enabled:= CheckBoxUseProxy.Checked;
end;

procedure TUpdSettingForm.FormHide(Sender: TObject);
begin
  EditConfirmPass.Text:= '';
  EditConfirmPass.Text:= '';
end;

procedure TUpdSettingForm.FormShow(Sender: TObject);
begin
  CoBoxOsIdent.ItemIndex:= CoBoxOsIdent.Items.IndexOf(OSIdent);
  CheckBoxUseProxy.Checked:= UseProxyStatus;
  EditProxyHost.Text:= ProxyHost;
  EditProxyPort.Value:= ProxyPort;
  EditProxyUser.Text:= ProxyUser;
  EditProxyPass.Text:= DecodeStringBase64(ProxyPass);
  EditConfirmPass.Text:= DecodeStringBase64(ProxyPass);
end;

procedure TUpdSettingForm.OKButtonClick(Sender: TObject);
begin
  OSIdent:= CoBoxOsIdent.Text;
  UseProxyStatus:= CheckBoxUseProxy.Checked;
  ProxyHost:= EditProxyHost.Text;
  ProxyPort:= EditProxyPort.Value;
  ProxyUser:= EditProxyUser.Text;
  if UseProxyStatus then
    if EditProxyPass.Text <> EditConfirmPass.Text then
      begin
        ModalResult:= mrNone;
        MessageDlg('Gitea Panel', i18_Err_NoConfirmPass, mtError, [mbOK], 0);
      end
    else ProxyPass:= EncodeStringBase64(EditProxyPass.Text);
end;

end.

