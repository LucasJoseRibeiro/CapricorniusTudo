unit Uentrada;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, DBCtrls, ComCtrls, Db, DBTables, Math, DateUtils;

type
  TFentrada = class(TForm)
    StatusBar1: TStatusBar;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ComboBox1: TComboBox;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Label1: TLabel;
    function RetornaDia(var dt:String): integer;
    function RetornaMes(var dt:String): integer;
    procedure ComboBox1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    senha: string;
  end;

var
  Fentrada: TFentrada;

implementation

uses Udatamodule, UPrincipal, UcriatorioAtual, Ucriatorio, Ufiltro,
  UValidar;


{$R *.DFM}

function TFEntrada.RetornaDia(var dt:string): integer;
var str:string;
    i: smallint;
begin
  i := 1;
  str := '';
  while(dt[i]<>'/')do
  begin
    str := str + dt[i];
    i := i + 1;
  end;
  result := strtoint(str);
end;

function TFEntrada.RetornaMes(var dt:string): integer;
var str:string;
    i: smallint;
begin
  i := 1;
  while(dt[i]<>'/')do
    i := i + 1;
  i := i + 1;
  str := '';
  while(dt[i]<>'/')do
  begin
    str := str + dt[i];
    i := i + 1;
  end;
  result := strtoint(str);
end;

procedure TFentrada.ComboBox1Click(Sender: TObject);
begin
 if combobox1.ItemIndex <> -1 then
 begin
   Fdatamodule.TCriatorio.Open;
   Fdatamodule.TCriatorio.Locate('Crnome', combobox1.Text, []);
   statusbar1.Panels[0].Text := 'Codigo do criatorio: '+inttostr(combobox1.ItemIndex+1);
   senha := Fdatamodule.TCriatorio.Fields[1].AsString;
   Fdatamodule.TCriatorio.close;
   edit1.Clear;
   edit1.SetFocus;
 end;
end;

procedure TFentrada.SpeedButton3Click(Sender: TObject);
var
  data, an_aleit, an_cresc, an_prim, an_plur, an_machos, an_reprod: string;
  cabras_lactacao, cresc1, cresc2, machos_cresc, d: integer;
  i, it: smallint;
  s,ttemp,LinhadeComando,endbd,destino,endexe:string;
  estadostab:array[0..19] of boolean;
