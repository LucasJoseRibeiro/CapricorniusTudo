unit UcriatorioAtual;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Grids, DBGrids, ExtCtrls, Db;

type
  TFcriatorioAtual = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label22: TLabel;
    Edit1: TEdit;
    Panel1: TPanel;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label23: TLabel;
    Edit4: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    SpeedButton91: TSpeedButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label5: TLabel;
    Label18: TLabel;
    Edit16: TEdit;
    Label28: TLabel;
    Edit18: TEdit;
    Edit17: TEdit;
    Label29: TLabel;
    RadioButton3: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit25KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit26KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit27KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit10KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit11KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit12KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit13KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit14KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit15KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure SpeedButton91Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure RadioButton2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit23Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FcriatorioAtual: TFcriatorioAtual;

implementation

uses Udatamodule;


{$R *.DFM}



procedure TFcriatorioAtual.FormShow(Sender: TObject);
var i:smallint;
begin
  with FDataModule do
  begin
    Qcodigo.close;
    Qcodigo.sql.text := 'select * from Criatorio where Crcodigo=:cod';
    Qcodigo.Params[0].Asinteger := Strtoint(Edit1.text);
    Qcodigo.open;
    if not Qcodigo.IsEmpty then
    begin
      // Preenche os campos do formulario
      Edit2.text:=Qcodigo.FieldByName('Crnome').asstring;
      Edit3.text:=Qcodigo.FieldByName('Crproprietario').asstring;
      Edit4.text:=Qcodigo.FieldByName('Crnome').asstring;
      Edit5.text:=Qcodigo.FieldByName('Crendereco').asstring;
      Edit6.text:=Qcodigo.FieldByName('Crcep').asstring;
      Edit7.text:=Qcodigo.FieldByName('Crmunic').asstring;
      Edit8.text:=Qcodigo.FieldByName('Crpostal').asstring;
      Edit9.text:=Qcodigo.FieldByName('Crfone').asstring;
      Edit10.text:=Qcodigo.FieldByName('Crcorrespc').asstring;
      Edit11.text:=Qcodigo.FieldByName('Crbairroc').asstring;
      Edit12.text:=Qcodigo.FieldByName('Crcidadec').asstring;
      Edit13.text:=Qcodigo.FieldByName('Crcepc').asstring;
      Edit14.text:=Qcodigo.FieldByName('Crfonec').asstring;
      Edit15.text:=Qcodigo.FieldByName('Crfaxc').asstring;
      Edit19.text:=Qcodigo.FieldByName('Crbairro').asstring;
      Edit20.text:=Qcodigo.FieldByName('Crcgc').asstring;
      Edit21.text:=Qcodigo.FieldByName('Crinscest').asstring;
      Edit22.text:=Qcodigo.FieldByName('Crnumassoc').asstring;
      Edit23.text:=Qcodigo.FieldByName('Crvalorsufafix').asstring;
      Edit24.text:=Qcodigo.FieldByName('Crcelular').asstring;
      Edit25.text:=Qcodigo.FieldByName('Crfax').asstring;
      Edit26.text:=Qcodigo.FieldByName('Cremail').asstring;
      Edit27.text:=Qcodigo.FieldByName('Crhomepage').asstring;

      if Qcodigo.FieldByName('Crsufixoafixo').asstring='A' then
        RadioButton1.Checked:=true
      else if Qcodigo.FieldByName('Crsufixoafixo').asstring='S' then
        RadioButton2.Checked:=true
      else
        Radiobutton3.Checked := true;

      i:=ComboBox1.Items.IndexOf(Qcodigo.FieldByName('Crestado').asstring);
      if i<>-1 then ComboBox1.ItemIndex:=i;

      i:=ComboBox2.Items.IndexOf(Qcodigo.FieldByName('Crestadoc').asstring);
      if i<>-1 then ComboBox2.ItemIndex:=i;
      Edit22.setfocus;
    end;
  end;
end;


procedure TFcriatorioAtual.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit22.setfocus;
end;

procedure TFcriatorioAtual.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit22.setfocus;
end;

procedure TFcriatorioAtual.Edit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then RadioButton1.setfocus
  else if(Key=VK_DOWN) then Edit18.setfocus
  else if(Key=VK_UP) then Edit1.setfocus;
end;

procedure TFcriatorioAtual.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit23.setfocus;
end;

procedure TFcriatorioAtual.Edit23KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit18.SetFocus
  else if (Key=VK_DOWN) then Edit17.setfocus
  else if(Key=VK_UP) then Edit1.setfocus;
end;

procedure TFcriatorioAtual.Edit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)then Edit17.setfocus
  else if (Key=VK_DOWN) then Edit2.setfocus
  else if(Key=VK_UP) then Edit22.setfocus;
end;

procedure TFcriatorioAtual.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit3.setfocus
  else if(Key=VK_UP) then Edit22.setfocus;
