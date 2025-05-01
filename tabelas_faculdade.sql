#Criar um repositório para armazenar meus dados
create database db_sistema_faculdade;

#ativar o meu repositório
use db_sistema_faculdade;

#Criando a tabela aluno
create table tbl_aluno (
	id_aluno int primary key not null auto_increment,
    nome_aluno varchar(100) not null,
    cpf_aluno varchar(15) not null,
    data_nascimento_aluno date not null,
    
    unique index (id_aluno)
    
);

#criando a tabela telefone_aluno e fazendo a relação com a tabela aluno
create table tbl_telefone_aluno (
	id_telefone_aluno int primary key not null auto_increment,
    telefone_aluno varchar(15) not null,
    id_aluno int not null,
    
    constraint fk_aluno_telefone
    foreign key (id_aluno)
    references tbl_aluno(id_aluno),
    
    unique index (id_telefone_aluno)
    
);

#criando a tabela email_aluno e fazendo a relação com a tabela aluno
create table tbl_email_aluno (
	id_email_aluno int primary key not null auto_increment,
    email_aluno varchar(255) not null,
    id_aluno int not null,
    
    constraint fk_aluno_email
    foreign key (id_aluno)
    references tbl_aluno(id_aluno),
    
    unique index (id_email_aluno)
);

#criando a tabela curso
create table tbl_curso (
	id_curso int primary key not null auto_increment,
    nome_curso varchar(100) not null,
    modalidade_curso varchar(100) not null,
    duracao_curso varchar(45) not null,
    mensalidade_curso decimal (10,2),
    
    unique index (id_curso)
);
    
#criando a tabela matricula e fazendo o relacionamento com a tabela aluno e curso
create table tbl_matricula (
	id_matricula int primary key not null auto_increment,
    id_curso int not null,
    id_aluno int not null, 
    nome_aluno varchar(100) not null,
    data_matricula date not null, 
    
    constraint fk_matricula_curso
    foreign key (id_curso)
    references tbl_curso(id_curso),
    
    constraint fk_matricula_aluno
    foreign key (id_aluno)
    references tbl_aluno(id_aluno),
    
    unique index (id_matricula)
);

#criando a tabela professor
create table tbl_professor (
	id_professor int primary key not null auto_increment,
    nome_professor varchar(100) not null,
    cpf_professor varchar(15) not null,
    especialidade_professor text not null,
    
    unique index (id_professor)
    
);

#criando a tabela email_professor e fazendo o relacionamento com a tabela professor
create table tbl_email_professor (
	id_email_professor int primary key not null auto_increment,
    email_professor varchar(255) not null,
    id_professor int not null,
    
    constraint fk_professor_email
    foreign key (id_professor)
    references tbl_professor(id_professor),
    
    unique index (id_email_professor)
);

#criando a tabela telefone_professor e fazendo o relacionamento com a tabela professor
create table tbl_telefone_professor (
	id_telefone_professor int primary key not null auto_increment,
    telefone_professor varchar(15) not null,
    id_professor int not null,
    
    constraint fk_professor_telefone
    foreign key (id_professor)
    references tbl_professor(id_professor),
    
    unique index (id_telefone_professor)
);

#criando a tabela turma e fazendo o relacionamento com a tabela aluno, curso e professor
create table tbl_turma (
	id_turma int primary key not null auto_increment,
    id_professor int not null,
    id_aluno int not null,
    id_curso int not null,
    nome_turma varchar(45) not null,
    nome_curso varchar(100) not null,
    nome_disciplina varchar(100) not null,
    semestre_turma varchar(45) not null,
    ano_turma int not null,
    
    constraint fk_turma_professor
    foreign key (id_professor)
    references tbl_professor(id_professor),
    
    constraint fk_turma_aluno
    foreign key (id_aluno)
    references tbl_aluno(id_aluno),
    
    constraint fk_turma_curso
    foreign key (id_curso)
    references tbl_curso(id_curso),
    
    unique index (id_turma)
);

#criando a tabela nota e fazendo o relacionamento com as tabelas professor, aluno, turma e curso
create table tbl_nota (
	id_nota int primary key not null auto_increment,
    id_professor int not null,
    id_aluno int not null,
    id_turma int not null,
    id_curso int not null,
    nome_curso varchar(100) not null,
    nome_disciplina varchar(100) not null,
    nota_apresentacao decimal(4,2) not null,
    nota_trabalho decimal(4,2) not null,
    nota_prova decimal (4,2) not null,
    nota_final decimal (4,2) not null,
    
    constraint fk_professor_nota
    foreign key (id_professor)
    references tbl_professor(id_professor),
    
    constraint fk_aluno_nota
    foreign key (id_aluno)
    references tbl_aluno(id_aluno),
    
    constraint fk_curso_nota
    foreign key (id_curso)
    references tbl_curso(id_curso),
    
    unique index (id_nota)
);

#criando a tabela histórico e fazendo o relacionamento com as tabelas nota, curso, turma, professor, aluno
create table tbl_historico (
	id_historico int primary key not null auto_increment,
    id_nota int not null,
    id_curso int not null,
    id_turma int not null,
    id_professor int not null,
    id_aluno int not null,
    nome_aluno varchar(100) not null,
    nome_curso varchar(100) not null,
    nome_disciplina varchar(100) not null,
    semestre_aluno varchar(45) not null,
    media_final varchar(45) not null,
    situacao_aluno varchar(100) not null,
    
    constraint fk_nota_historico
    foreign key (id_nota)
    references tbl_nota(id_nota),
    
    constraint fk_curso_historico
    foreign key (id_curso)
    references tbl_curso(id_curso),
    
    constraint fk_turma_historico
    foreign key (id_turma)
    references tbl_turma(id_turma),
    
    constraint fk_professor_historico
    foreign key (id_professor)
    references tbl_professor(id_professor),
    
    constraint fk_aluno_historico
    foreign key (id_aluno)
    references tbl_aluno(id_aluno),
    
    unique index (id_historico)
);

