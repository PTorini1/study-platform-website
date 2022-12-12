CREATE TABLE `tarefa_hdwr` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`title`         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data_postagem` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `tarefa_idm` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`title`         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data_postagem` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=14
;

CREATE TABLE `tarefa_lalg` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`title`         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data_postagem` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `tarefa_lmar` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`title`         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data_postagem` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `tarefa_proj` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`title`         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data_postagem` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `tarefa_pwbe` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`title`         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data_postagem` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `tarefa_pwfe` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`title`         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data_postagem` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `tarefa_siso` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`title`         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data_postagem` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `tarefa_fpoo` (
	`id`            INT(3) NOT NULL AUTO_INCREMENT,
	`title`         VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`descricao`     VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`disciplina`    VARCHAR(10) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`professor`     VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8_general_ci',
	`data_postagem` DATE NULL DEFAULT NULL,
	PRIMARY KEY (`id`) USING BTREE
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;
