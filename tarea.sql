/*==============================================================*/
/* DBMS name:      ORACLE Version 11g                           */
/* Created on:     30/09/2024 1:02:14 p. m.                     */
/*==============================================================*/


alter table HABILIDADES
   drop constraint FK_HABILIDA_PERSONA_H_PERSONAS;

alter table PERSONAS
   drop constraint FK_PERSONAS_TAREA_PER_TAREAS;

drop index PERSONA_HABILIDAD_FK;

drop table HABILIDADES cascade constraints;

drop index TAREA_PERSONA_FK;

drop table PERSONAS cascade constraints;

drop table TAREAS cascade constraints;

/*==============================================================*/
/* Table: HABILIDADES                                           */
/*==============================================================*/
create table HABILIDADES 
(
   ID_HABILIDAD         NUMBER               not null,
   ID_PERSONA           NUMBER,
   HABILIDAD            VARCHAR2(255)        not null,
   HABILI_CODIGO        VARCHAR2(255)        not null,
   constraint PK_HABILIDADES primary key (ID_HABILIDAD)
);

/*==============================================================*/
/* Index: PERSONA_HABILIDAD_FK                                  */
/*==============================================================*/
create index PERSONA_HABILIDAD_FK on HABILIDADES (
   ID_PERSONA ASC
);

/*==============================================================*/
/* Table: PERSONAS                                              */
/*==============================================================*/
create table PERSONAS 
(
   ID_PERSONA           NUMBER               not null,
   ID_TAREA             NUMBER,
   PERS_NOMBRECOMPLETO  VARCHAR2(255)        not null,
   PERS_EDAD            NUMBER               not null,
   constraint PK_PERSONAS primary key (ID_PERSONA)
);

/*==============================================================*/
/* Index: TAREA_PERSONA_FK                                      */
/*==============================================================*/
create index TAREA_PERSONA_FK on PERSONAS (
   ID_TAREA ASC
);

/*==============================================================*/
/* Table: TAREAS                                                */
/*==============================================================*/
create table TAREAS 
(
   ID_TAREA             NUMBER               not null,
   TAREA                CLOB                 not null,
   TARE_FECHALIMITE     VARCHAR2(255)        not null,
   constraint PK_TAREAS primary key (ID_TAREA)
);

alter table HABILIDADES
   add constraint FK_HABILIDA_PERSONA_H_PERSONAS foreign key (ID_PERSONA)
      references PERSONAS (ID_PERSONA);

alter table PERSONAS
   add constraint FK_PERSONAS_TAREA_PER_TAREAS foreign key (ID_TAREA)
      references TAREAS (ID_TAREA);