begin
  if ComboBox1.ItemIndex = -1 then
  begin
    Showmessage('Escolha um criatório');
    Combobox1.setfocus;
    exit;
  end;
  with FPrincipal do
  begin
    //Aqui seto os botoes com seus valores default
    //Primeiro seto os enabled
    BitBtn43.enabled := true; BitBtn42.enabled := true;
    BitBtn74.enabled := true; BitBtn41.enabled := true;
    BitBtn77.enabled := true; BitBtn66.enabled := true;
    BitBtn60.enabled := true; BitBtn61.enabled := true;
    BitBtn46.enabled := true; BitBtn22.enabled := true;
    Speedbutton69.enabled := true; Speedbutton93.enabled := true;
    Speedbutton70.enabled := true; Speedbutton86.enabled := true;
    Speedbutton96.enabled := true; Speedbutton79.enabled := true;
    Speedbutton85.enabled := true; Speedbutton68.enabled := true;
    btninserirfoto.Enabled := true; btnexcluirfoto.Enabled := true;

    //E depois os visible
    Bitbtn50.visible := true; Bitbtn51.visible := true;
    Bitbtn52.visible := true; Bitbtn59.visible := true;
    Bitbtn62.visible := true; Bitbtn64.visible := true;
    Bitbtn79.visible := true; Bitbtn80.visible := true;
    Bitbtn81.visible := true; Bitbtn5.visible := true;
    Bitbtn6.visible := true;  Bitbtn8.visible := true;
    Bitbtn9.visible := true;  Bitbtn10.visible := true;
    Bitbtn11.visible := true; Bitbtn69.visible := true;
    Bitbtn32.visible := true; Bitbtn33.visible := true;
    Bitbtn34.visible := true; Bitbtn36.visible := true;
    Bitbtn37.visible := true; Bitbtn38.visible := true;
    Bitbtn40.visible := true; Bitbtn44.visible := true;
    Bitbtn54.visible := true; Bitbtn55.visible := true;
    Bitbtn56.visible := true; Bitbtn58.visible := true;
    Bitbtn13.visible := true; Bitbtn14.visible := true;
    Bitbtn15.visible := true; Bitbtn18.visible := true;
    Bitbtn19.visible := true; Bitbtn20.visible := true;
    Bitbtn84.visible := true; Bitbtn85.visible := true;
    Bitbtn86.visible := true; Bitbtn88.visible := true;
    Bitbtn89.visible := true; Bitbtn90.visible := true;
    btnremoverdesmama.Visible := true;

    //E finalmente reposiciono os botoes "Limpar campos"
    BitBtn31.left := 16; BitBtn35.left := 16; BitBtn39.left := 14;
    BitBtn53.left := 16; BitBtn57.left := 142; BitBtn49.left := 16;
    BitBtn48.left := 16; BitBtn78.left := 16; BitBtn4.left := 16;
    BitBtn7.left := 16;  BitBtn71.left := 136; BitBtn12.left := 16;
    BitBtn17.left := 16; BitBtn83.left := 14;  BitBtn87.left := 14;

    if FEntrada.edit1.Text <> senha then
    begin
      if messagedlg('Senha incorreta para este criatório'+#13+
                    'Deseja entrar no modo somente leitura?', mtconfirmation, [mbyes, mbno], 0) = mryes then
      begin
        //Caso o usuario deseje o modo somente leitura, mudo os valores default dos botoes
        //Primeiro altero os enabled
        BitBtn43.enabled := false; BitBtn42.enabled := false;
        BitBtn74.enabled := false; BitBtn41.enabled := false;
        BitBtn77.enabled := false; BitBtn66.enabled := false;
        BitBtn60.enabled := false; BitBtn61.enabled := false;
        BitBtn46.enabled := false; BitBtn22.enabled := false;
        BitBtnSincronizar.enabled := false;
        Speedbutton69.enabled := false; Speedbutton93.enabled := false;
        Speedbutton70.enabled := false; Speedbutton86.enabled := false;
        Speedbutton96.enabled := false; Speedbutton79.enabled := false;
        Speedbutton85.enabled := false; Speedbutton68.enabled := false;
        btninserirfoto.Enabled := false; btnexcluirfoto.Enabled := false;

        //E depois os visible
        Bitbtn50.visible := false; Bitbtn51.visible := false;
        Bitbtn52.visible := false; Bitbtn59.visible := false;
        Bitbtn62.visible := false; Bitbtn64.visible := false;
        Bitbtn79.visible := false; Bitbtn80.visible := false;
        Bitbtn81.visible := false; Bitbtn5.visible := false;
        Bitbtn6.visible := false;  Bitbtn8.visible := false;
        Bitbtn9.visible := false;  Bitbtn10.visible := false;
        Bitbtn11.visible := false; Bitbtn69.visible := false;
        Bitbtn32.visible := false; Bitbtn33.visible := false;
        Bitbtn34.visible := false; Bitbtn36.visible := false;
        Bitbtn37.visible := false; Bitbtn38.visible := false;
        Bitbtn40.visible := false; Bitbtn44.visible := false;
        Bitbtn54.visible := false; Bitbtn55.visible := false;
        Bitbtn56.visible := false; Bitbtn58.visible := false;
        Bitbtn13.visible := false; Bitbtn14.visible := false;
        Bitbtn15.visible := false; Bitbtn18.visible := false;
        Bitbtn19.visible := false; Bitbtn20.visible := false;
        Bitbtn84.visible := false; Bitbtn85.visible := false;
        Bitbtn86.visible := false; Bitbtn88.visible := false;
        Bitbtn89.visible := false; Bitbtn90.visible := false;
        btnremoverdesmama.Visible := false;

        //E finalmente reposiciono os botoes "Limpar campos"
        BitBtn31.left := 191; BitBtn35.left := 191; BitBtn39.left := 191;
        BitBtn53.left := 191; BitBtn57.left := 191; BitBtn49.left := 191;
        BitBtn48.left := 191; BitBtn78.left := 191; BitBtn4.left := 191;
        BitBtn7.left := 191;  BitBtn71.left := 191; BitBtn12.left := 191;
        BitBtn17.left := 191; BitBtn83.left := 191;  BitBtn87.left := 191;
      end
      else
      begin
        FEntrada.edit1.Clear;
        FEntrada.edit1.SetFocus;
        exit;
      end;
    end;


    FDatamodule.TCriatorio.Open;
    FDatamodule.TCriatorio.Locate('Crnome', FEntrada.combobox1.Text, []);
    StatusBar29.Panels[0].text := 'Codigo do criatório: '+inttostr(FEntrada.ComboBox1.ItemIndex + 1);
    StatusBar29.Panels[1].text := 'Nome do criatório: '+FEntrada.ComboBox1.text;
    num:=0;
    den:=0;
    numcrias:=0;
    cod_criatorio := FEntrada.ComboBox1.ItemIndex + 1;
    indice_zootecnico := FDatamodule.Tcriatorio.fieldbyname('Crindicezootecnico').asstring;
    nomecriat := FEntrada.ComboBox1.text;
    tipo_sufafix := FDatamodule.Tcriatorio.fieldbyname('Crsufixoafixo').asstring;
    valor_sufafix := FDatamodule.Tcriatorio.fieldbyname('Crvalorsufafix').asstring;
    parto_nascimento:=false;
    MonthCalendar1.Date:=Date;

    with FDataModule do
    begin
      //Verifica o inventário animal
      data := datetostr(Date);
      QVerificaData.SQL.Text := 'select AnFinDataLanc from AnimaisFinanca where AnFinDataLanc =:d';
      QVerificaData.Params[0].AsString := dateToStr(date);
      QVerificaData.Open;
      if (Retornadia(data) = 01) and QVerificaData.IsEmpty  then
      begin
        TIndices.Open;
        if indice_zootecnico = 'N' then
          TIndices.Locate('Cod_criatorio', -2, [])
        else if indice_zootecnico = 'P' then
          TIndices.Locate('Cod_criatorio', -1, [])
        else if indice_zootecnico = 'A' then
          TIndices.Locate('Cod_criatorio', cod_criatorio, []);

        // Fêmeas em aleitamento
        QCodigo.Close;
        QCodigo.SQL.text := 'select count(*) from animal where ancriatorio_crcodigo=:c and andsaida is null and '+
                            'ansexo='#39+'Fêmea'+#39+' and andnascimento >=:dt1';
        QCodigo.Params[0].AsInteger := cod_criatorio;
        QCodigo.Params[1].asstring := datetostr(date - Tindices.fieldbyname('idade_desmama_femea').AsInteger);
        QCodigo.Open;
        an_aleit := QCodigo.Fields[0].asstring;

        //Fêmeas até idade reprodutiva
        QCodigo.Close;
        QCodigo.SQL.text := 'select count(*) from animal where ancriatorio_crcodigo=:c and andsaida is null and '+
                            'ansexo='#39+'Fêmea'+#39+' and (andnascimento >=:dt1 and andnascimento <:dt2)';
        QCodigo.Params[0].AsInteger := cod_criatorio;
        QCodigo.Params[1].asstring := datetostr(date - Tindices.fieldbyname('idade_min_acasalamento').AsInteger);
        QCodigo.Params[2].asstring := datetostr(date - Tindices.fieldbyname('idade_desmama_femea').AsInteger);
        QCodigo.Open;
        cresc1 := QCodigo.Fields[0].asinteger;

        //Fêmeas nulíparas em condições de acasalamento
        QCodigo.Close;
        QCodigo.SQL.text := 'select count(*) from animal where ancriatorio_crcodigo=:c and andsaida is null and '+
                            'ansexo='#39+'Fêmea'+#39+' and andnascimento <:dt1 and '+
                            'anplaca not in (select distinct paanimal_anplaca from parto)';
        QCodigo.Params[0].AsInteger := cod_criatorio;
        QCodigo.Params[1].asstring := datetostr(date - Tindices.fieldbyname('idade_min_acasalamento').AsInteger);
        QCodigo.Open;
        cresc2 := QCodigo.Fields[0].asinteger;

        //Cabritas em crescimento
        an_cresc := IntToStr(cresc1 + cresc2);

        //Cabras em lactacao
        QCodigo.Close;
        QCodigo.SQL.text := 'select anplaca, padatapar from animal, parto where ancriatorio_crcodigo=:c '+
                            'and Andsaida is null and ancriatorio_crcodigo=pacriat_ancriatorio and '+
                            'anplaca=paanimal_anplaca and Padatenclac is null';
        QCodigo.params[0].asinteger := cod_criatorio;
        QCodigo.Open;
        cabras_lactacao := QCodigo.recordcount;

        //Fêmeas primíparas
        QCodigo.Close;
        QCodigo.SQL.text := 'select count(*) from parto,animal where andsaida is null '+
                            'and ancriatorio_crcodigo=:a and ancriatorio_crcodigo=pacriat_ancriatorio '+
                            'and anplaca=paanimal_anplaca and Paordem=1 and paanimal_anplaca not in (select distinct paanimal_anplaca '+
                            'from Parto where Paordem >=2)';
        QCodigo.Params[0].AsInteger := cod_criatorio;
        QCodigo.Open;
        an_prim := QCodigo.Fields[0].asstring;

        //Fêmeas pluríparas
        QCodigo.Close;
        QCodigo.SQL.text := 'select count(*) from parto,animal where andsaida is null '+
                            'and ancriatorio_crcodigo=:a and ancriatorio_crcodigo=pacriat_ancriatorio '+
                            'and anplaca=paanimal_anplaca and Paordem=1 and paanimal_anplaca in (select distinct paanimal_anplaca '+
                            'from Parto where Paordem >=2)';
        QCodigo.Params[0].AsInteger := cod_criatorio;
        QCodigo.Open;
        an_plur := QCodigo.Fields[0].asstring;

        //Animais machos em crescimento
        QCodigo.Close;
        QCodigo.SQL.text := 'select count(*) from animal where ancriatorio_crcodigo=:c and andsaida is null '+
                            'and anplaca<>'+#39+'N/A'+#39+' and ansexo='+#39+'Macho'+#39 ;
        QCodigo.Params[0].AsInteger := cod_criatorio;
        QCodigo.Open;
        machos_cresc := QCodigo.Fields[0].asinteger;

        //Quantidade de reprodutores ativos
        QCodigo.Close;
        QCodigo.SQL.Text := 'select count(*) from animal where ancriatorio_crcodigo=:c and andsaida is null and ansexo='+
                            #39+'Macho'+#39+' and anfinalidade='+#39+'Reprodutor'+#39;
        QCodigo.Params[0].AsInteger := cod_criatorio;
        QCodigo.open;

        an_machos := intToStr(machos_cresc - QCodigo.Fields[0].asinteger);
        an_reprod := QCodigo.Fields[0].asstring;

        TIndices.Close;

        //Se tudo está OK, então começo a inserir os dados no BD
        TAnimaisFin.open;
        TAnimaisFin.Append;
        TAnimaisFin.FieldByName('AnFinDataLanc').AsString := data;
        TAnimaisFin.FieldByName('AnAleitamento').AsString := an_aleit;
        TAnimaisFin.FieldByName('AnCrescimento').AsString := an_cresc;
        TAnimaisFin.FieldByName('AnLactacao').Asinteger := cabras_lactacao;
        TAnimaisFin.FieldByName('AnPrimiparas').AsString := an_prim;
        TAnimaisFin.FieldByName('AnPluriparas').AsString := an_plur;
        TAnimaisFin.FieldByName('AleitamentoPreco').Asfloat := 1;
        TAnimaisFin.FieldByName('CrescPreco').Asfloat := 1;
        TAnimaisFin.FieldByName('PrimPreco').Asfloat := 1;
        TAnimaisFin.FieldByName('PlurPreco').Asfloat := 1;
        TAnimaisFin.FieldByName('AnFincodigo_criat').AsInteger := cod_criatorio;
        TAnimaisFin.FieldByName('AnMachos').AsString := an_machos;
        TAnimaisFin.FieldByName('MachosPreco').Asfloat := 1;
        TAnimaisFin.FieldByName('AnReprod').AsString := an_reprod;
        TAnimaisFin.FieldByName('ReprodPreco').Asfloat := 1;

        TAnimaisFin.Post;
        TAnimaisFin.close;