end;

procedure TFcriatorioAtual.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit5.setfocus
  else if(Key=VK_UP) then Edit2.setfocus;
end;

procedure TFcriatorioAtual.Edit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit6.setfocus
  else if(Key=VK_DOWN) then Edit7.setfocus
  else if(Key=VK_UP) then Edit3.setfocus;
end;

procedure TFcriatorioAtual.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit7.setfocus
  else if(Key=VK_DOWN) then ComboBox1.setfocus
  else if(Key=VK_UP) then Edit3.setfocus;
end;

procedure TFcriatorioAtual.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit19.setfocus
  else if(Key=VK_DOWN) then Edit8.setfocus
  else if(Key=VK_UP) then Edit5.setfocus;
end;

procedure TFcriatorioAtual.Edit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then ComboBox1.setfocus
  else if(Key=VK_DOWN) then Edit24.setfocus
  else if(Key=VK_UP) then Edit5.setfocus;
end;

procedure TFcriatorioAtual.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit8.setfocus;
end;

procedure TFcriatorioAtual.Edit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit9.setfocus
  else if(Key=VK_DOWN) then Edit20.setfocus
  else if(Key=VK_UP) then Edit7.setfocus;
end;

procedure TFcriatorioAtual.Edit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit24.setfocus
  else if(Key=VK_DOWN) then Edit20.setfocus
  else if(Key=VK_UP) then Edit7.setfocus;
end;

procedure TFcriatorioAtual.Edit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit25.setfocus
  else if(Key=VK_DOWN) then Edit21.setfocus
  else if(Key=VK_UP) then Edit19.setfocus;
end;

procedure TFcriatorioAtual.Edit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit20.setfocus
  else if(Key=VK_DOWN) then Edit21.setfocus
  else if(Key=VK_UP) then ComboBox1.setfocus;
end;

procedure TFcriatorioAtual.Edit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit21.setfocus
  else if(Key=VK_DOWN) then Edit26.setfocus
  else if(Key=VK_UP) then Edit8.setfocus;
end;

procedure TFcriatorioAtual.Edit21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit26.setfocus
  else if(Key=VK_DOWN) then Edit27.setfocus
  else if(Key=VK_UP) then Edit25.setfocus;
end;

procedure TFcriatorioAtual.Edit26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit27.setfocus
  else if(Key=VK_DOWN) then Edit10.setfocus
  else if(Key=VK_UP) then Edit20.setfocus;
end;

procedure TFcriatorioAtual.Edit27KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit10.setfocus
  else if(Key=VK_UP) then Edit21.setfocus;
end;

procedure TFcriatorioAtual.Edit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit11.setfocus
  else if(Key=VK_UP) then Edit26.setfocus;
end;

procedure TFcriatorioAtual.Edit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit12.setfocus
  else if(Key=VK_DOWN) then ComboBox2.setfocus
  else if(Key=VK_UP) then Edit10.setfocus;
end;

procedure TFcriatorioAtual.Edit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then ComboBox2.setfocus
  else if(Key=VK_DOWN) then Edit14.setfocus
  else if(Key=VK_UP) then Edit10.setfocus;
end;

procedure TFcriatorioAtual.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit13.setfocus;
end;

procedure TFcriatorioAtual.Edit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit14.setfocus
  else if(Key=VK_UP) then Edit11.setfocus;
end;

procedure TFcriatorioAtual.Edit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit15.setfocus
  else if(Key=VK_UP) then Edit12.setfocus;
end;

procedure TFcriatorioAtual.Edit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if(Key=VK_UP) then Edit12.setfocus;
end;

procedure TFcriatorioAtual.Edit2Exit(Sender: TObject);
begin
  if (Edit2.text<>'')and(CompareText(Edit2.text,edit4.Text)<>0)then
  begin
    with FDataModule do begin
      Qcodigo2.close;
      Qcodigo2.sql.text := 'select Crcodigo from Criatorio where Crnome='+#39+Edit2.text+#39;
      Qcodigo2.open;
      if not Qcodigo2.IsEmpty then
      begin
        showmessage('Já existe um criatório/ com este nome');
        Edit2.setfocus;
      end;
    end;
  end;
end;

procedure TFcriatorioAtual.SpeedButton91Click(Sender: TObject);
begin
  Edit2.clear; Edit3.clear; Edit5.clear; Edit6.clear;
  Edit7.clear; Edit8.clear; Edit9.clear; Edit10.clear; Edit11.clear;
  Edit12.clear; Edit13.clear; Edit14.clear; Edit15.clear; Edit16.clear;
  Edit17.clear; Edit18.clear; Edit19.clear; Edit20.clear; Edit21.clear;
  Edit22.clear; Edit23.clear; Edit24.clear; Edit25.clear; Edit26.clear;
  Edit27.clear; ComboBox1.ItemIndex:=-1; ComboBox2.ItemIndex:=-1;
  RadioButton1.Checked:=false; RadioButton2.Checked:=false; edit22.SetFocus;
