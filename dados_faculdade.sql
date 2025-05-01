#ativar o meu repositório
use db_sistema_faculdade;

#inserindo dados na minha tabela aluno
insert into tbl_aluno (nome_aluno, cpf_aluno, data_nascimento_aluno)
values ('João silva', '123.456.789-00', '2002-03-15');

insert into tbl_aluno (nome_aluno, cpf_aluno, data_nascimento_aluno)
values ('Maria Oliveira', '987.654.321-00', '2001-10-22');

#selecionando a minha tabela aluno para ver se tá tudo certo
select * from tbl_aluno;

#inserindo dados na minha tabela telefone_aluno e fazendo o relacionamento com a tabela aluno
insert into tbl_telefone_aluno (telefone_aluno, id_aluno)
values ('(11)91234-5678', '1');

insert into tbl_telefone_aluno (telefone_aluno, id_aluno)
values ('(11)99876-5432', '2');

#selecionando a minha tabela telefone_aluno para ver se tá tudo certo
select * from tbl_telefone_aluno;

#inserindo dados na minha tabela email_aluno e fazendo o relacionamento com a tabela aluno
insert into tbl_email_aluno (email_aluno, id_aluno)
values ('joao.silva@email.com', '1');

insert into tbl_email_aluno (email_aluno, id_aluno)
values ('maria.002@email.com', '2');

#selecionando a minha tabela email_aluno para ver se tá tudo certo
select * from tbl_email_aluno;

#selecionando toda a minha tabela aluno
select tbl_aluno.id_aluno, tbl_aluno.nome_aluno, tbl_aluno.cpf_aluno, tbl_aluno.data_nascimento_aluno,
		tbl_telefone_aluno.telefone_aluno,
        tbl_email_aluno.email_aluno

from tbl_telefone_aluno inner join tbl_aluno
on tbl_aluno.id_aluno= tbl_telefone_aluno.id_aluno

inner join tbl_email_aluno on tbl_aluno.id_aluno = tbl_email_aluno.id_aluno;

#encontrando um aluno especifico através do id
select tbl_aluno.id_aluno, tbl_aluno.nome_aluno, tbl_aluno.cpf_aluno, tbl_aluno.data_nascimento_aluno,
		tbl_telefone_aluno.telefone_aluno,
        tbl_email_aluno.email_aluno

from tbl_telefone_aluno inner join tbl_aluno
on tbl_aluno.id_aluno= tbl_telefone_aluno.id_aluno

inner join tbl_email_aluno on tbl_aluno.id_aluno = tbl_email_aluno.id_aluno

where tbl_aluno.id_aluno = '1';

#inserindo dados na minha tabela curso
insert into tbl_curso (nome_curso, modalidade_curso, duracao_curso, mensalidade_curso)
values ('Análise e Dev', 'Presencial', '6 semestres', '750.00');

insert into tbl_curso (nome_curso, modalidade_curso, duracao_curso, mensalidade_curso)
values ('Administração', 'EAD', '8 semestres', '500.00');

#selecionando a minha tabela curso para ver se tá tudo certo
select * from tbl_curso;

#encontrando um curso especifíco através do id
select tbl_curso.id_curso, tbl_curso.nome_curso, tbl_curso.modalidade_curso, tbl_curso.duracao_curso,
		tbl_curso.mensalidade_curso
        
from tbl_curso

where tbl_curso.id_curso = '1';

#adicionando dados a minha tabela matricula 
insert into tbl_matricula (id_curso, id_aluno, nome_aluno, data_matricula)
values ('1', '1', 'João Silva', '2025-02-03');

insert into tbl_matricula (id_curso, id_aluno, nome_aluno, data_matricula)
values ('2', '2', 'Maria Oliveira', '2025-01-20');

#selecionando a minha tabela matricula para ver se tá tudo certo
select * from tbl_matricula;

#selecionando a minha tabela matricula e curso
select tbl_matricula.id_matricula, tbl_matricula.nome_aluno, tbl_matricula.data_matricula,
		tbl_curso.id_curso, tbl_curso.nome_curso
        
from tbl_curso inner join tbl_matricula
on tbl_curso.id_curso = tbl_matricula.id_curso;
        
#encontrando uma matricula especifica através do id
select tbl_matricula.id_matricula, tbl_matricula.id_curso, tbl_matricula.id_aluno, tbl_matricula.nome_aluno, tbl_matricula.data_matricula,
        tbl_aluno.cpf_aluno, tbl_aluno.data_nascimento_aluno
        
from tbl_aluno inner join tbl_matricula
on tbl_aluno.id_aluno = tbl_matricula.id_aluno

where tbl_aluno.id_aluno = '1';

#inserindo dados na tabela professor
insert into tbl_professor (nome_professor, cpf_professor, especialidade_professor)
values ('Ana Lima', '555.666.777-88', 'Banco de Dados');

insert into tbl_professor (nome_professor, cpf_professor, especialidade_professor)
values ('Carlos Mendes', '222.333.444-55', 'Administração');

#selecionando a minha tabela professor para ver se tá tudo bem
select * from tbl_professor;

#inserindo dados na minha tabela email_professor e fazendo o relacionamento com a tabela professor
insert into tbl_email_professor (email_professor, id_professor)
values ('ana.lima@facul.com', '1');

