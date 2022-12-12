CREATE TABLE `acervo` (
	`id_acervo`     INT(11) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`descricao`     VARCHAR(500) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(100) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id_acervo`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `acervo_bd` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `acervo_hdwr` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`size`          FLOAT NULL DEFAULT NULL,
	`type`          VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `acervo_idm` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`size`          FLOAT NULL DEFAULT NULL,
	`type`          VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=144
;

CREATE TABLE `acervo_lalg` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`size`          FLOAT NULL DEFAULT NULL,
	`type`          VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=25
;

CREATE TABLE `acervo_lmar` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`size`          FLOAT NULL DEFAULT NULL,
	`type`          VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=25
;

CREATE TABLE `acervo_proj` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`size`          FLOAT NULL DEFAULT NULL,
	`type`          VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=25
;

CREATE TABLE `acervo_pwbe` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`size`          FLOAT NULL DEFAULT NULL,
	`type`          VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=44
;

CREATE TABLE `acervo_pwfe` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`type`          VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`size`          FLOAT NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=64
;

CREATE TABLE `acervo_siso` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `acervo_fpoo` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`file_name`     VARCHAR(255) NOT NULL COLLATE 'utf8_unicode_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;