end;

procedure TFcriatorioAtual.SpeedButton1Click(Sender: TObject);
var nassoc,code:integer;
begin
  if Edit2.text='' then
  begin
    showmessage('Informe o nome do criatório');
    Edit2.setfocus;
  end
  else if Edit18.text<>Edit17.text then
  begin
   showmessage('A senha e sua confirmação não conferem');
   Edit18.setfocus;
  end
  else
  begin
  Val(Edit22.text,nassoc,code);
  if (Edit22.text<>'') and ((code<>0) or (nassoc<0)) then
  begin
    Showmessage('O campo "Número do criatório na associação" deve ser um número inteiro positivo');
    Edit22.setfocus;
  end
  else if (RadioButton1.Checked or RadioButton2.Checked) and (Edit23.text = '') then
  begin
    Showmessage('Informe qual será o sufixo/afixo ou selecione Nenhum');
    RadioButton1.setfocus;
  end
  else
  begin
    with FDataModule do
      begin
        Tcriatorio.Open;
        Tcriatorio.Locate('Crcodigo', edit1.Text, []);
        Tcriatorio.Edit;
        Tcriatorio.FieldByName('Crnome').Asstring:=Edit2.text;
        Tcriatorio.FieldByName('Crproprietario').Asstring:=Edit3.text;
        if RadioButton1.Checked then Tcriatorio.FieldByName('Crsufixoafixo').asstring:='A'
        else if RadioButton2.Checked then Tcriatorio.FieldByName('Crsufixoafixo').asstring:='S'
        else Tcriatorio.FieldByName('Crsufixoafixo').asstring:='';
        if (RadioButton1.Checked)or(RadioButton2.Checked) then Tcriatorio.FieldByName('Crvalorsufafix').Asstring:=Edit23.text;
        Tcriatorio.FieldByName('Crendereco').Asstring:=Edit5.text;
        Tcriatorio.FieldByName('Crcep').Asstring:= Edit6.text;
        Tcriatorio.FieldByName('Crmunic').Asstring:=Edit7.text;
        Tcriatorio.FieldByName('Crestado').Asstring:=ComboBox1.text;
        Tcriatorio.FieldByName('Crpostal').Asstring:=Edit8.text;
        Tcriatorio.FieldByName('Crfone').Asstring:=Edit9.text;
        Tcriatorio.FieldByName('Crcorrespc').Asstring:=Edit10.text;
        Tcriatorio.FieldByName('Crbairroc').Asstring:=Edit11.text;
        Tcriatorio.FieldByName('Crcidadec').Asstring:=Edit12.text;
        Tcriatorio.FieldByName('Crestadoc').Asstring:=ComboBox2.text;
        Tcriatorio.FieldByName('Crpostalc').Asstring:=Edit16.text;
        Tcriatorio.FieldByName('Crcepc').Asstring:=Edit13.text;
        Tcriatorio.FieldByName('Crfonec').Asstring:=Edit14.text;
        Tcriatorio.FieldByName('Crfaxc').Asstring:=Edit15.text;
        Tcriatorio.FieldByName('Crbairro').Asstring:=Edit19.text;
        Tcriatorio.FieldByName('Crcgc').Asstring:=Edit20.text;
        Tcriatorio.FieldByName('Crinscest').Asstring:=Edit21.text;
        Tcriatorio.FieldByName('Crnumassoc').asstring:=Edit22.text;
        Tcriatorio.FieldByName('Crcelular').Asstring:=Edit24.text;
        Tcriatorio.FieldByName('Crfax').Asstring:=Edit25.text;
        Tcriatorio.FieldByName('Cremail').Asstring:=Edit26.text;
        Tcriatorio.FieldByName('Crhomepage').Asstring:=Edit27.text;
        Tcriatorio.FieldByName('Crsenha').Asstring:=Edit18.text;
        Tcriatorio.Post;
        Tcriatorio.Close;
        FcriatorioAtual.Close;
      end;
    end;
  end;
end;

procedure TFcriatorioAtual.SpeedButton2Click(Sender: TObject);
begin
  FcriatorioAtual.close;
end;

procedure TFcriatorioAtual.RadioButton2KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(Key=VK_RETURN) then RadioButton2.setfocus
end;

procedure TFcriatorioAtual.Edit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit2.setfocus
  else if(Key=VK_UP) then Edit22.setfocus;
end;

procedure TFcriatorioAtual.Edit23Enter(Sender: TObject);
begin
 if radiobutton3.Checked then
 begin
  edit23.Enabled := false;
  Edit23.Clear;
  end
 else
  edit23.Enabled := true;
end;

end.