//------------------------Insere despesas com salários----------------------------
        QCodigo2.Close;
        QCodigo2.SQL.Text := 'select * from RecursosHumanos where id_CriatorioFunc=:cod '
                          + ' and ((DtDesligFunc is null) or DtDesligFunc >=:hoje) ';

        QCodigo2.Params[0].AsDateTime := date;
        QCodigo2.Params[1].AsInteger := cod_criatorio;
        QCodigo2.Open;
        if not QCodigo2.IsEmpty then
        begin
           QCodigo2.First;
           while not QCodigo2.Eof do
           begin
//----------------------------------------------------------------------------------
              QCodigo4.Close;
              QCodigo4.SQL.Text := 'select id_despesa from Despesas where Decodigo_criat=:c '+
                        'and DeDataLanc=:dt and DeDescricao=:d';
              QCodigo4.Params[0].AsInteger := cod_criatorio;
              QCodigo4.Params[1].AsString := QCodigo2.FieldByName('DtEntradaFunc').AsString;
              QCodigo4.Params[2].AsString := 'Salário - ' + QCodigo2.FieldByName('NomeFunc').AsString;
              QCodigo4.Open;
              QCodigo4.First;
//----------------------------------------------------------------------------------
              QCodigo3.Close;
              QCodigo3.SQL.Text := 'select AtivDesp from AtivDesp where Atid_desp=:id';
              QCodigo3.Params[0].AsInteger := QCodigo4.Fields[0].AsInteger;
              QCodigo3.Open;
              QCodigo3.First;
//----------------------------------------------------------------------------------
              TDespesas.Open;
              TDespesas.Append;
              TDespesas.FieldByName('DeDescricao').AsString :=
              'Salário - ' + QCodigo2.FieldByName('NomeFunc').AsString;
              TDespesas.FieldByName('DeDataLanc').asDateTime := date;
              TDespesas.FieldByName('DeQuantidade').AsFloat := 1.0;
              TDespesas.FieldByName('Deid_unid').AsInteger := 25;
              TDespesas.FieldByName('DeValorTotal').AsFloat := QCodigo2.FieldByName('SalarioFunc').AsFloat;
              TDespesas.FieldByName('DeFormaPag').AsString := 'Dinheiro';
              TDespesas.FieldByName('Deid_centroDeCusto').Asinteger := 1;
              TDespesas.FieldByName('Decodigo_criat').AsInteger := Fprincipal.cod_criatorio;
              TDespesas.Post;
              TDespesas.Close;
