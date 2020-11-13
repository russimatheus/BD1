DROP DATABASE IF EXISTS championsLeague;
Create DATABASE championsLeague;
USE championsLeague;


CREATE TABLE arbitros(
	codArbitro int not null,
    nacionalidade varchar(3),
    nome varchar(50), 
    primary key (codArbitro)
    );

CREATE TABLE jogador(
	cpf varchar(15),
    idade int not null,
    nome varchar (50),
    primary key (cpf)
    );    

CREATE TABLE time_(
	idTime int not null,
    pais varchar(3),
    nome varchar(50),
    cpf varchar(15),
    primary key (idTime),
    foreign key (cpf) references jogador (cpf)
    );
    
CREATE TABLE estadio(
	idEstadio int not null,
    capacidade varchar(5),
    nome varchar(50),
    primary key (idEstadio)
    );

CREATE TABLE faseDoTorneiro(
	codFase int not null,
    tipo varchar(50),
    nome varchar(50),
    idTime int,
    primary key (codFase),
    foreign key (idTime) references time_ (idTime)
    );
    
CREATE TABLE comissaoTecnica(
	codTecnico int not null,
    areadeatuacao varchar(5),
    tipo varchar(50),
    idTime int unique,
    primary key (codTecnico),
    foreign key (idTime) references time_ (idTime)
    );
    
CREATE TABLE pontuacao(
	codPontuacao int not null,
    qtdeGols int,
    qtdeCartoes int,
    cpf varchar(15),
    primary key (codPontuacao),
    foreign key (cpf) references jogador (cpf)
);

CREATE TABLE premiacoes(
	nome varchar(50),
    relevancia varchar(50),
    tipo varchar(50),
    primary key (nome)
    );
    
CREATE TABLE bilheteria(
	codBilheteria int not null,
    jogo varchar(50),
    local varchar(50),
    primary key (codBilheteria)
    );
    
CREATE TABLE ingresso(
	idIngresso int not null,
    local_ varchar(50),
    preco varchar(50),
    primary key (idIngresso)
    );
    
CREATE TABLE renda(
	ganho varchar(50),
	gasto varchar(50)
	);
  
CREATE TABLE patrocinador( 
	nome varchar(50) primary key,
    valor varchar(50),
    tipo varchar(50)
	);
    
CREATE TABLE joga_arbitro_estadio_time(
	codArbitro int not null,
    IdEstadio int not null,
    IdTime int not null,
    foreign key (codArbitro) references arbitros (codArbitro),
    foreign key (IdEstadio) references estadio (IdEstadio),
    foreign key (IdTime) references time_ (IdTime),
	primary key (codArbitro, idEstadio, IdTime)
   );

CREATE TABLE pontuacoes_trazem_premiacoes(
	codPontuacao int not null,
    nome varchar(50),
    foreign key (codPontuacao) references pontuacao (codPontuacao),
    foreign key (nome) references premiacoes (nome),
    primary key (codPontuacao, Nome)
    );
    
CREATE TABLE bilheteria_vende_ingresso(
	codBilheteria int not null,
    idIngresso int not null,
    foreign key (codBilheteria) references bilheteria (codBilheteria),
    foreign key (idIngresso) references ingresso (idIngresso),
    primary key (codBilheteria, idIngresso)
    );
	
CREATE TABLE ingresso_produz(
	idIngresso int not null,
    foreign key (idIngresso) references ingresso (idIngresso),
    primary key (idIngresso)
    );

CREATE TABLE patrocinador_gera_renda(
	nome varchar(50),
    foreign key (nome) references patrocinador (nome),
    primary key (nome)
    );