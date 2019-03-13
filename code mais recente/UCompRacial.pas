unit UCompRacial;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TFCompRacial = class(TForm)
    ComboBox1: TComboBox;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    ComboBox2: TComboBox;
    CheckBox1: TCheckBox;
    Label3: TLabel;
    CheckBox2: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);


  private
    { Private declarations }
  public

  end;

var
  FCompRacial: TFCompRacial;

implementation

uses UPrincipal, Udatamodule;

{$R *.dfm}

procedure TFCompRacial.FormShow(Sender: TObject);
begin
    with FDatamodule do
    begin
      Qcodigo.Close;
      Qcodigo.SQL.Text := 'select * from raca';
      Qcodigo.Open;
      Qcodigo.First;
      while(not Qcodigo.Eof)do
      begin
        FCompRacial.ComboBox1.Items.Add(Qcodigo.Fields[1].asstring);
        Qcodigo.Next;
      end;
    end;
end;

procedure TFCompRacial.ComboBox1Change(Sender: TObject);
begin

   if (FCompRacial.ComboBox1.ItemIndex = -1) then
   begin
      if not(FCompRacial.CheckBox2.Checked) then
      begin
         showmessage('Você deve selecionar uma raça!');
         FCompRacial.ComboBox1.SetFocus;
      end
      else
      begin
         FPrincipal.rel_geral := FCompRacial.CheckBox2.Checked;
         close;
      end;
   end
   else
   begin
   //Se foi escolhida a opção Composta
      if (FCompRacial.ComboBox1.ItemIndex = 0) and not (FCompRacial.ComboBox2.Visible)
      then
      begin
        FCompRacial.Height := 210;
        FCompRacial.GroupBox1.Visible := true;
        FCompRacial.ListBox1.Visible := true;
        FCompRacial.ListBox1.Items.Clear;
        FCompRacial.ComboBox2.Visible := true;
        FCompRacial.Label3.Visible := true;
        FCompRacial.CheckBox1.Visible := true;
        FCompRacial.ComboBox2.ItemIndex := -1;
        FCompRacial.CheckBox1.Enabled := false;
        FCompRacial.Label3.Enabled := false;
        FCompRacial.ListBox1.Items.Clear;
        FPrincipal.eh_composta := true;
        with FDatamodule do
          begin
            Qcodigo.Close;
            Qcodigo.SQL.Text := 'select * from raca';
            Qcodigo.Open;
            Qcodigo.first;
            Qcodigo.Next;
            while(not Qcodigo.Eof)do
            begin
              ComboBox2.Items.Add(Qcodigo.Fields[1].asstring);
              Qcodigo.Next;
            end;
          end;
      end
      else
      begin
        if FCompRacial.ComboBox1.ItemIndex <> 0 then
        begin
           FCompRacial.Button1.Visible := true;
           FCompRacial.Height := 115;
           FCompRacial.GroupBox1.Visible := false;
           FCompRacial.ListBox1.Visible := false;
           FCompRacial.ComboBox2.Visible := false;
           FCompRacial.Label3.Visible := false;
           FCompRacial.CheckBox1.Visible := false;
           FCompRacial.CheckBox1.Checked := false;
           FCompRacial.CheckBox2.Checked := false;
           FCompRacial.ListBox1.Items.Clear;
           FPrincipal.eh_composta := false;
        end;
      end;
   end;
end;
procedure TFCompRacial.ComboBox2Change(Sender: TObject);
var i: smallint;
begin
  FCompRacial.Button1.Visible := true;
  if FCompRacial.ListBox1.Items.Count >= 5 then
     exit;

  i := FCompRacial.ListBox1.Items.Count - 1;
  while(i >= 0)do
  begin
    if(FCompRacial.ListBox1.Items.Strings[i] = FCompRacial.ComboBox2.Text)then
      break;
    i := i - 1;
  end;
  if(i = -1)then
    FCompRacial.ListBox1.Items.Add(combobox2.Text);

  if FCompRacial.ListBox1.Items.Count = 2 then
  begin
     FCompRacial.CheckBox1.Enabled := true;
     FCompRacial.Label3.Enabled := true;
  end
  else
  begin
     FCompRacial.CheckBox1.Enabled := false;
     FCompRacial.Label3.Enabled := false;
  end;  
end;

procedure TFCompRacial.Button1Click(Sender: TObject);
var i : integer;
begin
   if FCompRacial.ComboBox1.ItemIndex = -1 then
    begin
      if not(FCompRacial.CheckBox2.Checked) then
      begin
         showmessage('Você deve selecionar uma raça!');
         FCompRacial.ComboBox1.SetFocus;
      end
      else
      begin
         FPrincipal.rest_raca := FCompRacial.CheckBox1.Checked;
         FPrincipal.rel_geral := FCompRacial.CheckBox2.Checked;
         FPrincipal.tam_racas_comp := 0;
         close;
      end;
   end
   else
   begin
      if (FCompRacial.ComboBox1.ItemIndex <> 0) then
      begin
         with FPrincipal do
         begin
         FPrincipal.tam_racas_comp := 0;
         racas_comp[0] := FCompRacial.ComboBox1.Text;
         end;
      end
      else
      begin
         i := (listbox1.Items.Count - 1);
         FPrincipal.tam_racas_comp := i;
         while(i >= 0)do
         begin
            FPrincipal.racas_comp[i] := FCompRacial.Listbox1.Items.Strings[i];
            i := i - 1;
         end;
      end;
      FPrincipal.rest_raca := FCompRacial.CheckBox1.Checked;
      FPrincipal.rel_geral := FCompRacial.CheckBox2.Checked;
      close;
   end;
end;

procedure TFCompRacial.CheckBox2Click(Sender: TObject);
begin
// Seleciona um relatorio geral
   if FCompRacial.CheckBox2.Checked then
   begin
      FCompRacial.Button1.Visible := true;
      FCompRacial.ComboBox1.Enabled := false;
      FCompRacial.GroupBox1.Visible := false;
      FCompRacial.ListBox1.Visible := false;
      FCompRacial.ComboBox2.Visible := false;
      FCompRacial.Label3.Visible := false;
      FCompRacial.CheckBox1.Visible := false;
      FCompRacial.CheckBox1.Checked := false;
      FCompRacial.Height := 115;
      FCompRacial.ListBox1.Items.Clear;
      FPrincipal.eh_composta := false;
   end
   else
   begin
      FCompRacial.Button1.Visible := false;
      FCompRacial.ComboBox1.Enabled := true;


   end;

end;

end.