//----------------------------------------------------------------------------------
              QCodigo4.Close;
              QCodigo4.SQL.Text := 'select id_despesa from Despesas where Decodigo_criat=:c '+
                        'and DeDataLanc=:dt and DeDescricao=:d and '+
                        'id_despesa not in (select Atid_desp from AtivDesp)';

              QCodigo4.Params[0].AsInteger := cod_criatorio;
              QCodigo4.Params[1].AsDateTime := date;
              QCodigo4.Params[2].AsString:= 'Salário - ' + QCodigo2.FieldByName('NomeFunc').AsString;
              QCodigo4.Open;
              QCodigo4.First;
//----------------------------------------------------------------------------------

              while not QCodigo3.Eof do
              begin
                 TAtivDesp.open;
                 TAtivDesp.Append;
                 TAtivDesp.FieldByName('AtivDesp').Asinteger := QCodigo3.Fields[0].asInteger;
                 TAtivDesp.FieldByName('Atid_desp').AsInteger := Qcodigo4.Fields[0].asinteger ;
                 TAtivDesp.Post;
                 TAtivDesp.Close;
                 QCodigo3.Next;
              end;
              QCodigo2.Next;
           end;
        end;

//----------------------------------------------------------------------------------

//------------------------realização de backup----------------------------
//Primeiro chamo o CapBackup, depois fecho o capricórnius
        winexec(Pchar('C:\Capricornius\CapBackup.exe'),1);
        PageEfetivo.Visible:=false; PageDesenvolvimento.Visible:=false;
        PageProducao.Visible:=false; PageGraficos.Visible:=false;
        PageIndices.Visible:=false; PageAgenda.Visible:=false;
        PanelProducao.Visible:=false;  PanelEfetivo.Visible:=false; PanelAgenda.Visible:=false;
        PanelDesenvolvimento.Visible:=false; PanelGraficos.Visible:=false;
        PageReproducao.Visible:=false; PanelReproducao.Visible:=false; PanelFinanca.Visible:=false;
        PanelRelatorios.Visible := false; PanelSanidade.Visible := false;
        PageSenha.Visible:=false; PageFinanca.Visible:=false;
        FPrincipal.close;
//---------------------------------------------------------------------------

      end
      else
      begin
      
        d := Retornadia(data);
        Qmanipula.Close;
        Qmanipula.SQL.text := 'select AnFinDataLanc from AnimaisFinanca where AnFincodigo_criat=:c '+
                              'and AnFinDataLanc>=:dmin and AnFinDataLanc<=:dmax';
        Qmanipula.Params[0].AsInteger := cod_criatorio;
        Qmanipula.Params[1].asstring := dateToStr(date-(d-1));
        Qmanipula.Params[2].Asstring := dateToStr(date);
        Qmanipula.Open;

        if Qmanipula.IsEmpty then
        begin
           TIndices.Open;
           if indice_zootecnico = 'N' then
             TIndices.Locate('Cod_criatorio', -2, [])
           else if indice_zootecnico = 'P' then
             TIndices.Locate('Cod_criatorio', -1, [])
           else if indice_zootecnico = 'A' then
             TIndices.Locate('Cod_criatorio', cod_criatorio, []);

           // Fêmeas em aleitamento
           QCodigo.Close;
           QCodigo.SQL.text := 'select count(*) from animal where ancriatorio_crcodigo=:c and andsaida is null and '+
                               'ansexo='#39+'Fêmea'+#39+' and andnascimento >=:dt1';
           QCodigo.Params[0].AsInteger := cod_criatorio;
           QCodigo.Params[1].asstring := datetostr(date - Tindices.fieldbyname('idade_desmama_femea').AsInteger);
           QCodigo.Open;
           an_aleit := QCodigo.Fields[0].asstring;

           //Fêmeas até idade reprodutiva
           QCodigo.Close;
           QCodigo.SQL.text := 'select count(*) from animal where ancriatorio_crcodigo=:c and andsaida is null and '+
                               'ansexo='#39+'Fêmea'+#39+' and (andnascimento >=:dt1 and andnascimento <:dt2)';
           QCodigo.Params[0].AsInteger := cod_criatorio;
           QCodigo.Params[1].asstring := datetostr(date - Tindices.fieldbyname('idade_min_acasalamento').AsInteger);
           QCodigo.Params[2].asstring := datetostr(date - Tindices.fieldbyname('idade_desmama_femea').AsInteger);
           QCodigo.Open;
           cresc1 := QCodigo.Fields[0].asinteger;

           //Fêmeas nulíparas em condições de acasalamento
           QCodigo.Close;
           QCodigo.SQL.text := 'select count(*) from animal where ancriatorio_crcodigo=:c and andsaida is null and '+
                               'ansexo='#39+'Fêmea'+#39+' and andnascimento <:dt1 and '+
                               'anplaca not in (select distinct paanimal_anplaca from parto)';
           QCodigo.Params[0].AsInteger := cod_criatorio;
           QCodigo.Params[1].asstring := datetostr(date - Tindices.fieldbyname('idade_min_acasalamento').AsInteger);
           QCodigo.Open;
           cresc2 := QCodigo.Fields[0].asinteger;

           //Cabritas em crescimento
           an_cresc := IntToStr(cresc1 + cresc2);

           //Cabras em lactacao
           QCodigo.Close;
           QCodigo.SQL.text := 'select anplaca, padatapar from animal, parto where ancriatorio_crcodigo=:c '+
                               'and Andsaida is null and ancriatorio_crcodigo=pacriat_ancriatorio and '+
                               'anplaca=paanimal_anplaca and Padatenclac is null';
           QCodigo.params[0].asinteger := cod_criatorio;
           QCodigo.Open;
           cabras_lactacao := QCodigo.recordcount;

           //Fêmeas primíparas
           QCodigo.Close;
           QCodigo.SQL.text := 'select count(*) from parto,animal where andsaida is null '+
                               'and ancriatorio_crcodigo=:a and ancriatorio_crcodigo=pacriat_ancriatorio '+
                               'and anplaca=paanimal_anplaca and Paordem=1 and paanimal_anplaca not in (select distinct paanimal_anplaca '+
                               'from Parto where Paordem >=2)';
           QCodigo.Params[0].AsInteger := cod_criatorio;
           QCodigo.Open;
           an_prim := QCodigo.Fields[0].asstring;

          //Fêmeas pluríparas
           QCodigo.Close;
           QCodigo.SQL.text := 'select count(*) from parto,animal where andsaida is null '+
                               'and ancriatorio_crcodigo=:a and ancriatorio_crcodigo=pacriat_ancriatorio '+
                               'and anplaca=paanimal_anplaca and Paordem=1 and paanimal_anplaca in (select distinct paanimal_anplaca '+
                               'from Parto where Paordem >=2)';
           QCodigo.Params[0].AsInteger := cod_criatorio;
           QCodigo.Open;
           an_plur := QCodigo.Fields[0].asstring;

           //Animais machos em crescimento
           QCodigo.Close;
           QCodigo.SQL.text := 'select count(*) from animal where ancriatorio_crcodigo=:c and andsaida is null '+
                               'and anplaca<>'+#39+'N/A'+#39+' and ansexo='+#39+'Macho'+#39 ;
           QCodigo.Params[0].AsInteger := cod_criatorio;
           QCodigo.Open;
           machos_cresc := QCodigo.Fields[0].asinteger;

           //Quantidade de reprodutores ativos
           QCodigo.Close;
           QCodigo.SQL.Text := 'select count(*) from animal where ancriatorio_crcodigo=:c and andsaida is null and ansexo='+
                               #39+'Macho'+#39+' and anfinalidade='+#39+'Reprodutor'+#39;
           QCodigo.Params[0].AsInteger := cod_criatorio;
           QCodigo.open;

           an_machos := intToStr(machos_cresc - QCodigo.Fields[0].asinteger);
           an_reprod := QCodigo.Fields[0].asstring;

           TIndices.Close;

           //Se tudo está OK, então começo a inserir os dados no BD
           TAnimaisFin.open;
           TAnimaisFin.Append;
           TAnimaisFin.FieldByName('AnFinDataLanc').AsString := data;
           TAnimaisFin.FieldByName('AnAleitamento').AsString := an_aleit;
           TAnimaisFin.FieldByName('AnCrescimento').AsString := an_cresc;
           TAnimaisFin.FieldByName('AnLactacao').Asinteger := cabras_lactacao;
           TAnimaisFin.FieldByName('AnPrimiparas').AsString := an_prim;
           TAnimaisFin.FieldByName('AnPluriparas').AsString := an_plur;
           TAnimaisFin.FieldByName('AleitamentoPreco').Asfloat := 1;
           TAnimaisFin.FieldByName('CrescPreco').Asfloat := 1;
           TAnimaisFin.FieldByName('PrimPreco').Asfloat := 1;
           TAnimaisFin.FieldByName('PlurPreco').Asfloat := 1;
           TAnimaisFin.FieldByName('AnFincodigo_criat').AsInteger := cod_criatorio;
           TAnimaisFin.FieldByName('AnMachos').AsString := an_machos;
           TAnimaisFin.FieldByName('MachosPreco').Asfloat := 1;
           TAnimaisFin.FieldByName('AnReprod').AsString := an_reprod;
           TAnimaisFin.FieldByName('ReprodPreco').Asfloat := 1;

           TAnimaisFin.Post;
           TAnimaisFin.close;
