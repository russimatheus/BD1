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
    areadeatuacao varchar(50),
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
    local_ varchar(50),
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
   
   
    INSERT INTO arbitros VALUES ("3", "Japonês","Sasuke Uchiha");
	INSERT INTO arbitros VALUES ("7", "Brasileiro","Sandro Meira Ricci");
	INSERT INTO arbitros VALUES ("12","Alemão","Felix Brych");
	INSERT INTO arbitros VALUES ("8","Americano","Derick Williams");
	INSERT INTO arbitros VALUES ("15","Argentino", "Juan paulo");
	INSERT INTO arbitros VALUES ("2","Português","Cristiano da Silva");
	INSERT INTO arbitros VALUES	("16","Francês","Pierre Duppre");
	INSERT INTO arbitros VALUES ("4","Australiano","Abby Smith");
	INSERT INTO arbitros VALUES ("1","Italiano","Gennaro Calandriello");
	INSERT INTO arbitros VALUES ("5","Senegalês","Abdalla Mbao");
   
   
   
    
    
    INSERT INTO jogador VALUES  ("605.449.590-94","34","Cristiano Ronaldo");
    INSERT INTO jogador VALUES	("216.883.330-37","33","Lionel Messi");
    INSERT INTO jogador VALUES  ("582.546.870-64","27","Paulo Dybala");
    INSERT INTO jogador VALUES  ("249.800.670-26","29","Kevin De Bruyne");
    INSERT INTO jogador VALUEs  ("672.289.110-08","28","Neymar Junior");
    INSERT INTO jogador VALUES	("364.249.210-01","32","Juan Cuadrado");
    INSERT INTO jogador VALUES	("593.422.220-13","34","Manuel Neuer");
    INSERT INTO jogador VALUES	("525.019.020-09","29","Antoine Griezmann");
    INSERT INTO jogador VALUES	("632.555.980-01","28","Lucas Moura");
    INSERT INTO jogador VALUES  ("792.054.450-53","29","Jamez Rodríguez");
    
    
   
   
   
    INSERT INTO time_ VALUES ("12","Espanha","Barcelona","672.289.110-08");
    INSERT INTO time_ VALUES ("15","Inglaterra","Chelsea","216.883.330-37");
    INSERT INTO time_ VALUES ("6","Italia","Juventus","792.054.450-53");
    INSERT INTO time_ VALUES ("4","Alemanha","Bayern Munich","632.555.980-01");
    INSERT INTO time_ VALUES ("18","Russia","Lokomotiv Moscow","593.422.220-13");
    INSERT INTO time_ VALUES ("1","Espanha","Barcelona","605.449.590-94");
    INSERT INTO time_ VALUES ("7","Ucrania","Shakhtar Donetsk","249.800.670-26");
    INSERT INTO time_ VALUES ("3","Portugal","Porto","525.019.020-09");
    INSERT INTO time_ VALUES ("9","França","Paris Saint-Gemain","582.546.870-64");
    INSERT INTO time_ VALUES ("10","Inglaterra","Manchester United","364.249.210-01");
    
    
   
   
   
    INSERT INTO estadio VALUES ("5","75000","Allianz Arena");
    INSERT INTO estadio VALUES ("12","76000","Attaturk Stadium");
    INSERT INTO estadio VALUES ("24","48000","Parc Des Princes");
    INSERT INTO estadio VALUES ("1","81000","Santiago Bernabéu");
    INSERT INTO estadio VALUES ("2","99000","Camp Nou");
    INSERT INTO estadio VALUES ("7","81000","Signal Iduna Park");
    INSERT INTO estadio VALUES ("9","54000","Anfield");
    INSERT INTO estadio VALUES ("14","41000","Stamford Bridge");
    INSERT INTO estadio VALUES ("17","41000","Juventus Stadium");
    INSERT INTO estadio VALUES ("13","71000","Mercedes-Benz Stadium");
   
   
   
    
    
    INSERT INTO faseDoTorneio VALUES ("2","Grupos","B","13");
    INSERT INTO faseDoTorneio VALUES ("7","Grupos","C","5");
    INSERT INTO faseDoTorneio VALUES ("3","Grupos","D","2");
    INSERT INTO faseDoTorneio VALUES ("1","Grupos","A","1");
    INSERT INTO faseDoTorneio VALUES ("5","Grupos","E","24");
    INSERT INTO faseDoTorneio VALUES ("4","Grupos","F","9");
    INSERT INTO faseDoTorneio VALUES ("6","Grupos","A","17");
    INSERT INTO faseDoTorneio VALUES ("10","Grupos","C","14");
    INSERT INTO faseDoTorneio VALUES ("13","Oitavas de Final","Mata-Mata","12");
    INSERT INTO faseDoTorneio VALUES ("11","Oitavas de Final","Mata-Mata","7");
   
   
   
    
    
    INSERT INTO comissaoTecnica VALUES ("3","Massagista","Especial","7");
    INSERT INTO comissaoTecnica VALUES ("7","Psicologo","Do Time","10");
    INSERT INTO comissaoTecnica VALUES ("2","Técnico","Contratado","6");
    INSERT INTO comissaoTecnica VALUES ("4","Treinador","Particular","1");
    INSERT INTO comissaoTecnica VALUES ("10","Medico","Cardiologista","2");
    INSERT INTO comissaoTecnica VALUES ("15","Assistente","Do time","14");
    INSERT INTO comissaoTecnica VALUES ("22","Tecnico","Substituto","12");
    INSERT INTO comissaoTecnica VALUES ("9","Medico","Fisioterapeuta","9");
    INSERT INTO comissaoTecnica VALUES ("11","Treinador","De Goleiros","13");
    INSERT INTO comissaoTecnica VALUES ("3","Psicologo","Terceirizado","3");
   
   
   
   
   
    INSERT INTO pontuacao VALUES ("5","2","2","525.019.020-09");
    INSERT INTO pontuacao VALUES ("2","1","7","216.883.330-37");
    INSERT INTO pontuacao VALUES ("7","3","10","605.449.590-94");
    INSERT INTO pontuacao VALUES ("6","2","3","249.800.670-26");
    INSERT INTO pontuacao VALUES ("1","0","3","632.555.980-01");
    INSERT INTO pontuacao VALUES ("4","5","9","792.054.450-53");
    INSERT INTO pontuacao VALUES ("11","2","0","593.422.220-13");
    INSERT INTO pontuacao VALUES ("9","3","1","364.249.210-01");
    INSERT INTO pontuacao VALUES ("10","1","8","672.289.110-08");
    INSERT INTO pontuacao VALUES ("12","1","5","582.546.870-64");
    
    
   
   
   
   INSERT INTO premiacoes VALUES ("Man Of The match","5","Jogo unico");
   INSERT INTO premiacoes VALUES ("Goleador","3","Jogo Unico");
   INSERT INTO premiacoes VALUES ("Defensor","3","Jogo Unico");
   INSERT INTO premiacoes VALUES ("Melhor Atacante","30","Temporada");
   INSERT INTO premiacoes VALUES ("Melhor Zagueiro","30","Temporada");
   INSERT INTO premiacoes VALUES ("Melhor Lateral","30","Temporada");
   INSERT INTO premiacoes VALUES ("Melhor meio-campo","30","Temporada");
   INSERT INTO premiacoes VALUES ("Melhor goleiro","30","Temporada");
   INSERT INTO premiacoes VALUES ("Puskas","50","Temporada");
   INSERT INTO premiacoes VALUES ("Ballon d'Or","100","Temporada");
   
   
   
   
   
   INSERT INTO bilheteria VALUES ("2","Manchester United X Liverpool","Anfield Stadium");
   INSERT INTO bilheteria VALUES ("7","Real Madrid X Napolli","Santiago Bernabéu");
   INSERT INTO bilheteria VALUES ("6","Barcelona X Borussia Dortmund","Camp Nou");
   INSERT INTO bilheteria VALUES ("10","Chelsea X Atletico De Madrid"," Stamford Bridge");
   INSERT INTO bilheteria VALUES ("13","Monaco X Porto","Estadio do Dragão");
   INSERT INTO bilheteria VALUES ("3","PSG X LYON","Parc des Princes");
   INSERT INTO bilheteria VALUES ("5","Bayern Munich X Atalanta","Allianz Arena");
   INSERT INTO bilheteria VALUES ("12","Milan X Shakhtar Donetsk","Giuseppe Meazza");
   INSERT INTO bilheteria VALUES ("4","Ajax X Lazio", "Amsterdam Arena");
   INSERT INTO bilheteria VALUES ("9","Zenit X Dinamo","Estadio São Petesburgo");
   
   
   
   
   
   INSERT INTO ingresso VALUES ("2","Arquibancada SETOR B","1000 R$");
   INSERT INTO ingresso VALUES ("3","Arquibancada Setor C","900 R$");
   INSERT INTO ingresso VALUES ("5","Arquibancada Setor E","700 R$");
   INSERT INTO ingresso VALUES ("4","Arquibancada Setor D","800 R$");
   INSERT INTO ingresso VALUES ("6","Arquibancada Setor F","500 R$");
   INSERT INTO ingresso VALUES ("1","Arquibancada Setor A","1200 R$");
   INSERT INTO ingresso VALUES ("7","Area vip direita","1500 R$");
   INSERT INTO ingresso VALUES ("8","Area vip esquerda","1500 R$");
   INSERT INTO ingresso VALUES ("9","Area vip embaixo","1600 R$");
   INSERT INTO ingresso VALUES ("10","Area vip meio","2000 R$");
   
   
   
   
   
   INSERT INTO renda VALUES ("5000000","400000");
   INSERT INTO renda VALUES ("3000000","2000000");
   INSERT INTO renda VALUES ("4000000","700000");
   INSERT INTO renda VALUES ("1000000","100000");
   INSERT INTO renda VALUES ("2000000","500000");
   INSERT INTO renda VALUES ("7000000","100000");
   INSERT INTO renda VALUES ("30000000","15000000");
   INSERT INTO renda VALUES ("20000000","12000000");
   INSERT INTO renda VALUES ("5000000","2000000");
   INSERT INTO renda VALUES ("9000000","7000000");
   
   
   
   
   
   INSERT INTO patrocinador VALUES ("Adidas","500000000","Sponsor");
   INSERT INTO patrocinador VALUES ("Heineken","100000000","Naming Rights");
   INSERT INTO patrocinador VALUES ("Pepsi","70000000","Co-Sponsor");
   INSERT INTO patrocinador VALUES ("Master Card","200000000","Sponsor");
   INSERT INTO patrocinador VALUES ("Ford","3000000","Co-Sponsor");
   INSERT INTO patrocinador VALUES ("Sony","5000000","Media Sponsor");
   INSERT INTO patrocinador VALUES ("Playstation","6000000","Media Sponsor");
   INSERT INTO patrocinador VALUES ("UniCredit","4000000","Co-Sponsor");
   INSERT INTO patrocinador VALUES ("Grazpom","9000000","Naming Rights");
   INSERT INTO patrocinador VALUES ("Ifood","2000000","Media Sponsor");
   