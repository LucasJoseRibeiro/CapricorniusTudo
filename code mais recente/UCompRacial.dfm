object FCompRacial: TFCompRacial
  Left = 390
  Top = 273
  Width = 275
  Height = 115
  Caption = 'Composi'#231#227'o Racial'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 251
    Height = 13
    Caption = 'Selecione a Composi'#231#227'o Racial dos Animais'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 24
    Width = 41
    Height = 13
    Caption = 'Ra'#231'as:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 48
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
  end
  object Button1: TButton
    Left = 176
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Ok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    Visible = False
    OnClick = Button1Click
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 80
    Width = 249
    Height = 85
    Caption = 'Composi'#231#227'o'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMaroon
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Visible = False
    object Label3: TLabel
      Left = 8
      Top = 64
      Width = 29
      Height = 13
      Caption = 'ra'#231'as.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Visible = False
    end
    object ListBox1: TListBox
      Left = 128
      Top = 8
      Width = 113
      Height = 70
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
    object ComboBox2: TComboBox
      Left = 8
      Top = 16
      Width = 105
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      Visible = False
      OnChange = ComboBox2Change
    end
    object CheckBox1: TCheckBox
      Left = 8
      Top = 48
      Width = 121
      Height = 17
      Caption = 'Restrija as essas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Visible = False
    end
  end
  object CheckBox2: TCheckBox
    Left = 176
    Top = 24
    Width = 57
    Height = 17
    Caption = 'Geral'
    TabOrder = 3
    OnClick = CheckBox2Click
  end
end