insert into tbl_email_professor (email_professor, id_professor)
values ('carlos.m@facul.com', '2');

#selecionando a minha tabela email_professor para ver se tá tudo bem
select * from tbl_email_professor;

#inserindo dados na minha tabela telefone_professor e fazendo o relacionamento com a tabela professor
insert into tbl_telefone_professor (telefone_professor, id_professor)
values ('(11)95555-1234', '1');

insert into tbl_telefone_professor (telefone_professor, id_professor)
values ('(11)97777-4321', '2');

#selecionando a minha tabela telefone_professor para ver se tá tudo bem
select * from tbl_telefone_professor;

#selecionando toda a minha tabela professor
select tbl_professor.id_professor, tbl_professor.nome_professor, tbl_professor.cpf_professor, tbl_professor.especialidade_professor,
		tbl_email_professor.email_professor,
        tbl_telefone_professor.telefone_professor
        
from tbl_email_professor inner join tbl_professor
on tbl_professor.id_professor = tbl_email_professor.id_professor

inner join tbl_telefone_professor on tbl_professor.id_professor = tbl_telefone_professor.id_professor;

#encontrando um professor especifico através do id
select tbl_professor.id_professor, tbl_professor.nome_professor, tbl_professor.cpf_professor, tbl_professor.especialidade_professor,
		tbl_email_professor.email_professor,
        tbl_telefone_professor.telefone_professor
        
from tbl_email_professor inner join tbl_professor
on tbl_professor.id_professor = tbl_email_professor.id_professor

inner join tbl_telefone_professor on tbl_professor.id_professor = tbl_telefone_professor.id_professor

where tbl_professor.id_professor = '1';

#adicionando dados a nossa tabela turma
insert into tbl_turma (id_professor, id_aluno, id_curso, nome_turma, nome_curso, nome_disciplina, semestre_turma, ano_turma)
values ('1', '1', '1', 'ADS1-T01', 'Análise e Dev', 'Banco de Dados', '1 semestre', '2025');

insert into tbl_turma (id_professor, id_aluno, id_curso, nome_turma, nome_curso, nome_disciplina, semestre_turma, ano_turma)
values ('2', '2', '2', 'ADM2-EAD', 'Administração', 'Gestão Empresarial', '1 semestre', '2025');

#selecionando a minha tabela turma para ver se tá tudo certo
select * from tbl_turma;

#selecionando uma turma especifica através do id_aluno
select tbl_turma.id_aluno, tbl_turma.id_curso, tbl_turma.nome_turma, tbl_turma.nome_curso, tbl_turma.nome_disciplina, tbl_turma.semestre_turma, tbl_turma.ano_turma

from tbl_turma
where tbl_turma.id_aluno = '1';

#inserindo dados na minha tabela nota
insert into tbl_nota (id_professor, id_aluno, id_turma, id_curso, nome_curso, nome_disciplina, nota_apresentacao, nota_trabalho, nota_prova, nota_final)
values ('1', '1', '1', '1', 'Análise e Dev', 'Banco de Dados', '8.5', '9.0', '7.5', '8.3');

insert into tbl_nota (id_professor, id_aluno, id_turma, id_curso, nome_curso, nome_disciplina, nota_apresentacao, nota_trabalho, nota_prova, nota_final)
values ('2', '2', '2', '2', 'Administração', 'Gestão Empresarial', '7.0', '8.0', '6.5', '7.1');

#selecionando a minha tabela nota para ver se tá tudo certo
select * from tbl_nota;

#procurando uma nota especifica através do id_aluno
select tbl_nota.id_aluno, tbl_nota.id_curso, tbl_nota.nome_curso, tbl_nota.nome_disciplina, tbl_nota.nota_apresentacao, tbl_nota.nota_trabalho,
tbl_nota.nota_prova, tbl_nota.nota_final

from tbl_nota
where tbl_nota.id_aluno = '1';

#adicionando dados na minha tabela historico 
insert into tbl_historico (id_nota, id_curso, id_turma, id_professor, id_aluno, nome_aluno, nome_curso, nome_disciplina, semestre_aluno, media_final,
situacao_aluno)
values ('1', '1', '1', '1', '1', 'João Silva', 'Análise e Dev', 'Banco de Dados', '1 semestre', '8.3', 'Aprovado');

insert into tbl_historico (id_nota, id_curso, id_turma, id_professor, id_aluno, nome_aluno, nome_curso, nome_disciplina, semestre_aluno, media_final,
situacao_aluno)
values ('2', '2', '2', '2', '2', 'Maria Oliveira', 'Administração', 'Gestão Empresarial', '1 semestre', '7.1', 'Aprovado');

#selecionando a minha tabela historico para ver se tá tudo certo
select * from tbl_historico;

#selecionando um historico especifico de aluno através do id
select tbl_historico.id_aluno, tbl_historico.id_curso, tbl_historico.nome_aluno, tbl_historico.nome_curso, tbl_historico.nome_disciplina,
tbl_historico.semestre_aluno, tbl_historico.media_final, tbl_historico.situacao_aluno

from tbl_historico
where tbl_historico.id_aluno = '1';

