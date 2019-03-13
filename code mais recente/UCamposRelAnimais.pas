unit UCamposRelAnimais;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons;

type
  TFCamposRelAnimais = class(TForm)
    GroupBox1: TGroupBox;
    CheckBoxNome: TCheckBox;
    CheckBoxRegistro: TCheckBox;
    CheckBoxPontuacao: TCheckBox;
    CheckBoxSexo: TCheckBox;
    CheckBoxIndicacao: TCheckBox;
    CheckBoxNascimento: TCheckBox;
    CheckBoxPai: TCheckBox;
    CheckBoxMae: TCheckBox;
    CheckBoxRaca: TCheckBox;
    CheckBoxPelagem: TCheckBox;
    CheckBoxBarba: TCheckBox;
    CheckBoxCornos: TCheckBox;
    CheckBoxBrincos: TCheckBox;
    CheckBoxDtEntrada: TCheckBox;
    CheckBoxMotEntrada: TCheckBox;
    CheckBoxFinalidade: TCheckBox;
    CheckBoxDtSaida: TCheckBox;
    CheckBoxMotSaida: TCheckBox;
    CheckBoxCausaSaida: TCheckBox;
    CheckBoxDtDesmame: TCheckBox;
    CheckBoxCobertura: TCheckBox;
    CheckBoxOrigem: TCheckBox;
    CheckBoxBaia: TCheckBox;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    CheckBoxDep: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    chamado_por:smallint;//esta variável é para saber qual dos formularios chamou este, para poder oculta-lo
                         //assim que o relatorio de maior produção e media das produções for chamado.
                         //1 - chamado por grupo de animais e 2 - chamado por animais especificos
    { Public declarations }
  end;

var
  FCamposRelAnimais: TFCamposRelAnimais;

implementation

uses UrelAnimais, UPrincipal, Ufiltro, Uselecanimaisesp, Uselecanimrel;


{$R *.DFM}

