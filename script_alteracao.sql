/*Nome dos integrantes:
Victor Vinicius G. barbosa RA 1700642
Bruno C. Zaccariello RA 1700604
Gabriel Aubert Costa RA 1700382
Leonardo de Melo RA 1700579 
Eduardo Marinho RA 1700158
SI 2B - NOITE
 */

alter table cliente add nome varchar(300) Not null
alter table cliente drop constraint uqclienterg (rg,uf),
alter table cliente add tel char (14)

alter table veiculo drop column km