//------------------------Insere despesas com salários----------------------------
        QCodigo2.Close;
        QCodigo2.SQL.Text :=  'select * from RecursosHumanos where id_CriatorioFunc=:cod '
                          + ' and ((DtDesligFunc is null) or DtDesligFunc >=:hoje) ';

        QCodigo2.Params[0].AsDateTime := date;
        QCodigo2.Params[1].AsInteger := cod_criatorio;
        QCodigo2.Open;
        if not QCodigo2.IsEmpty then
        begin
           QCodigo2.First;
           while not QCodigo2.Eof do
           begin
//----------------------------------------------------------------------------------
              QCodigo4.Close;
              QCodigo4.SQL.Text := 'select id_despesa from Despesas where Decodigo_criat=:c '+
                        'and DeDataLanc=:dt and DeDescricao=:d';
              QCodigo4.Params[0].AsInteger := cod_criatorio;
              QCodigo4.Params[1].AsString := QCodigo2.FieldByName('DtEntradaFunc').AsString;
              QCodigo4.Params[2].AsString := 'Salário - ' + QCodigo2.FieldByName('NomeFunc').AsString;
              QCodigo4.Open;
              QCodigo4.First;
//----------------------------------------------------------------------------------
              QCodigo3.Close;
              QCodigo3.SQL.Text := 'select AtivDesp from AtivDesp where Atid_desp=:id';
              QCodigo3.Params[0].AsInteger := QCodigo4.Fields[0].AsInteger;
              QCodigo3.Open;
              QCodigo3.First;
//----------------------------------------------------------------------------------
              TDespesas.Open;
              TDespesas.Append;
              TDespesas.FieldByName('DeDescricao').AsString :=
              'Salário - ' + QCodigo2.FieldByName('NomeFunc').AsString;
              TDespesas.FieldByName('DeDataLanc').asDateTime := date;
              TDespesas.FieldByName('DeQuantidade').AsFloat := 1.0;
              TDespesas.FieldByName('Deid_unid').AsInteger := 25;
              TDespesas.FieldByName('DeValorTotal').AsFloat := QCodigo2.FieldByName('SalarioFunc').AsFloat;
              TDespesas.FieldByName('DeFormaPag').AsString := 'Dinheiro';
              TDespesas.FieldByName('Deid_centroDeCusto').Asinteger := 1;
              TDespesas.FieldByName('Decodigo_criat').AsInteger := Fprincipal.cod_criatorio;
              TDespesas.Post;
              TDespesas.Close;
//----------------------------------------------------------------------------------
              QCodigo4.Close;
              QCodigo4.SQL.Text := 'select id_despesa from Despesas where Decodigo_criat=:c '+
                        'and DeDataLanc=:dt and DeDescricao=:d and '+
                        'id_despesa not in (select Atid_desp from AtivDesp)';

              QCodigo4.Params[0].AsInteger := cod_criatorio;
              QCodigo4.Params[1].AsDateTime := date;
              QCodigo4.Params[2].AsString:= 'Salário - ' + QCodigo2.FieldByName('NomeFunc').AsString;
              QCodigo4.Open;
              QCodigo4.First;
//----------------------------------------------------------------------------------

              while not QCodigo3.Eof do
              begin
                 TAtivDesp.open;
                 TAtivDesp.Append;
                 TAtivDesp.FieldByName('AtivDesp').Asinteger := QCodigo3.Fields[0].asInteger;
                 TAtivDesp.FieldByName('Atid_desp').AsInteger := Qcodigo4.Fields[0].asinteger ;
                 TAtivDesp.Post;
                 TAtivDesp.Close;
                 QCodigo3.Next;
              end;
              QCodigo2.Next;
           end;
        end;