procedure TFCamposRelAnimais.BitBtn1Click(Sender: TObject);
var sel: smallint;
begin
  sel := 1;
  screen.Cursor:=crHourGlass;
  ReportRelGerAn:=TReportRelGerAn.Create(Application);

  //Caso tenha sido selecionado a opcao no formulario Filtro,
  //inclui-se o filtro no cabeçalho do relatorio
  if chamado_por = 1 then
  begin
    if FFiltro.CheckBox7.Checked then
    begin
      Reportrelgeran.QRLabel6.Height := Reportrelgeran.QRLabel6.Height + (length(FFiltro.filtragem) div 100) * 20;
      Reportrelgeran.ChildBand1.Height := Reportrelgeran.ChildBand1.Height + (length(FFiltro.filtragem) div 100) * 20;
      Reportrelgeran.QRlabel6.Caption := FFiltro.filtragem;
    end
    else
    begin
      Reportrelgeran.ChildBand1.Height := 56;
      Reportrelgeran.QRLabel6.Caption := '';
      Reportrelgeran.QRLabel7.Caption := '';
      Reportrelgeran.QRLabel1.Caption := '';
    end;
  end
  else
  begin
    Reportrelgeran.ChildBand1.Height := 56;
    Reportrelgeran.QRLabel6.Caption := '';
    Reportrelgeran.QRLabel7.Caption := '';
    Reportrelgeran.QRLabel1.Caption := '';
  end;


  //E depois monto o relatorio com os campos desejados
  if CheckBoxNome.Checked then
  begin
    ReportRelGerAn.Qrnome.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBnome.Left := ((sel mod 3)* 230) + 45;
    ReportRelGeran.QRNome.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRNome.Destroy;
    ReportRelGerAn.QRDBNome.Destroy;
  end;

  if CheckBoxSexo.Checked then
  begin
    ReportRelGerAn.QRSexo.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBSexo.Left := ((sel mod 3)* 230) + 40;
    ReportRelGeran.QRSexo.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBSexo.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRSexo.Destroy;
    ReportRelGerAn.QRDBSexo.Destroy;
  end;

  if CheckBoxNascimento.Checked then
  begin
    ReportRelGerAn.QRNascimento.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBNascimento.Left := ((sel mod 3)* 230) + 80;
    ReportRelGeran.QRNascimento.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBNascimento.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRNascimento.Destroy;
    ReportRelGerAn.QRDBNascimento.Destroy;
  end;

  if CheckBoxPai.Checked then
  begin
    ReportRelGerAn.QRPai.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBPai.Left := ((sel mod 3)* 230) + 86;
    ReportRelGeran.QRPai.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBPai.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRPai.Destroy;
    ReportRelGerAn.QRDBPai.Destroy;
  end;

  if CheckBoxMae.Checked then
  begin
    ReportRelGerAn.QRMae.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBMae.Left := ((sel mod 3)* 230) + 92;
    ReportRelGeran.QRMae.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBMae.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRMae.Destroy;
    ReportRelGerAn.QRDBMae.Destroy;
  end;

  if CheckBoxCornos.Checked then
  begin
    ReportRelGerAn.QRCornos.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBCornos.Left := ((sel mod 3)* 230) + 50;
    ReportRelGeran.QRCornos.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBCornos.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRCornos.Destroy;
    ReportRelGerAn.QRDBCornos.Destroy;
  end;


  if CheckBoxIndicacao.Checked then
  begin
    ReportRelGerAn.QRindicacao.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBindicacao.Left := ((sel mod 3)* 230) + 68;
    ReportRelGeran.QRindicacao.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBindicacao.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRindicacao.Destroy;
    ReportRelGerAn.QRDBindicacao.Destroy;
  end;

  if CheckBoxPelagem.Checked then
  begin
    ReportRelGerAn.QRPelag.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRPelagem.Left := ((sel mod 3)* 230) + 62;
    ReportRelGeran.QRPelag.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRPelagem.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRPelag.Destroy;
    ReportRelGerAn.QRPelagem.Destroy;
  end;

  if CheckBoxRegistro.Checked then
  begin
    ReportRelGerAn.QRRegistro.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBRegistro.Left := ((sel mod 3)* 230) + 154;
    ReportRelGeran.QRRegistro.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBRegistro.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRRegistro.Destroy;
    ReportRelGerAn.QRDBRegistro.Destroy;
  end;

  if CheckBoxPontuacao.Checked then
  begin
    ReportRelGerAn.QRPontuacao.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBPontuacao.Left := ((sel mod 3)* 230) + 75;
    ReportRelGeran.QRPontuacao.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBPontuacao.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRPontuacao.Destroy;
    ReportRelGerAn.QRDBPontuacao.Destroy;
  end;

  if CheckBoxBarba.Checked then
  begin
    ReportRelGerAn.QRBarba.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBBarba.Left := ((sel mod 3)* 230) + 45;
    ReportRelGeran.QRBarba.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBBarba.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRBarba.Destroy;
    ReportRelGerAn.QRDBBarba.Destroy;
  end;

  if CheckBoxDtEntrada.Checked then
  begin
    ReportRelGerAn.QRDtEntrada.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBDtEntrada.Left := ((sel mod 3)* 230) + 108;
    ReportRelGeran.QRDtEntrada.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBDtEntrada.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRDtEntrada.Destroy;
    ReportRelGerAn.QRDBDtEntrada.Destroy;
  end;

  if CheckBoxMotEntrada.Checked then
  begin
    ReportRelGerAn.QRMotEntrada.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRMotEnt.Left := ((sel mod 3)* 230) + 122;
    ReportRelGeran.QRMotEntrada.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRMotEnt.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRMotEntrada.Destroy;
    ReportRelGerAn.QRMotEnt.Destroy;
  end;

  if CheckBoxBrincos.Checked then
  begin
    ReportRelGerAn.QRBrincos.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBBrincos.Left := ((sel mod 3)* 230) + 47;
    ReportRelGeran.QRBrincos.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBBrincos.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRBrincos.Destroy;
    ReportRelGerAn.QRDBBrincos.Destroy;
  end;

  if CheckBoxDtSaida.Checked then
  begin
    ReportRelGerAn.QRDtSaida.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBDtSaida.Left := ((sel mod 3)* 230) + 92;
    ReportRelGeran.QRDtSaida.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBDtSaida.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRDtSaida.Destroy;
    ReportRelGerAn.QRDBDtSaida.Destroy;
  end;

  if CheckBoxMotsaida.Checked then
  begin
    ReportRelGerAn.QRMotsaida.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRMotsai.Left := ((sel mod 3)* 230) + 108;
    ReportRelGeran.QRMotsaida.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRMotsai.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRMotsaida.Destroy;
    ReportRelGerAn.QRMotsai.Destroy;
  end;

  if CheckBoxCausaSaida.Checked then
  begin
    ReportRelGerAn.QRCausasaida.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRCausaida.Left := ((sel mod 3)* 230) + 104;
    ReportRelGeran.QRCausasaida.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRCausaida.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRCausasaida.Destroy;
    ReportRelGerAn.QRCausaida.Destroy;
  end;

  if CheckBoxDtdesmame.Checked then
  begin
    ReportRelGerAn.QRDtdesmame.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBDtdesmame.Left := ((sel mod 3)* 230) + 122;
    ReportRelGeran.QRDtdesmame.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBDtdesmame.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRDtdesmame.Destroy;
    ReportRelGerAn.QRDBDtdesmame.Destroy;
  end;

  if CheckBoxCobertura.Checked then
  begin
    ReportRelGerAn.QRDtCobertura.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBDtCobertura.Left := ((sel mod 3)* 230) + 126;
    ReportRelGeran.QRDtCobertura.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBDtCobertura.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRDtCobertura.Destroy;
    ReportRelGerAn.QRDBDtCobertura.Destroy;
  end;

  if CheckBoxFinalidade.Checked then
  begin
    ReportRelGerAn.QRFinalidade.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBFinalidade.Left := ((sel mod 3)* 230) + 74;
    ReportRelGeran.QRFinalidade.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBFinalidade.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRFinalidade.Destroy;
    ReportRelGerAn.QRDBFinalidade.Destroy;
  end;

  if CheckBoxOrigem.Checked then
  begin
    ReportRelGerAn.QROrigem.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBOrigem.Left := ((sel mod 3)* 230) + 54;
    ReportRelGeran.QROrigem.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBOrigem.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QROrigem.Destroy;
    ReportRelGerAn.QRDBOrigem.Destroy;
  end;

  if CheckBoxBaia.Checked then
  begin
    ReportRelGerAn.QRBaia.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBBaia.Left := ((sel mod 3)* 230) + 36;
    ReportRelGeran.QRBaia.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBBaia.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRBaia.Destroy;
    ReportRelGerAn.QRDBBaia.Destroy;
  end;

  if CheckBoxDep.Checked then
  begin
    ReportRelGerAn.QRDep.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBDep.Left := ((sel mod 3)* 230) + 41;
    ReportRelGeran.QRDep.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBDep.Top := ((sel div 3) * 18) + 2;
    sel := sel + 3;

    ReportRelGerAn.QRDepCalc.Left := ((sel mod 3) * 230);
    ReportRelgeran.QRDBDepCalc.Left := ((sel mod 3)* 230) + 41;
    ReportRelGeran.QRDepCalc.Top := ((sel div 3) * 18) + 2;
    ReportRelGeran.QRDBDepCalc.Top := ((sel div 3) * 18) + 2;
    sel := sel + 1;
  end
  else
  begin
    ReportRelGerAn.QRDep.Destroy;
    ReportRelGerAn.QRDBDep.Destroy;
    ReportRelGerAn.QRDepCalc.Destroy;
    ReportRelGerAn.QRDBDepCalc.Destroy;
  end;



  if checkboxraca.checked then
  begin
    if ((sel mod 3) <> 0) then sel := sel + 2;
    ReportRelGerAn.QRLabel13.Top := ((sel div 3) * 18) + 2;
    ReportRelGerAn.QRraca.Top := ((sel div 3) * 18) + 2;
    ReportRelGerAn.Composicao.Top := ((sel div 3) * 18) + 2;
    ReportRelGerAn.Num1.Top := (((sel div 3) + 1) * 18) + 2;
    ReportRelGerAn.Barra1.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Den1.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Raca1.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Num2.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Barra2.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Den2.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Raca2.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Num3.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Barra3.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Den3.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Raca3.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Num4.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Barra4.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Den4.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.Raca4.Top := ReportRelGerAn.Num1.Top;
    ReportRelGerAn.QRLabel21.Top := ReportRelGerAn.Num1.Top + 15;
    ReportRelGerAn.QRBand2.Height := ReportRelGerAn.Num1.Top + 28;
  end
  else
  begin
    sel := sel - 1;
    ReportRelGerAn.QRLabel13.Destroy;   ReportRelGerAn.QRraca.Destroy;
    ReportRelGerAn.Composicao.Destroy;  ReportRelGerAn.Num1.Destroy;
    ReportRelGerAn.Barra1.Destroy;      ReportRelGerAn.Den1.Destroy;
    ReportRelGerAn.Raca1.Destroy;       ReportRelGerAn.Num2.Destroy;
    ReportRelGerAn.Barra2.Destroy;      ReportRelGerAn.Den2.Destroy;
    ReportRelGerAn.Raca2.Destroy;       ReportRelGerAn.Num3.Destroy;
    ReportRelGerAn.Barra3.Destroy;      ReportRelGerAn.Den3.Destroy;
    ReportRelGerAn.Raca3.Destroy;       ReportRelGerAn.Num4.Destroy;
    ReportRelGerAn.Barra4.Destroy;      ReportRelGerAn.Den4.Destroy;
    ReportRelGerAn.Raca4.Destroy;
    ReportRelGerAn.QRLabel21.Top:=((sel div 3) * 18) + 15;
    ReportRelGerAn.QRBand2.Height:=((sel div 3) * 18) + 25;
  end;

  ReportRelGerAn.QRLabel3.caption:=IntToStr(Fprincipal.cod_criatorio);
  ReportRelGerAn.QRLabel5.caption:=Fprincipal.nomecriat;
  ReportRelGerAn.Tselecionados.open;
  screen.Cursor:=crDefault;
  FSelecanimaisrel.Hide;
  Fselecanimaisrel.Close;
  if chamado_por = 1 then
  begin
    FFiltro.Hide;
    FFiltro.Close;
  end
  else
  begin
    Fselecanimaisesp.hide;
    Fselecanimaisesp.Close;
  end;
  FCamposRelAnimais.Hide;
  Fcamposrelanimais.Close;
  ReportRelGerAn.preview;
  ReportRelGerAn.free;
