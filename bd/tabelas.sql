CREATE TABLE `atividades` (
	`id_atividades` INT(11) NOT NULL AUTO_INCREMENT,
	`professor` 	VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina` 	VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data_postagem` DATE NULL DEFAULT NULL,
	`conteudo` 		VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id_atividades`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `cadastro_aluno` (
	`RA` 				INT(11) NOT NULL AUTO_INCREMENT,
	`Nome` 				VARCHAR(100) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`RG` 				VARCHAR(9) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`CPF` 				INT(11) NOT NULL DEFAULT '0',
	`Data_Nascimento` 	DATE NOT NULL DEFAULT '0000-00-00',
	`Sexo` 				VARCHAR(1) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`Nome_pai` 			VARCHAR(100) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`Nome_mae` 			VARCHAR(100) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`Endereco` 			VARCHAR(300) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`Telefone` 			INT(11) NOT NULL DEFAULT '0',
	`email` 			VARCHAR(100) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`senha` 			VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`photo` 			VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`RA`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=24
;


CREATE TABLE `cadastro_professor` (
	`NIF` 				INT(11) NOT NULL AUTO_INCREMENT,
	`Nome` 				VARCHAR(100) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`Formacao` 			VARCHAR(100) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`RG` 				VARCHAR(9) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`CPF` 				INT(11) NOT NULL DEFAULT '0',
	`Data_Nascimento` 	DATE NOT NULL DEFAULT '0000-00-00',
	`Sexo` 				VARCHAR(1) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`Endereco` 			VARCHAR(300) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`Telefone` 			INT(11) NOT NULL DEFAULT '0',
	`email`				VARCHAR(100) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`senha` 			VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`Nome_Disciplina` 	VARCHAR(50) NOT NULL DEFAULT '0' COLLATE 'utf8_general_ci',
	`photo` 			VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`NIF`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=64
;


CREATE TABLE `chat` (
	`id_mensagem` 	INT(11) NOT NULL AUTO_INCREMENT,
	`id_usuario` 	INT(11) NULL DEFAULT '0',
	`id_recebedor` 	INT(11) NULL DEFAULT '0',
	`mensagem`	 	VARCHAR(1000) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`url_file` 		VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id_mensagem`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=104
;
