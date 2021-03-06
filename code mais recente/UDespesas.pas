unit UDespesas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBTables, Grids, DBGrids, StdCtrls, Buttons, Mask, DBCtrls;

type
  TFDespesas = class(TForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Table2: TTable;
    Table3: TTable;
    BtnFechaDesp: TBitBtn;
    Label1: TLabel;
    EditPesquisa: TEdit;
    BitBtn1: TBitBtn;
    Table1: TTable;
    procedure BtnFechaDespClick(Sender: TObject);
    procedure EditPesquisaChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDespesas: TFDespesas;

implementation

uses UPrincipal, Udatamodule;

{$R *.dfm}

procedure TFDespesas.BtnFechaDespClick(Sender: TObject);
begin
   close;
end;

procedure TFDespesas.EditPesquisaChange(Sender: TObject);
begin
   table1.locate('DeDescricao',EditPesquisa.Text,[lopartialkey]); //loCaseInsensitive, lopartialkey
end;

procedure TFDespesas.BitBtn1Click(Sender: TObject);
var
    indice_unid_desp, indice_origem_desp, id, i:integer;
begin
   //Limpo os campos necessários
   i:=0;
   id:=-1;
   Fprincipal.ComboBox62.Text:= ''; //Unidades
   Fprincipal.ComboBox62.ItemIndex := -1;
   indice_unid_desp := -1;
   Fprincipal.MaskEdit34.Clear; // Data de lançamento
   Fprincipal.Edit180.Clear; // Quantidade;
   Fprincipal.Edit182.Clear; // Valor Total
   Fprincipal.ComboBox72.Text:=''; // Formas de pagamento
   Fprincipal.ComboBox72.ItemIndex:=-1;
   Fprincipal.ComboBox70.Text:= ''; // (Centro de custo)
   Fprincipal.ComboBox70.ItemIndex:=-1;
   for i:=0 to 3 do
      Fprincipal.CheckListBox1.Checked[i] := false; // Atividades
   Fprincipal.statusbar38.Panels[0].Text := '';

   if table1.fieldbyname('DeDescricao').asstring <> '' then
   begin
      Fprincipal.EditDesp.Text := table1.fieldbyname('DeDescricao').asstring;
      Fprincipal.MaskEdit34.Text := table1.fieldbyname('DeDataLanc').asstring;
      Fprincipal.Edit180.Text := table1.fieldbyname('DeQuantidade').asstring;
      Fprincipal.Edit182.Text := Format('%.2f',[table1.fieldbyname('DeValorTotal').asfloat]);
      indice_unid_desp := StrToInt(table1.FieldByName('Deid_unid').asstring);
      indice_origem_desp:= StrToInt(table1.FieldByName('Deid_centroDeCusto').asstring);
      Fprincipal.ComboBox62.itemindex := indice_unid_desp - 1;
      Fprincipal.ComboBox70.itemindex := indice_origem_desp - 1;
      Fprincipal.ComboBox72.itemindex := Fprincipal.ComboBox72.Items.IndexOf(table1.FieldByName('DeFormaPag').asstring);
      id := table1.FieldByName('id_despesa').asinteger ;
      Fprincipal.chave_despesa := id;

      with FDataModule do
      begin
        // Aqui incluo as Atividades
        Qmanipula.Close;
        Qmanipula.SQL.text := 'select ativDesp from AtivDesp where Atid_desp=:c '+
                              'order by ativDesp asc';
        Qmanipula.Params[0].AsInteger := id;
        Qmanipula.Open;
        Qmanipula.First;
        while not Qmanipula.Eof do
        begin
          Fprincipal.CheckListBox1.Checked[Qmanipula.Fields[0].asinteger]:=true;
          Qmanipula.Next;
        end;
      end;

      //Mostro apenas os botoes de atualizar e remover
      Fprincipal.BitBtnRemDes.Enabled := true;
      Fprincipal.BitBtnSalDes.Enabled := true;
      Fprincipal.BitBtnInsDes.Enabled := false;
   end;


end;

end.

