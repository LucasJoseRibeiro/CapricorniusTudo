�
 TFDATAMODULE 0)1  TPF0TFDataModuleFDataModuleOldCreateOrder	Left;Top� Height-Width> TDataSourceDSagendaDataSetQAgendaLeftGTop  TDataSourceDStarefasAnterioresDataSetQTarefasLeft� Top-  TDataSourceDSTarefasExecutadasDataSetQTarefasLeft� Top  TADODataSetExcel1ConnectionString�Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\capricornius\Animal2.xls;Extended Properties=Excel 8.0;Persist Security Info=False
CursorTypectStaticCommandTextPlan1$CommandTypecmdTableDirect
Parameters LeftITop/  TDataSourceExportDataSetExcel1Left� Top  TDataSourceCioLeft|Top  TDataSourceDPartoLeft{Top.  TDataSourceProducaoDataSetQuery4Left� Top-  	TDatabaseDatabase	AliasNameDriver_Access	Connected	DatabaseName
Base_DadosLoginPromptSessionNameDefaultLeft�Top0  TTableTAnimalDatabaseName
Base_Dados	TableNameAnimalLeftTop  TTableTPartoDatabaseName
Base_Dados	TableNamePartoLeft2Top  TTableTCioDatabaseName
Base_Dados	TableNameCioLeft� Top	  TTable
TCriatorioDatabaseName
Base_Dados	TableName	CriatorioLeft� Top	  TTable	TProducaoDatabaseName
Base_Dados	TableNameProducaoLeft� Top	  TTableTPesoDatabaseName
Base_Dados	TableNamePesoLeft Top	  TTableTOcorreDatabaseName
Base_Dados	TableNameOcorreLeftJTop	  TTableTPesoAcasalaDatabaseName
Base_Dados	TableNamePesoAcasalamentoLeft�Top	  TTable	TPesagensDatabaseName
Base_Dados	TableNamePesagensLeftbTop	  TTableTFiltroDatabaseName
Base_Dados	TableNameFiltroLeftTop9  TTableTIndicesDatabaseName
Base_Dados	TableNameIndicesZootecnicosLeft
Top8  TTableTGsangueDatabaseName
Base_Dados	TableNameGsangueLeft8Top8  TTableTEstacoesMontaDatabaseName
Base_Dados	TableNameEstacoesMontaLeft{Top8  TTableTable1DatabaseName
Base_Dados	TableNameAnimalLeft� Top9  TTable	TTerceiroDatabaseName
Base_Dados	TableName	OrdenacaoLeft� Top9  TTableTAgendaDatabaseName
Base_Dados	TableNameAgendaLeft Top8  TTableTEscoreDatabaseName
Base_Dados	TableNameEscoreLeftPTop8  TQueryQAnimalDatabaseName
Base_DadosLeft	Topq  TQueryQFiltroDatabaseName
Base_DadosLeft5Topr  TQueryQRacaCodDatabaseName
Base_DadosSQL.Stringsselect Ranome	from Racawhere Racodigo=:cod LeftTop� 	ParamDataDataType	ftUnknownNamecod	ParamType	ptUnknown    TQueryQPelagemCodDatabaseName
Base_DadosSQL.Stringsselect Penomefrom Pelagemwhere Pecodigo=:cod LeftLTop� 	ParamDataDataType	ftUnknownNamecod	ParamType	ptUnknown    TQuery
QMotEntCodDatabaseName
Base_DadosSQL.Stringsselect Ennomefrom Entradawhere Encodigo=:cod Left� Top� 	ParamDataDataType	ftUnknownNamecod	ParamType	ptUnknown    TQuery
QMotSaiCodDatabaseName
Base_DadosSQL.Stringsselect Msnomefrom Motsaidawhere Mscodigo=:cod Left� Top� 	ParamDataDataType	ftUnknownNamecod	ParamType	ptUnknown    TQueryQCauSaidaCodDatabaseName
Base_DadosSQL.Stringsselect Csnomefrom Causaidawhere Cscodigo=:cod LeftTop� 	ParamDataDataType	ftUnknownNamecod	ParamType	ptUnknown    TQueryQOcoLactDatabaseName
Base_DadosSQL.Strings+select * from Ocolact order by Olcodigo asc LeftUTop�   TQueryQProdMediasDatabaseName
Base_DadosSQL.StringsESELECT AVG(Prgordura) AS MedGordura, AVG(Prproteina) AS MedProteina, <AVG(Prextseco) AS MedExtrato, AVG(Prlactose) as MedLactose, AVG(Prcelsomat) as MedSomaticasFROM ProducaoEWHERE Prcriat_Ancriatorio=:criatorio AND Pranimal_Anplaca=:placa AND +Prdatacontr>=:data1 AND Prdatacontr<=:data2 Left� Topr	ParamDataDataType	ftUnknownName	criatorio	ParamType	ptUnknown DataType	ftUnknownNameplaca	ParamType	ptUnknown DataType	ftUnknownNamedata1	ParamType	ptUnknown DataType	ftUnknownNamedata2	ParamType	ptUnknown    TQueryQAgendaDatabaseName
Base_DadosSQL.Stringsselect * from AgendaDwhere Cod_criatorio=:cod and Data=:dt order by Tipo asc, Status desc Left�Top� 	ParamDataDataType	ftUnknownNamecod	ParamType	ptUnknown DataType	ftUnknownNamedt	ParamType	ptUnknown    TQueryQuery4DatabaseName
Base_DadosSQL.Strings@select Pranimal_Anplaca as Placa, Prdatacontr as Data_Producao, KPrord1 as manha, Prord2 as tarde, Padatapar as Inicio, Padatenclac as fim, IPrgordura as Gordura, Prproteina as Proteina, Prextseco as Extrato_Seco, 7Prlactose as lactose, Prcelsomat as celulas_somaticas  from producao R, parto AGwhere Prcriat_ancriatorio=:c and R.Pranimal_Anplaca=A.Paanimal_Anplaca Land Prcriat_Ancriatorio=Pacriat_Ancriatorio and Padatenclac is not null and 4Prdatacontr>=Padatapar and Prdatacontr<=Padatenclac; LeftTop0	ParamDataDataType	ftUnknownNamec	ParamType	ptUnknown    TQuery	QManipulaDatabaseName
Base_DadosLeftETop0  TQueryQProducoesLactDatabaseName
Base_DadosSQL.Strings+select Prdatacontr,Prtotalord from ProducaoAwhere Prcriat_Ancriatorio=:criat and Pranimal_Anplaca=:placa and 'Prdatacontr>=:dt1 and Prdatacontr<=:dt2 Left� Top� 	ParamDataDataType	ftUnknownNamecriat	ParamType	ptUnknown DataType	ftUnknownNameplaca	ParamType	ptUnknown DataType	ftUnknownNamedt1	ParamType	ptUnknown DataType	ftUnknownNamedt2	ParamType	ptUnknown    TQueryQOrdemDatabaseName
Base_DadosSQL.StringsSelect AnplacaFrom AnimalDWhere ancriatorio_crcodigo=:c and (Anplacapai=:pl or Anplacamae=:pl) Left=Top� 	ParamDataDataType	ftUnknownNamec	ParamType	ptUnknown DataType	ftUnknownNamepl	ParamType	ptUnknown DataType	ftUnknownNamepl	ParamType	ptUnknown    TQueryQSumarioDatabaseName
Base_DadosSQL.Strings3Select Prtotalord, Prdatacontr from Producao where 3Prcriat_Ancriatorio=:c and Pranimal_Anplaca=:p and +Prdatacontr>=:dt1 order by Prdatacontr desc LeftTop� 	ParamDataDataType	ftUnknownNamec	ParamType	ptUnknown DataType	ftUnknownNamep	ParamType	ptUnknown DataType	ftUnknownNamedt1	ParamType	ptUnknown    TQuery	QSumario2DatabaseName
Base_DadosSQL.StringsISelect Prcelsomat, Prdatacontr from Producao where Prcriat_ancriatorio=:c1and Pranimal_Anplaca=:p and Prcelsomat<>null and +Prdatacontr>=:dt1 order by Prdatacontr desc LeftTop	ParamDataDataType	ftUnknownNamec	ParamType	ptUnknown DataType	ftUnknownNamep	ParamType	ptUnknown DataType	ftUnknownNamedt1	ParamType	ptUnknown    TQuery
QRecalculaDatabaseName
Base_DadosLeftJTop   TQueryQGSangueDatabaseName
Base_DadosSQL.Strings:select * from gsangue where Placa=:plac and Criatorio=:codorder by divisao asc Left�Top� 	ParamDataDataType	ftUnknownNameplac	ParamType	ptUnknown DataType	ftUnknownNamecod	ParamType	ptUnknown    TQueryQGSPaiDatabaseName
Base_DadosSQL.Strings.Select distinct Ranome, Numerador, Denominador-From GSangue Where criatorio=:c and Placa=:pl LeftLTop� 	ParamDataDataType	ftUnknownNamec	ParamType	ptUnknown DataType	ftUnknownNamepl	ParamType	ptUnknown    TQueryQTarefasDatabaseName
Base_DadosSQL.Stringsselect * from Agenda0where Cod_criatorio=:c and Data<:d and Status=:sorder by data LeftjTop� 	ParamDataDataType	ftUnknownNamec	ParamType	ptUnknown DataType	ftUnknownNamed	ParamType	ptUnknown DataType	ftUnknownNames	ParamType	ptUnknown    TQueryQCodigoDatabaseName
Base_DadosLeft� Top�   TQueryQcodigo2DatabaseName
Base_DadosLeftTop�   TQuery
QFichacio1DatabaseName
Base_DadosSQL.StringsQinsert into filtro (criatorio, placa, registro, nome, nascimento, sexo, placapai,Gplacamae, indicacao, raca, pelagem, sangue, cornos, brinco, finalidade,Idtdesmama, dtcoberta, dtentrada, motentrada, dtsaida, motsaida, causaida,)pontuacao, origem, barba, baia, pesonasc)Bselect distinct Ancriatorio_crcodigo, Anplaca, Anregistro, Annome,;Andnascimento, Ansexo, Anplacapai, Anplacamae, Anindicacao,BAnraca_racodigo, Anpelagem_pecodigo, Angsangue_sacodigo, Ancornos,=Anbrinco, Anfinalidade, Anddesmama, Andcobertura, Andentrada,EAnmotivoe_encodigo, Andsaida, Anmotivosai_mscodigo, Ancausa_cscodigo,DAnpontuacao, Anorigem, Anbarba, Anbaia, Anpesonasc from animal where0   ancriatorio_crcodigo=:c and ansexo='Fêmea' and Gandsaida is null and (andnascimento<=:dt1 or andnascimento is null) and/(exists (select cianimal_anplaca from cio whereIcicriat_ancriatorio=ancriatorio_crcodigo and cianimal_anplaca=anplaca and)cidata=(select max(cidata) from cio whereJcicriat_ancriatorio=ancriatorio_crcodigo and cianimal_anplaca=anplaca) andJciprenha='Negativa' group by cianimal_anplaca having max(cidata)>=:dt2) orOnot exists(select * from cio where cicriat_ancriatorio=ancriatorio_crcodigo and/cianimal_anplaca=anplaca and cidata>=:dt3)) and0(exists(select paanimal_anplaca from parto whereEpacriat_ancriatorio=ancriatorio_crcodigo and paanimal_anplaca=anplaca9group by paanimal_anplaca having max(padatapar)<=:dt4) orMnot exists(select * from parto where pacriat_ancriatorio=ancriatorio_crcodigoand paanimal_anplaca=anplaca)) LeftcTopr	ParamDataDataType	ftUnknownNamec	ParamType	ptUnknown DataType	ftUnknownNamedt1	ParamType	ptUnknown DataType	ftUnknownNamedt2	ParamType	ptUnknown DataType	ftUnknownNamedt3	ParamType	ptUnknown DataType	ftUnknownNamedt4	ParamType	ptUnknown    TQuery
QFichacio2DatabaseName
Base_DadosSQL.StringsK(select Filtro.* from Filtro, Peso where criatorio=pecriat_ancriatorio and Fplaca=peanimal_anplaca and pedatapes=(select max(pedatapes) from peso Dwhere Pecriat_ancriatorio=criatorio and peanimal_anplaca=placa) and Kpepeso>(select Peso from pesoacasalamento where criatorio=Filtro.criatorio and racodigo=Filtro.raca))unionH(select Filtro.* from Filtro where not exists (select * from peso where :pecriat_ancriatorio=criatorio and peanimal_anplaca=placa))unionN(select Filtro.* from Filtro where not exists (select * from pesoacasalamento ;where criatorio=Filtro.criatorio and Racodigo=Filtro.raca)) Left� Topr  TTable	TRegistroDatabaseName
Base_Dados	TableNameRegistroLeft�Topq  TTableTDiagDoencaDatabaseName
Base_Dados	TableNameDiagnosticoDoencaLeftTopr  TTableTVacinaDatabaseName
Base_Dados	TableNameVacinaLeftNTopr  TTableTTerrasDatabaseName
Base_Dados	TableNameTerrasLeftToph  TTableTBenfeitoriasDatabaseName
Base_Dados	TableNameBenfeitoriasLeftHToph  TTable	TMaquinasDatabaseName
Base_Dados	TableNameMaquinasLeft� Toph  TTableTInsumosDatabaseName
Base_Dados	TableNameInsumosLeft� Toph  TTableTOutrosDatabaseName
Base_Dados	TableNameOutrosLeft� Toph  TTable	TDespesasDatabaseName
Base_Dados	TableNameDespesasLeft(Toph  TTable	TReceitasDatabaseName
Base_Dados	TableNameReceitasLeft`Toph  TTableTOrigemDatabaseName
Base_Dados	TableNameOrigemLeftTop�  TTable	TUnidadesDatabaseName
Base_Dados	TableNameUnidadesLeftHTop�  TTableTAnimaisFinDatabaseName
Base_Dados	TableNameAnimaisFinancaLeft� Top�  TTable	TAtivDespDatabaseName
Base_Dados	TableNameAtivDespLeft� Top�  TTableTAtivRecDatabaseName
Base_Dados	TableNameAtivRecLeft� Top�  TQuery	QReceitasDatabaseName
Base_DadosLeft(Top�  TQuery	QDespesasDatabaseName
Base_DadosLeft`Top�  TTableTIndexDatabaseName
Base_Dados	TableNameIndexEcoLeft�Toph  TQueryQIndexDatabaseName
Base_DadosLeft�Top�  TQueryQValidarDatabaseName
Base_DadosLeft�Top   TTableTAtivTerDatabaseName
Base_Dados	TableNameAtivTerLeftTop�  TTableTAtivBenDatabaseName
Base_Dados	TableNameAtivBenLeftHTop�  TTableTAtivMaqDatabaseName
Base_Dados	TableNameAtivMaqLeft� Top�  TTableTAtivInsDatabaseName
Base_Dados	TableNameAtivInsLeft� Top�  TTableTAtivOutDatabaseName
Base_Dados	TableNameAtivOutLeft� Top�  TQueryQVerificaDataDatabaseName
Base_DadosLeft Top�  TQueryQAtualizaGSangueCachedUpdates	DatabaseName
Base_dadosLefthTop�  TQueryQSelRacaDatabaseName
Base_DadosLeft�Top(  TQueryQCodigo3DatabaseName
Base_DadosLeft�Top�   TTableTCentroDeCustoActive	DatabaseName
Base_Dados	TableNameCentroDeCustoLeft�Top8  TTableTRecursosHumanosActive	DatabaseName
Base_Dados	TableNameRecursosHumanosLeft�Top�  TQueryQCodigo4DatabaseName
Base_DadosLeft�Top�   TTable	TAtivFuncDatabaseName
Base_Dados	TableName
AtivRecHumLeft�Top�   