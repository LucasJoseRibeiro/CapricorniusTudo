unit Ucriatorio;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Db, DBTables;

type
  TFcriatorio = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Edit5: TEdit;
    Label6: TLabel;
    Edit6: TEdit;
    Label7: TLabel;
    Edit7: TEdit;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label9: TLabel;
    Edit8: TEdit;
    Label10: TLabel;
    Edit9: TEdit;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Edit10: TEdit;
    Label12: TLabel;
    Edit11: TEdit;
    Label13: TLabel;
    Edit12: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    ComboBox2: TComboBox;
    Edit13: TEdit;
    Label16: TLabel;
    Edit14: TEdit;
    Label17: TLabel;
    Edit15: TEdit;
    Label18: TLabel;
    Edit16: TEdit;
    Label4: TLabel;
    Label21: TLabel;
    Edit4: TEdit;
    Edit19: TEdit;
    Label22: TLabel;
    Edit20: TEdit;
    Label23: TLabel;
    Edit21: TEdit;
    Label24: TLabel;
    Label25: TLabel;
    Edit22: TEdit;
    Edit23: TEdit;
    Label26: TLabel;
    Label27: TLabel;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit17: TEdit;
    SpeedButton91: TSpeedButton;
    SpeedButton92: TSpeedButton;
    SpeedButton1: TSpeedButton;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Label19: TLabel;
    Label20: TLabel;
    Edit18: TEdit;
    Edit26: TEdit;
    Label28: TLabel;
    RadioButton3: TRadioButton;
    procedure FormShow(Sender: TObject);
    procedure Edit21KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit3KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit5KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit6KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit7KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit20KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ComboBox1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit9KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit22KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit23KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit8KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit4KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit19KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit24KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit25KeyDown(Sender: TObject; var Key: Word;
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
    procedure Edit16KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit2Exit(Sender: TObject);
    procedure SpeedButton92Click(Sender: TObject);
    procedure SpeedButton91Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Edit18KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit26KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit17KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit17Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcriatorio: TFcriatorio;

implementation

uses Udatamodule;


{$R *.DFM}

procedure TFcriatorio.FormShow(Sender: TObject);
begin
 with Fdatamodule do
 begin
   Qcodigo.Close;
   Qcodigo.SQL.Text := 'select crcodigo from criatorio order by crcodigo asc';
   Qcodigo.Open;
   if Qcodigo.RecordCount < 3 then
   begin
     edit21.Text := '1';
   end
   else
   begin
     Qcodigo.last;
     edit21.Text := inttostr(Qcodigo.Fields[0].AsInteger + 1);
   end;
   Qcodigo.Close;
 end;
 edit18.SetFocus;
end;

procedure TFcriatorio.Edit21KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit18.setfocus
  else if (Key=VK_DOWN) then Edit1.setfocus;
end;

procedure TFcriatorio.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then RadioButton1.setfocus
  else if(Key=VK_DOWN) then Edit3.setfocus
  else if(Key=VK_UP) then Edit21.setfocus;
end;

procedure TFcriatorio.ComboBox3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit17.setfocus;
end;

procedure TFcriatorio.Edit3KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit2.setfocus
  else if(Key=VK_UP) then Edit1.setfocus;
end;

procedure TFcriatorio.Edit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit5.setfocus
  else if(Key=VK_UP) then Edit3.setfocus;
end;

procedure TFcriatorio.Edit5KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit6.setfocus
  else if(Key=VK_DOWN) then Edit7.setfocus
  else if(Key=VK_UP) then Edit2.setfocus;
end;

procedure TFcriatorio.Edit6KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit7.setfocus
  else if(Key=VK_DOWN) then Edit20.setfocus
  else if(Key=VK_UP) then Edit2.setfocus;
end;

procedure TFcriatorio.Edit7KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit20.setfocus
  else if(Key=VK_DOWN) then ComboBox1.setfocus
  else if(Key=VK_UP) then Edit5.setfocus;
end;

procedure TFcriatorio.Edit20KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then ComboBox1.setfocus
  else if(Key=VK_DOWN) then Edit22.setfocus
  else if(Key=VK_UP) then Edit6.setfocus;
end;

procedure TFcriatorio.ComboBox1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit9.setfocus;
end;

procedure TFcriatorio.Edit9KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit22.setfocus
  else if(Key=VK_DOWN) then Edit4.setfocus
  else if(Key=VK_UP) then Edit7.setfocus;
end;

procedure TFcriatorio.Edit22KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit23.setfocus
  else if(Key=VK_DOWN) then Edit19.setfocus
  else if(Key=VK_UP) then Edit20.setfocus;
end;

procedure TFcriatorio.Edit23KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit8.setfocus
  else if(Key=VK_DOWN) then Edit19.setfocus
  else if(Key=VK_UP) then Edit20.setfocus;
end;

procedure TFcriatorio.Edit8KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit4.setfocus
  else if(Key=VK_DOWN) then Edit24.setfocus
  else if(Key=VK_UP) then ComboBox1.setfocus;
end;

procedure TFcriatorio.Edit4KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit19.setfocus
  else if(Key=VK_DOWN) then Edit24.setfocus
  else if(Key=VK_UP) then Edit9.setfocus;
end;

procedure TFcriatorio.Edit19KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit24.setfocus
  else if(Key=VK_UP) then Edit23.setfocus;
end;

procedure TFcriatorio.Edit24KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit25.setfocus
  else if(Key=VK_UP) then Edit8.setfocus;
end;

procedure TFcriatorio.Edit25KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit10.setfocus
  else if(Key=VK_UP) then Edit24.setfocus;
end;

procedure TFcriatorio.Edit10KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit11.setfocus
  else if(Key=VK_DOWN) then Edit12.setfocus
  else if(Key=VK_UP) then Edit25.setfocus;
end;

procedure TFcriatorio.Edit11KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit12.setfocus
  else if(Key=VK_DOWN) then Edit13.setfocus
  else if(Key=VK_UP) then Edit25.setfocus;
end;

procedure TFcriatorio.Edit12KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then ComboBox2.setfocus
  else if(Key=VK_DOWN) then Edit14.setfocus
  else if(Key=VK_UP) then Edit10.setfocus;
end;

procedure TFcriatorio.ComboBox2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit13.setfocus;
end;

procedure TFcriatorio.Edit13KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit14.setfocus
  else if(Key=VK_DOWN) then Edit16.setfocus
  else if(Key=VK_UP) then Edit11.setfocus;
end;

procedure TFcriatorio.Edit14KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit15.setfocus
  else if(Key=VK_UP) then Edit12.setfocus;
end;

procedure TFcriatorio.Edit15KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit16.setfocus
  else if(Key=VK_UP) then Edit12.setfocus;
end;

procedure TFcriatorio.Edit16KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if(Key=VK_UP) then ComboBox2.setfocus;
end;

procedure TFcriatorio.BitBtn1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if(Key=VK_UP) then Edit16.setfocus;
end;

procedure TFcriatorio.BitBtn2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if(Key=VK_UP) then Edit16.setfocus;
end;

procedure TFcriatorio.Edit2Exit(Sender: TObject);
begin
  if Edit2.text<>'' then
  begin
    with FDataModule do
    begin
      Qcodigo2.close;
      Qcodigo2.sql.text := 'select Crcodigo from Criatorio where Crnome='+#39+Edit2.text+#39;
      Qcodigo2.open;
      if not Qcodigo2.IsEmpty then
      begin
        showmessage('Já existe um criatório com este nome');
        Edit2.setfocus;
      end;
    end;
  end;
end;

procedure TFcriatorio.SpeedButton92Click(Sender: TObject);
var nassoc, code2:integer;
begin
 Val(Edit1.text,nassoc,code2);
 if edit18.Text = '' then
 begin
   showmessage('Determine uma senha de acesso para o criatorio');
   edit18.SetFocus;
 end
 else if Edit18.text<>Edit26.text then
 begin
   showmessage('A senha e sua confirmação não conferem');
   Edit26.setfocus;
 end
 else if Edit2.text = '' then
 begin
   Showmessage('Informe o nome do criatório');
   Edit2.setfocus;
 end
 else if (Edit1.text<>'') and ((code2<>0) or (nassoc<0)) then
 begin
   Showmessage('O campo "Número do criatório na associação" deve ser um número inteiro positivo');
   Edit1.setfocus;
 end
 else if (RadioButton1.Checked or RadioButton2.Checked) and (Edit17.text = '') then
 begin
   Showmessage('Informe qual será o sufixo/afixo ou selecione Nenhum');
   edit17.SetFocus;
 end
 else
 begin
   with FDataModule do
   begin
     Tcriatorio.open;
     Tcriatorio.Append;
     Tcriatorio.FieldByName('Crcodigo').asstring := edit21.text;
     Tcriatorio.FieldByName('Crnome').asString := Edit2.text;
     Tcriatorio.FieldByName('Crproprietario').asString := Edit3.text;
     Tcriatorio.FieldByName('Crcgc').asstring := Edit4.text;
     Tcriatorio.FieldByName('Crendereco').asString := Edit5.text;
     Tcriatorio.FieldByName('Crcep').asString := Edit6.text;
     Tcriatorio.FieldByName('Crmunic').asString := Edit7.text;
     Tcriatorio.FieldByName('Crestado').asString := ComboBox1.text;
     Tcriatorio.FieldByName('Crpostal').asString := Edit8.text;
     Tcriatorio.FieldByName('Crfone').asString := Edit9.text;
     Tcriatorio.FieldByName('Crcorrespc').asString := Edit10.text;
     Tcriatorio.FieldByName('Crbairroc').asString := Edit11.text;
     Tcriatorio.FieldByName('Crcepc').asString := Edit13.text;
     Tcriatorio.FieldByName('Crcidadec').asString := Edit12.text;
     Tcriatorio.FieldByName('Crestadoc').asString := ComboBox2.text;
     Tcriatorio.FieldByName('Crfonec').asString := Edit14.text;
     Tcriatorio.FieldByName('Crfaxc').asString := Edit15.text;
     Tcriatorio.FieldByName('Crpostalc').asString := Edit16.text;
     if (RadioButton1.Checked)or(RadioButton2.Checked) then Tcriatorio.FieldByName('Crvalorsufafix').asstring := Edit17.text;
     if RadioButton1.Checked then Tcriatorio.FieldByName('Crsufixoafixo').asstring:='A'
     else if RadioButton2.Checked then Tcriatorio.FieldByName('Crsufixoafixo').asstring:='S';
     Tcriatorio.FieldByName('Crinscest').asstring := Edit19.text;
     Tcriatorio.FieldByName('Crbairro').asstring := Edit20.text;
     Tcriatorio.FieldByName('Crnumassoc').asstring := Edit1.text;
     Tcriatorio.FieldByName('Crcelular').asstring := Edit22.text;
     Tcriatorio.FieldByName('Crfax').asstring := Edit23.text;
     Tcriatorio.FieldByName('Cremail').asstring := Edit24.text;
     Tcriatorio.FieldByName('Crhomepage').asstring := Edit25.text;
     Tcriatorio.FieldByName('Crsenha').asstring := Edit18.text;
     Tcriatorio.FieldByName('Crindicezootecnico').asstring := 'P';
     Tcriatorio.Post;
     Tcriatorio.close;

     //Insere um animal 'N/A' na tabela animal para que se possa ser inserida
     //a ocorrencia na tabela de ocorrencias relacionada a atualização do grau de sangue
     TAnimal.Open;
     Tanimal.Insert;
     Tanimal.Fields[0].asstring := edit21.text;
     Tanimal.Fields[1].AsString := 'N/A';
     Tanimal.Post;
     Fcriatorio.Close;
   end;
 end;
end;

procedure TFcriatorio.SpeedButton91Click(Sender: TObject);
begin
 Edit1.clear; Edit2.clear; Edit3.clear; Edit4.clear; Edit5.clear; Edit6.clear;
 Edit7.clear; Edit8.clear; Edit9.clear; Edit10.clear; Edit11.clear;
 Edit12.clear; Edit13.clear; Edit14.clear; Edit15.clear; Edit16.clear;
 Edit17.clear; Edit18.clear; Edit19.clear; Edit20.clear;
 Edit22.clear; Edit23.clear; Edit24.clear; Edit25.clear; Edit26.clear;
 ComboBox1.ItemIndex:=-1; ComboBox2.ItemIndex:=-1; Edit18.setfocus;
end;

procedure TFcriatorio.SpeedButton1Click(Sender: TObject);
begin
 Fcriatorio.close;
end;

procedure TFcriatorio.Edit18KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN) then Edit26.setfocus
  else if (Key=VK_DOWN) then Edit1.setfocus;
end;

procedure TFcriatorio.Edit26KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit1.setfocus;
end;

procedure TFcriatorio.Edit17KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if(Key=VK_RETURN)or(Key=VK_DOWN) then Edit3.setfocus
  else if (Key=VK_UP)then Edit26.setfocus;
end;

procedure TFcriatorio.Edit17Enter(Sender: TObject);
begin
 If radiobutton3.Checked then
 begin
  edit17.Enabled := false;
  edit17.Clear;
 end
 else
  edit17.Enabled := true;
end;

end.