end;

procedure TFCamposRelAnimais.BitBtn4Click(Sender: TObject);
begin
  CheckBoxNome.Checked:=true; CheckBoxRegistro.Checked:=true; CheckBoxSexo.Checked:=true;
  CheckBoxPontuacao.Checked:=true; CheckBoxIndicacao.Checked:=true; CheckBoxRaca.Checked:=true;
  CheckBoxNascimento.Checked:=true; CheckBoxPai.Checked:=true; CheckBoxMae.Checked:=true;
  CheckBoxPelagem.Checked:=true; CheckBoxBarba.Checked:=true; CheckBoxBaia.Checked:=true;
  CheckBoxCornos.Checked:=true; CheckBoxBrincos.Checked:=true; CheckBoxDtEntrada.Checked:=true;
  CheckBoxMotEntrada.Checked:=true; CheckBoxFinalidade.Checked:=true; CheckBoxDtSaida.Checked:=true;
  CheckBoxMotSaida.Checked:=true; CheckBoxCausaSaida.Checked:=true; CheckBoxDtDesmame.Checked:=true;
  CheckBoxCobertura.Checked:=true; CheckBoxOrigem.Checked:=true; CheckBoxDep.Checked:=true;
end;

procedure TFCamposRelAnimais.BitBtn3Click(Sender: TObject);
begin
  CheckBoxNome.Checked:=false; CheckBoxRegistro.Checked:=false; CheckBoxSexo.Checked:=false;
  CheckBoxPontuacao.Checked:=false; CheckBoxIndicacao.Checked:=false; CheckBoxRaca.Checked:=false;
  CheckBoxNascimento.Checked:=false; CheckBoxPai.Checked:=false; CheckBoxMae.Checked:=false;
  CheckBoxPelagem.Checked:=false; CheckBoxBarba.Checked:=false; CheckBoxBaia.Checked:=false;
  CheckBoxCornos.Checked:=false; CheckBoxBrincos.Checked:=false; CheckBoxDtEntrada.Checked:=false;
  CheckBoxMotEntrada.Checked:=false; CheckBoxFinalidade.Checked:=false; CheckBoxDtSaida.Checked:=false;
  CheckBoxMotSaida.Checked:=false; CheckBoxCausaSaida.Checked:=false; CheckBoxDtDesmame.Checked:=false;
  CheckBoxCobertura.Checked:=false; CheckBoxOrigem.Checked:=false; CheckBoxDep.Checked:=false;
end;

procedure TFCamposRelAnimais.BitBtn5Click(Sender: TObject);
begin
  FCamposRelAnimais.close;
  Screen.Cursor:=CrDefault;
end;


end.
