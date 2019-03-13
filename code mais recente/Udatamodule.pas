unit Udatamodule;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ADODB;

type
  TFDataModule = class(TDataModule)
    DSagenda: TDataSource;
    DStarefasAnteriores: TDataSource;
    DSTarefasExecutadas: TDataSource;
    Excel1: TADODataSet;
    Export: TDataSource;
    Cio: TDataSource;
    DParto: TDataSource;
    Producao: TDataSource;
    Database: TDatabase;
    TAnimal: TTable;
    TParto: TTable;
    TCio: TTable;
    TCriatorio: TTable;
    TProducao: TTable;
    TPeso: TTable;
    TOcorre: TTable;
    TPesoAcasala: TTable;
    TPesagens: TTable;
    TFiltro: TTable;
    TIndices: TTable;
    TGsangue: TTable;
    TEstacoesMonta: TTable;
    Table1: TTable;
    TTerceiro: TTable;
    TAgenda: TTable;
    TEscore: TTable;
    QAnimal: TQuery;
    QFiltro: TQuery;
    QRacaCod: TQuery;
    QPelagemCod: TQuery;
    QMotEntCod: TQuery;
    QMotSaiCod: TQuery;
    QCauSaidaCod: TQuery;
    QOcoLact: TQuery;
    QProdMedias: TQuery;
    QAgenda: TQuery;
    Query4: TQuery;
    QManipula: TQuery;
    QProducoesLact: TQuery;
    QOrdem: TQuery;
    QSumario: TQuery;
    QSumario2: TQuery;
    QRecalcula: TQuery;
    QGSangue: TQuery;
    QGSPai: TQuery;
    QTarefas: TQuery;
    QCodigo: TQuery;
    Qcodigo2: TQuery;
    QFichacio1: TQuery;
    QFichacio2: TQuery;
    TRegistro: TTable;
    TDiagDoenca: TTable;
    TVacina: TTable;
    TTerras: TTable;
    TBenfeitorias: TTable;
    TMaquinas: TTable;
    TInsumos: TTable;
    TOutros: TTable;
    TDespesas: TTable;
    TReceitas: TTable;
    TOrigem: TTable;
    TUnidades: TTable;
    TAnimaisFin: TTable;
    TAtivDesp: TTable;
    TAtivRec: TTable;
    QReceitas: TQuery;
    QDespesas: TQuery;
    TIndex: TTable;
    QIndex: TQuery;
    QValidar: TQuery;
    TAtivTer: TTable;
    TAtivBen: TTable;
    TAtivMaq: TTable;
    TAtivIns: TTable;
    TAtivOut: TTable;
    QVerificaData: TQuery;
    QAtualizaGSangue: TQuery;
    QSelRaca: TQuery;
    QCodigo3: TQuery;
    TCentroDeCusto: TTable;
    TRecursosHumanos: TTable;
    QCodigo4: TQuery;
    TAtivFunc: TTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDataModule: TFDataModule;

implementation

{$R *.DFM}

end.
