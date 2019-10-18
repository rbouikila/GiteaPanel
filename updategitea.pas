unit updategitea;

{$mode objfpc}{$H+}

interface

uses
  {$IFDEF UNIX} BaseUnix, {$ENDIF}
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ComCtrls,
  ExtCtrls, Buttons, fpjson, jsonparser, resstr, opensslsockets,
  fphttpclient, process;

type
  TGHData = record
    GiteaVersion: string;
    DownloadUrl: String;
  end;

type
  TButtType = (BtnOk, BtnYes, BtnNo);
  TArrayBut = array of TButtType;

type

  { TFormUpdGitea }

  TFormUpdGitea = class(TForm)
    BitBtnUpd: TBitBtn;
    BitBtnCancel: TBitBtn;
    BitBtnOk: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    ProgressBar1: TProgressBar;
    Timer1: TTimer;
    procedure BitBtnCancelClick(Sender: TObject);
    procedure BitBtnOkClick(Sender: TObject);
    procedure BitBtnUpdClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckUpdateDownload(Sender: TObject);
    procedure BitBtnVisidle(aVisButt: TArrayBut);
  private
    function GetCurrentVersion(aFilePath: String): String;
    function GetGitHubData(aUrl, aOSIdent: String; out outError: String): TGHData;
    function _Download(aUrl, aOutFile: string): Boolean;
    function CheckString(aStr, aInclude, aExclude: String; aDelim: Char): Boolean;
    procedure Progress(Sender: TObject; const aMaxLength, aCopyLength: Int64);

  public
    GHData: TGHData;
    CurrVer: String;

  end;

var
  FormUpdGitea: TFormUpdGitea;

const
  GITHUB_URL = 'https://api.github.com/repos/go-gitea/gitea/releases/latest';
  EXCLUDE_STRING = '.asc,.sha256,.xz,.xz.asc,.xz.sha256';

implementation

uses mainunit;


{$R *.frm}

{ TFormUpdGitea }


procedure TFormUpdGitea.Progress(Sender: TObject; const aMaxLength, aCopyLength: Int64);
begin
  ProgressBar1.Position:= Trunc(aCopyLength/aMaxLength*100);
  Application.ProcessMessages;
end;

procedure TFormUpdGitea.FormShow(Sender: TObject);
begin
  BitBtnVisidle([]);
  Label1.Caption:= i18_GeCurrentVersion;
  Label2.Caption:= ' ';
  Timer1.Enabled:= True;
end;

procedure TFormUpdGitea.BitBtnCancelClick(Sender: TObject);
begin
  ProgressBar1.Visible:= False;
  Close;
end;

procedure TFormUpdGitea.BitBtnOkClick(Sender: TObject);
begin
  ProgressBar1.Visible:= False;
  Close;
end;

procedure TFormUpdGitea.BitBtnUpdClick(Sender: TObject);
var run: Boolean;
begin
  BitBtnVisidle([]);
  if RIR.IsRun then
    begin
      run:= RIR.IsRun;
      MainForm.StopGiteaServer;
    end;
  RenameFile(GiPath, GiPath + '_' + CurrVer);
  Label2.Caption:= i18_DownloadFile;
  ProgressBar1.Visible:= True;
  if _Download(GHData.DownloadUrl, GiPath) then
    begin
      FpChmod(GiPath, &755);
      Label1.Caption:= i18_CurrentVersion + GetCurrentVersion(GiPath);
      Label2.Caption:= i18_UpfradeComplete;
      BitBtnVisidle([BtnOk]);
    end
  else begin
      Label2.Caption:= I18_Err_DownloadFile;
      BitBtnVisidle([BtnOk]);
  end;
  if run then MainForm.RunGiteaServer;
end;