//----------------------------------------------------------------------------------

//------------------------Área de Realização de Backup----------------------------
           winexec(Pchar('C:\Capricornius\CapBackup.exe'),1);
           PageEfetivo.Visible:=false; PageDesenvolvimento.Visible:=false;
           PageProducao.Visible:=false; PageGraficos.Visible:=false;
           PageIndices.Visible:=false; PageAgenda.Visible:=false;
           PanelProducao.Visible:=false;  PanelEfetivo.Visible:=false; PanelAgenda.Visible:=false;
           PanelDesenvolvimento.Visible:=false; PanelGraficos.Visible:=false;
           PageReproducao.Visible:=false; PanelReproducao.Visible:=false; PanelFinanca.Visible:=false;
           PanelRelatorios.Visible := false; PanelSanidade.Visible := false;
           PageSenha.Visible:=false; PageFinanca.Visible:=false;
           FPrincipal.close;
//-------------------------------------------------------------------------------

        end;
      end;
      //Verifica as estações de monta
      if TCriatorio.fieldbyname('Crindicezootecnico').asstring <> 'N' then
      begin
        //Cadastra Estacoes de Monta
        data := datetostr(Date);
        Qcodigo.Close;
        Qcodigo.SQL.Clear;
        Qcodigo.SQL.Add('Select Duracao from EstacoesMonta where Cod_criatorio=:c and '+
                        'Dia_inicio>=:d1 and Dia_inicio<=:d2 and Mes_inicio=:m');

        if (TCriatorio.fieldbyname('Crindicezootecnico').asstring = 'A') then
          Qcodigo.Params[0].AsInteger := cod_criatorio
        else if (TCriatorio.fieldbyname('Crindicezootecnico').asstring = 'P') then
          Qcodigo.Params[0].AsInteger := -1
        else
          Qcodigo.Params[0].asinteger := -2;

        i := Retornadia(data) - 5;
        if i < 1 then i := 1;
        Qcodigo.Params[1].AsInteger := i;
        i := Retornadia(data) + 5;
        if i > 31 then i := 31;
        Qcodigo.Params[2].AsInteger := i;
        Qcodigo.params[3].AsInteger := Retornames(data);
        Qcodigo.Prepare;
        Qcodigo.Open;
        //Consulta para verificar se já foi inserido o alerta sobre as estacoes de monta
        Qcodigo2.Close;
        Qcodigo2.SQL.Text := 'select cod_criatorio from Agenda where cod_criatorio=:c and descricao like '+#39+
                             '%Estacao de Monta%'+#39;
        Qcodigo2.Params[0].AsInteger := cod_criatorio;
        Qcodigo2.Prepare;
        Qcodigo2.Open;
        if not Qcodigo.IsEmpty and Qcodigo2.IsEmpty then
        begin
          i := 0;
          while i < Qcodigo.Fields[0].AsInteger do
          begin
            TAgenda.Open;
            try
              TAgenda.Insert;
              TAgenda.FieldByName('Cod_criatorio').AsInteger := cod_criatorio;
              TAgenda.FieldByName('Data').Asstring := datetostr(Date + i);
              TAgenda.FieldByName('Tipo').asstring := 'Sistema';
              TAgenda.FieldByName('Status').asstring := 'Nao Executada';
              TAgenda.FieldByName('Descricao').asstring := 'De '+datetostr(date)+' a '+
                                             datetostr(date+Qcodigo.Fields[0].asinteger)+' Estacao de Monta';
              TAgenda.post;
            except
            end;
            TAgenda.Close;
            i := i + 6;
          end;
        end;
      end;
      Tcriatorio.Close;

      //Passa os cios positivos ou a confirmar pra negativos, se preciso for
      Qmanipula.Close;
      Qmanipula.SQL.Text := '(SELECT cianimal_anplaca, cidata FROM Animal, Cio WHERE Ancriatorio_Crcodigo=:c1 AND '+
                           'Ancriatorio_Crcodigo=Cicriat_Ancriatorio AND Anplaca=Cianimal_Anplaca AND '+
                           'Ciprenha<>'+#39+'Negativa'+#39+' AND not exists '+
                           '(select paanimal_anplaca from parto where pacriat_ancriatorio=ancriatorio_crcodigo AND '+
                           'paanimal_anplaca=cianimal_anplaca) GROUP BY cianimal_anplaca, cidata '+
                           'HAVING (max(cidata)+165)<#'+FFiltro.converte_data(datetostr(date))+'#) UNION '+
                           '(SELECT cianimal_anplaca, cidata FROM Animal, Cio, Parto WHERE Ancriatorio_Crcodigo=:c2 AND '+
                           'Ancriatorio_Crcodigo=Cicriat_Ancriatorio AND Ancriatorio_Crcodigo=Pacriat_Ancriatorio AND '+
                           'Anplaca=Cianimal_Anplaca AND Anplaca=Paanimal_Anplaca AND '+
                           'Ciprenha<>'+#39+'Negativa'+#39+' GROUP BY cianimal_anplaca, cidata '+
                           'HAVING (max(cidata)+165)<#'+FFiltro.converte_data(datetostr(date))+'# AND max(Padatapar)<(max(cidata)+135))';

      Qmanipula.Params[0].AsInteger := cod_criatorio;
      Qmanipula.Params[1].Asinteger := cod_criatorio;
      Qmanipula.Open;
      Qmanipula.First;
      while not Qmanipula.Eof do
      begin
        //Cadastra na agenda os animais que tiveram seu cio alterado para negativo
        TAgenda.open;
        try
          TAgenda.Insert;
          TAgenda.FieldByName('Cod_criatorio').asinteger := cod_criatorio;
          TAgenda.FieldByName('Data').asstring := datetostr(date);
          TAgenda.FieldByName('Tipo').asstring := 'Sistema';
          TAgenda.FieldByName('Status').asstring := 'Executada';
          TAgenda.FieldByName('Descricao').asstring := 'A cabra '+Qmanipula.Fields[0].AsString+' teve a situação de cio alterada'
          +' para NEGATIVA, pois não houve data de parto correspondente, após o limite de 165 dias, da seguinte data de cio: '
          +Qmanipula.Fields[1].Asstring;
          TAgenda.Post;
        except
        end;
        TAgenda.close;
        //E troca seu valor na tabela Cio.
        Qcodigo.Close;
        Qcodigo.SQL.Text := 'Update Cio Set ciprenha='+#39'Negativa'#39+' where cicriat_ancriatorio=:c and '+
                            'cianimal_anplaca=:pl and cidata=:dt';
        Qcodigo.Params[0].AsInteger := cod_criatorio;
        Qcodigo.Params[1].AsString := Qmanipula.Fields[0].AsString;
        Qcodigo.Params[2].asstring := Qmanipula.Fields[1].asstring;
        Qcodigo.ExecSQL;
        Qmanipula.Next;
      end;
      Qmanipula.Close;

      //Agendamendo do backup
      if (dayof(date) = 1) or (dayof(date) = 15) then
      begin
        TAgenda.open;
        try
          TAgenda.Insert;
          TAgenda.FieldByName('Cod_criatorio').asinteger := cod_criatorio;
          TAgenda.FieldByName('Data').asstring := datetostr(date);
          TAgenda.FieldByName('Tipo').asstring := 'Sistema';
          TAgenda.FieldByName('Status').asstring := 'Não Executada';
          TAgenda.FieldByName('Descricao').asstring := 'Recomendamos que se faça um backup do banco de dados '+
                                                       'do sistema utilizando a ferramenta "Cópia de seguranca" '+
                                                       'caso este ainda não tenha sido realizado';
          TAgenda.Post;
        except
        end;
        TAgenda.close;
      end;

      // Coloca os animais machos no ComboBox
      ComboBox3.clear;
      ComboBox37.clear;
      Qanimal.close;
      Qanimal.sql.text := 'select Anplaca from Animal where Ancriatorio_Crcodigo=:c'
                     +' and Ansexo=:sx and Anfinalidade=:fd order by Anplaca asc';
      Qanimal.Params[0].AsInteger := cod_criatorio;
      Qanimal.Params[1].AsString := 'Macho';
      Qanimal.Params[2].AsString := 'Reprodutor';
      Qanimal.open;
      Qanimal.first;

      while not Qanimal.eof do
      begin
        ComboBox3.Items.Add(Qanimal.Fields[0].asstring);
        ComboBox37.Items.Add(Qanimal.Fields[0].asstring);
        Qanimal.next;
      end;

      // Coloca os animais femeas no ComboBox
      ComboBox36.clear;
      Qanimal.close;
      Qanimal.sql.text := 'select Anplaca from Animal where Ancriatorio_Crcodigo=:c and Ansexo=:sx order by Anplaca asc';
      Qanimal.Params[0].AsInteger := cod_criatorio;
      Qanimal.Params[1].AsString := 'Fêmea';
      Qanimal.open;

      while not Qanimal.eof do
      begin
        ComboBox36.Items.Add(Qanimal.Fields[0].asstring);
        Qanimal.next;
      end;

      //Verifica se o grau de sangue precisa ser recalculado e manda um alerta ao usuario se preciso for.
      Qcodigo2.Close;
      Qcodigo2.SQL.Text := 'select ocquant from ocorre where occriat_ancriatorio=:c and ocanimal_anplaca=:p';
      Qcodigo2.params[0].AsInteger := cod_criatorio;
      Qcodigo2.Params[1].AsString := 'N/A';
      Qcodigo2.Open;
      if not Qcodigo2.IsEmpty then
      begin
        if MessageDlgNO('A composição racial do rebanho foi alterada e precisa ser Recalculada. Deseja Recalcula-la agora?',
                                 mtconfirmation, [mbyes, mbno], 0) = mryes then
        begin
          timer1.enabled := true;
        end;
      end;

      //Faz a atualizacao pra saber qual foi o ultimo criatorio utilizado
      Qcodigo.Close;
      Qcodigo.SQL.Text := 'Update Criatorio set crultimousado=0';
      Qcodigo.ExecSQL;
      Qcodigo.Close;
      Qcodigo.SQL.Text := 'Update Criatorio set crultimousado=1 where crnome='+#39+FEntrada.combobox1.Text+#39;
      Qcodigo.ExecSQL;
      FPrincipal.fechar_direto := false;
      Fentrada.close;
    end;
    image5.Visible := false;
    if screen.Width > 800 then
      statusbar29.Visible := true;
    if screen.Width > 800 then
    begin
      //Redimensiona o Formulario Principal
      Treeview1.Top := ((screen.Height - 600) div 2) + 46;
      Treeview1.Left := ((screen.Width - 800) div 2);
      PageAgenda.Top := ((screen.Height - 600) div 2) + 46;
      PageAgenda.Left := ((screen.Width - 800) div 2) + 282;
      PageEfetivo.Top := ((screen.Height - 600) div 2) + 46;
      PageEfetivo.Left := ((screen.Width - 800) div 2) + 282;
      PageIndices.Top := ((screen.Height - 600) div 2) + 46;
      PageIndices.Left := ((screen.Width - 800) div 2) + 282;
      PageDesenvolvimento.Top := ((screen.Height - 600) div 2) + 46;
      PageDesenvolvimento.Left := ((screen.Width - 800) div 2) + 282;
      PageGraficos.Top := ((screen.Height - 600) div 2) + 46;
      PageGraficos.Left := ((screen.Width - 800) div 2) + 282;
      PageProducao.Top := ((screen.Height - 600) div 2) + 46;
      PageProducao.Left := ((screen.Width - 800) div 2) + 282;
      PageReproducao.Top := ((screen.Height - 600) div 2) + 46;
      PageReproducao.Left := ((screen.Width - 800) div 2) + 282;
      PageSenha.Top := ((screen.Height - 600) div 2) + 46;
      PageSenha.Left := ((screen.Width - 800) div 2) + 282;
      PageFinanca.Top := ((screen.Height - 600) div 2) + 46;
      PageFinanca.Left := ((screen.Width - 800) div 2) + 282;
      PanelAgenda.Top := ((screen.Height - 600) div 2);
      PanelAgenda.Left := ((screen.Width - 800) div 2) + 282;
      PanelEfetivo.Top := ((screen.Height - 600) div 2);
      PanelEfetivo.Left := ((screen.Width - 800) div 2) + 282;
      PanelDesenvolvimento.Top := ((screen.Height - 600) div 2);
      PanelDesenvolvimento.Left := ((screen.Width - 800) div 2) + 282;
      PanelGraficos.Top := ((screen.Height - 600) div 2);
      PanelGraficos.Left := ((screen.Width - 800) div 2) + 282;
      PanelProducao.Top := ((screen.Height - 600) div 2);
      PanelProducao.Left := ((screen.Width - 800) div 2) + 282;
      PanelReproducao.Top := ((screen.Height - 600) div 2);
      PanelReproducao.Left := ((screen.Width - 800) div 2) + 282;
      PanelFinanca.Top := ((screen.Height - 600) div 2);
      PanelFinanca.Left := ((screen.Width - 800) div 2) + 282;
      Statusbar29.Visible := true;
    end
    else
    begin
      SpeedButton1.height := 22;
      SpeedButton2.height := 22;
      speedbutton3p.Height := 22;
      SpeedButton62.height := 22;
      SpeedButton63.height := 22;
      SpeedButton64.height := 22;
      SpeedButton65.height := 22;
      SpeedButton66.height := 22;
      SpeedButton67.height := 22;
      SpeedButton71.height := 22;
      SpeedButton72.height := 22;
      SpeedButton73.height := 22;
      SpeedButton74.height := 22;
      SpeedButton75.height := 22;
      SpeedButton77.height := 22;
      SpeedButton78.height := 22;
      SpeedButton82.height := 22;
      SpeedButton83.height := 22;
      SpeedButton84.height := 22;
      SpeedButton97.height := 22;
      SpeedButton98.height := 22;
      SpeedButton99.height := 22;
      SpeedButton100.height := 22;
      SpeedButton101.height := 22;
      SpeedButton102.height := 22;
      SpeedButton103.height := 22;
      SpeedButton104.height := 22;
      SpeedButton105.height := 22;
      //SpeedButton3.height := 22;
    //  SpeedButton4.height := 22;
     // SpeedButton5.height := 22;
      //SpeedButton6.height := 22;
      //SpeedButton7.height := 22;
      btnpanrel1.Height := 22;
      btnpanrel2.Height := 22;
      btnpanrel3.Height := 22;
      btnpanrel4.Height := 22;
      btnpanrel5.Height := 22;
      btnpansan1.Height := 22;
      btnpansan2.Height := 22;
      btnpansan3.Height := 22;
      CS.height := 22;
      RD.height := 22;
      PanelEfetivo.Height := 23;
      PanelEfetivo.Left := 274;
      PanelAgenda.Height := 23;
      PanelAgenda.Left := 274;
      PanelProducao.Height := 23;
      PanelProducao.Left := 274;
      PanelReproducao.Height := 23;
      PanelReproducao.Left := 274;
      PanelDesenvolvimento.Height := 23;
      PanelDesenvolvimento.Left := 274;
      PanelRelatorios.Height := 23;
      PanelRelatorios.Left := 274;
      PanelSanidade.Height := 23;
      PanelSanidade.Left := 274;
      PanelGraficos.Height := 23;
      PanelGraficos.Left := 274;
      PanelFinanca.Height := 23;
      PanelFinanca.Left := 274;
      PageAgenda.Top := 22;
      PageAgenda.Left := 274;
      PageEfetivo.Top := 22;
      PageEfetivo.Left := 274;
      PageIndices.Top := 22;
      PageIndices.Left := 274;
      PageDesenvolvimento.Top := 22;
      PageDesenvolvimento.Left := 274;
      PageGraficos.Top := 22;
      PageGraficos.Left := 274;
      PageProducao.Top := 22;
      PageProducao.Left := 274;
      PageReproducao.Top := 22;
      PageReproducao.Left := 274;
      PageSenha.Top := 22;
      PageSenha.Left := 274;
      PageFinanca.Top := 22;
      PageFinanca.Left := 274;
      Treeview1.Width := 274;
      Treeview1.Top := 22;
    end;
    Treeview1.FullCollapse;
    //Caso o timer esteja acionado, ou seja, caso o usuario tenha aceitado para se
    //calcular o grau de sangue no inicio do programa ele vai para a tela do recalculo
    //e faz o calculo do grau de sangue, caso contrario vai para a pagina da agenda.
    if Timer1.Enabled then
      TreeView1.Selected := TreeView1.Items[2]
    else
      TreeView1.Selected := TreeView1.Items[46];
    //Mostro o treeview
    TreeView1.Visible := true;
  end;
