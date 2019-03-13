object FBenfeitorias: TFBenfeitorias
  Left = 201
  Top = 137
  BorderStyle = bsToolWindow
  Caption = 'Benfeitorias'
  ClientHeight = 454
  ClientWidth = 654
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
    Left = 16
    Top = 16
    Width = 106
    Height = 13
    Caption = 'Pesquisar (Descri'#231#227'o):'
  end
  object EditPesquisa: TEdit
    Left = 128
    Top = 12
    Width = 177
    Height = 21
    TabOrder = 0
    OnChange = EditPesquisaChange
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 64
    Width = 649
    Height = 313
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'BeDescricao'
        ReadOnly = True
        Title.Caption = '                      Descricao'
        Width = 184
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'BeVidaUtil'
        ReadOnly = True
        Title.Caption = '   Vida '#218'til'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BeDepreciacao'
        ReadOnly = True
        Title.Caption = '   Deprecia'#231#227'o'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BeReforma'
        ReadOnly = True
        Title.Caption = '        Reforma'
        Width = 90
        Visible = True
      end
      item
        Alignment = taLeftJustify
        Expanded = False
        FieldName = 'BeValorInicial'
        ReadOnly = True
        Title.Caption = '     Valor Inicial'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BeValorFinal'
        ReadOnly = True
        Title.Caption = 'Valor Final'
        Width = 90
        Visible = True
      end>
  end
  object BitBtn1: TBitBtn
    Left = 448
    Top = 400
    Width = 81
    Height = 33
    TabOrder = 2
    OnClick = BitBtn1Click
    Kind = bkOK
  end
  object BitBtn2: TBitBtn
    Left = 552
    Top = 400
    Width = 81
    Height = 33
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = BitBtn2Click
    Kind = bkCancel
  end
  object DataSource1: TDataSource
    DataSet = Table1
    Left = 392
    Top = 16
  end
  object Table1: TTable
    Active = True
    DatabaseName = 'Base_Dados'
    TableName = 'Benfeitorias'
    Left = 448
    Top = 16
    object Table1id_benfeitoria: TAutoIncField
      FieldName = 'id_benfeitoria'
    end
    object Table1BeDescricao: TStringField
      FieldName = 'BeDescricao'
      Size = 50
    end
    object Table1BeVidaUtil: TFloatField
      FieldName = 'BeVidaUtil'
    end
    object Table1BeDepreciacao: TFloatField
      Alignment = taLeftJustify
      FieldName = 'BeDepreciacao'
      currency = True
    end
    object Table1BeReforma: TFloatField
      Alignment = taLeftJustify
      FieldName = 'BeReforma'
      currency = True
    end
    object Table1BeValorInicial: TFloatField
      FieldName = 'BeValorInicial'
      currency = True
    end
    object Table1BeValorFinal: TFloatField
      Alignment = taLeftJustify
      FieldName = 'BeValorFinal'
      currency = True
    end
    object Table1Becodigo_criat: TSmallintField
      FieldName = 'Becodigo_criat'
    end
  end
end