procedure TFormUpdGitea.CheckUpdateDownload(Sender: TObject);
var ErrGHData: String;
begin
  Timer1.Enabled:= False;
  CurrVer:= GetCurrentVersion(GiPath);
  Label1.Caption:= i18_CurrentVersion + CurrVer;
  Label2.Caption:= i18_CheckNewversion;
  Application.ProcessMessages;
  GHData:= GetGitHubData(GITHUB_URL, OSIdent, ErrGHData);
  if ErrGHData = '' then
    if GHData.GiteaVersion > CurrVer then
      begin
        Label2.Caption:= i18_NewVersionAvailable + GHData.GiteaVersion;
        BitBtnVisidle([BtnYes,BtnNo]);
      end
    else
      begin
        Label2.Caption:= i18_LatesVersion;
        BitBtnVisidle([BtnOk]);
      end
  else begin
    Label2.Caption:= ErrGHData;
    BitBtnVisidle([BtnOk]);
  end;
end;

procedure TFormUpdGitea.BitBtnVisidle(aVisButt: TArrayBut);

  function InArray(aBtnType: TButtType): Boolean;
  var i: Integer;
  begin
    Result:= False;
    for i:= Low(aVisButt) to High(aVisButt) do
      if aBtnType = aVisButt[i] then begin
        Result:= true;
        Break;
      end;
  end;

begin
  BitBtnCancel.Visible:= InArray(BtnNo);
  BitBtnOk.Visible:= InArray(BtnOk);
  BitBtnUpd. Visible:= InArray(BtnYes);
end;

function TFormUpdGitea.GetCurrentVersion(aFilePath: String): String;
begin
  Result:= '0.0.0';
  Try
    if RunCommand(aFilePath + ' -v', Result) then Result:= Result.Split(' ')[2];
  except
    on Err:Exception do  Result:= '0.0.0';
  end;
end;

function TFormUpdGitea.GetGitHubData(aUrl, aOSIdent: String; out outError: String): TGHData;
var i: Integer;
    J: TJSONData;
    JA: TJSONArray;
begin
  //InitSSLInterface;
  Result.GiteaVersion:= '0.0.0';
  Result.DownloadUrl:= '';
  outError:= '';
  J:= nil;
  with TFPHTTPClient.Create(nil) do
    try
      AllowRedirect:= True;
      AddHeader('User-Agent','GiteaPanel');  //!!!!!!!  Mozilla/5.0 (compatible; fpweb)
      try
        J:= GetJSON(Get(aUrl));
        Result.GiteaVersion:= Copy(j.FindPath('tag_name').AsString, 2, 5);
        JA:= TJSONArray(j.FindPath('assets'));
        for i:= 0 to JA.Count - 1 do
          if CheckString(JA[i].FindPath('name').AsString, aOSIdent, EXCLUDE_STRING,',') then
            begin
              Result.DownloadUrl:= JA[i].FindPath('browser_download_url').AsString;
              Break;
            end;
      except
        on Err: Exception do outError:= i18_Msg_Err_GetGitHubData + #13 + Err.Message;
      end;
    finally
      J.Free;
      Free;
    end;
end;

function TFormUpdGitea._Download(aUrl, aOutFile: string): Boolean;
begin
  with TFPHTTPClient.Create(nil) do
    try
      AllowRedirect:= True;
      OnDataReceived:= @Progress;
      AddHeader('User-Agent','GiteaPanel');
      try
        Get(aUrl,aOutFile);
        Result:= 200 = ResponseStatusCode;
      except
        on Err: Exception do Result:= False;
      end;
    finally
      Free;
    end;
end;

function TFormUpdGitea.CheckString(aStr, aInclude, aExclude: String; aDelim: Char): Boolean;
var i, r: Integer;
    IncArray, ExcArray: TStringArray;
begin
  Result:= False;
  if Length(aInclude) = 0 then Exit;
  if Length(aExclude) <> 0 then
    begin
      ExcArray:= aExclude.Split(aDelim);
      for i:= Low(ExcArray) to High(ExcArray) do if Pos(ExcArray[i], aStr) <> 0 then Exit;
    end;
  IncArray:= aInclude.Split(aDelim);
  r:= 0;
  for i:= Low(IncArray) to High(IncArray) do
    if Pos(IncArray[i], aStr) > 0 then Inc(r);
  Result:= r = High(IncArray)+1;
end;

end.

