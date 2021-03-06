unit untMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtDlgs, IOUtils, Printers;

type
  TfrmMain = class(TForm)
    edtFolderpath: TEdit;
    btnGetFileName: TButton;
    lbFileList: TListBox;
    btnPrintList: TButton;
    PrintDialog: TPrintDialog;
    lbPrintTestListBox: TListBox;
    btnSaveFile: TButton;
    btnClose: TButton;

    procedure FormShow(Sender: TObject);

    procedure btnGetFileNameClick(Sender: TObject);
    procedure btnPrintListClick(Sender: TObject);
    procedure btnSaveFileClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edtFolderpathKeyPress(Sender: TObject; var Key: Char);

    procedure GetFileNameList;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.FormShow(Sender: TObject);
begin
  edtFolderpath.Text := '';
  btnPrintList.Enabled := False;
end;

procedure TfrmMain.btnGetFileNameClick(Sender: TObject);
begin
  GetFileNameList;
end;

procedure TfrmMain.btnPrintListClick(Sender: TObject);
var
  PrinterObj : TPrinter;
  LoopCounter, HPosition : Integer;
begin
  if lbFileList.Count = 0 then
  begin
    Exit;
  end;

  if printDialog.Execute then
  begin
    HPosition := 20;

    PrinterObj := Printer;
    with PrinterObj do
    begin
      BeginDoc;

      Canvas.Font.Size   := 10;

      for LoopCounter := 0 to lbFileList.Count - 1 do
      begin
        lbPrintTestListBox.Items.Add(lbFileList.Items.Strings[LoopCounter]);

        //줄 바꾸면서 프린트 하는 부분을 만들어야 함
        Canvas.TextOut(20, HPosition, lbFileList.Items.Strings[LoopCounter]);
        Printer.Canvas.MoveTo(20, HPosition + 20);
        Printer.Canvas.LineTo(20, HPosition + 20);
      end;

      EndDoc;
    end;
  end;
end;

procedure TfrmMain.btnSaveFileClick(Sender: TObject);
var
  FileNames : TStringlist;
  LoopCounter : Integer;
begin
  if lbFileList.Count = 0 then
  begin
    Exit;
  end;

  FileNames:= TStringlist.create;
  try

    for LoopCounter := 0 to lbFileList.Count - 1 do
    begin
      FileNames.Add(lbFileList.Items.Strings[LoopCounter]);
    end;

    FileNames.SaveToFile(GetCurrentDir + '\FileList.txt');

    ShowMessage('File Save Complete');
  finally
    FileNames.Free
  end;
end;

procedure TfrmMain.edtFolderpathKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = Char(VK_RETURN) then
  begin
    GetFileNameList;
  end;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMain.GetFileNameList;
var
  FolderPath : string;
begin
  FolderPath := edtFolderpath.Text;

  if DirectoryExists(FolderPath) = False then
  begin
    edtFolderpath.Text := '';
    ShowMessage('Not exist directory');
    Exit;
  end;

  for FolderPath in TDirectory.GetFiles(FolderPath) do
    lbFileList.Items.Add(ExtractFileName(FolderPath))
end;

end.