end;

procedure TFentrada.SpeedButton1Click(Sender: TObject);
var test : String;
begin
  if ComboBox1.ItemIndex<>-1 then
  begin
    FValidar := TFValidar.Create(Application);
    FValidar.Showmodal;
    FValidar.free;

    {FcriatorioAtual:=TFcriatorioAtual.Create(Application);
    FcriatorioAtual.Edit1.text:=inttostr(ComboBox1.ItemIndex + 1);
    FcriatorioAtual.Showmodal;
    FcriatorioAtual.free;
    FormShow(Application); }
  end
  else
  begin
    Showmessage('Escolha um criatório');
    ComboBox1.setfocus;
  end;
end;

procedure TFentrada.SpeedButton2Click(Sender: TObject);
begin
  Fcriatorio:=TFcriatorio.Create(Application);
  Fcriatorio.showmodal;
  Fcriatorio.free;
  FormShow(Application);
end;

procedure TFentrada.SpeedButton4Click(Sender: TObject);
begin
  Fentrada.Close;
end;

procedure TFentrada.FormShow(Sender: TObject);
var ultimo: smallint;
begin
  ultimo := 0;
  with FDatamodule do
  begin
    ComboBox1.clear;
    Qcodigo.close;
    Qcodigo.sql.text := 'select Crcodigo, Crsenha, Crnome, Crultimousado from Criatorio where crcodigo>0 order by Crcodigo desc';
    Qcodigo.open;
    if not Qcodigo.IsEmpty then
    begin
      Qcodigo.First;
      while not Qcodigo.Eof do
      begin
        combobox1.Items.Insert(0, Qcodigo.Fields[2].asstring);
        if Qcodigo.Fields[3].AsInteger <> 0 then
        begin
          ultimo := Qcodigo.Fields[0].AsInteger;
          senha := Qcodigo.Fields[1].AsString;
        end;
        Qcodigo.Next;
      end;
    end;
  end;
  if ultimo <> 0 then
  begin
    combobox1.ItemIndex := ultimo - 1;
    edit1.SetFocus;
  end;
  combobox1click(sender);
end;

procedure TFentrada.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if FPrincipal.fechar_direto then
    FPrincipal.Close;
end;

end.
