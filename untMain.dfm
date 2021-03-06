object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Extract File Name List from Specific Directory'
  ClientHeight = 431
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object edtFolderpath: TEdit
    Left = 8
    Top = 8
    Width = 441
    Height = 21
    TabOrder = 0
    Text = 'edtFolderpath'
    OnKeyPress = edtFolderpathKeyPress
  end
  object btnGetFileName: TButton
    Left = 8
    Top = 35
    Width = 441
    Height = 25
    Caption = 'Get File Name from Directory'
    TabOrder = 1
    OnClick = btnGetFileNameClick
  end
  object lbFileList: TListBox
    Left = 8
    Top = 66
    Width = 441
    Height = 262
    ItemHeight = 13
    TabOrder = 2
  end
  object btnPrintList: TButton
    Left = 8
    Top = 334
    Width = 441
    Height = 25
    Caption = 'Print List'
    TabOrder = 3
    OnClick = btnPrintListClick
  end
  object lbPrintTestListBox: TListBox
    Left = 472
    Top = 63
    Width = 281
    Height = 265
    ItemHeight = 13
    TabOrder = 4
  end
  object btnSaveFile: TButton
    Left = 8
    Top = 365
    Width = 441
    Height = 25
    Caption = 'Save File'
    TabOrder = 5
    OnClick = btnSaveFileClick
  end
  object btnClose: TButton
    Left = 8
    Top = 396
    Width = 441
    Height = 25
    Caption = 'Close'
    TabOrder = 6
    OnClick = btnCloseClick
  end
  object PrintDialog: TPrintDialog
    Left = 224
    Top = 200
  end
end
