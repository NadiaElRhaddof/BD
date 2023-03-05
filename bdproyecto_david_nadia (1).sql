drop database if exists bd_manga; 
create database bd_manga;
use bd_manga;

/* tablas de la base de datos -   
intenté poner las tablas padre primero para que no de errores a la hora de ejecutar el script*/

create table manga(
id_manga int not null auto_increment,
titulo varchar(30) not null,
fecha_lanzamiento date not null,
fecha_fin date not null,
copyright varchar(50) not null,
nombre_autor varchar(30) not null,
id_editorial int not null,
primary key (id_manga)
);

create table editorial(
id_editorial int not null auto_increment,
nombre varchar(30) not null,
direccion varchar(30) not null,
primary key (id_editorial)
);

create table genero(
id_genero int not null auto_increment,
ejemplares varchar(30) not null,    
primary key (id_genero)
);

create table tipogenero(
tipo varchar(30) not null,
id_genero int not null,
primary key (id_genero)
);

create table mangagenero(
id_manga int not null,
id_genero int not null,
primary key (id_manga,id_genero)
); 

create table autor (
id_autor int not null auto_increment,
nacionalidad varchar(50) not null,
numero_mangas int not null,
fecha_lanzamiento date not null,
primary key (id_autor)
);

create table manga_autor (
id_manga int not null,
id_autor int not null,
primary key (id_manga,id_autor)
); 

create table personaje(
id_personaje int not null auto_increment,
nombre varchar(30) not null,
apellidos varchar(30) not null,
edad int not null,
id_manga int not null,
primary key (id_personaje)
);

create table rolpersonaje(
rol varchar(30) not null,
id_personaje int not null,
primary key (id_personaje)
);


create table editor(
id_editor int not null auto_increment,
email varchar(50) not  null,
telefono int not null,
nombre varchar(30) not null,
id_editorial int not null,
primary key (id_editor)
);

create table versiones( 
id_version int not null auto_increment,
numero_version int not null,
fecha_salida date not null,
id_manga int not null,
primary key (id_version)
);

create table tipoversiones(
tipo varchar(30) not null,
id_version int not null,
primary key (id_version)
);

create table edicion(
id_edicion int not null auto_increment,
numero_edicion varchar(30) not null,
fecha_salida date not null,
id_manga int not null,
primary key (id_edicion)
);

create table volumen(
id_volumen int not null auto_increment,
capitulos varchar(30) not null,
numero_volumen int not null,
id_manga int not null,
primary key (id_volumen)
);

create table volumenedicion(
id_volumen int not null,
id_edicion int not null,
primary key (id_edicion,id_volumen)
); 

/* integridad referencial -  alter table */

/* tabla manga */
alter table manga
add constraint fk_editorial foreign key (id_editorial) references editorial (id_editorial);

/* tabla personaje */
alter table personaje
add constraint fk_manga1 foreign key (id_manga) references manga (id_manga);

/* tabla editor */
alter table editor
add constraint fk_editorial2 foreign key (id_editorial) references editorial (id_editorial);

/* tabla volumen */
alter table volumen
add constraint fk_manga2 foreign key (id_manga) references manga (id_manga);

/* tabla versiones */
alter table versiones
add constraint fk_manga6 foreign key (id_manga) references manga (id_manga);

/* tabla edicion */
alter table edicion
add constraint fk_manga3 foreign key (id_manga) references manga (id_manga);

/* tabla volumen */
alter table volumen
add constraint fk_manga4 foreign key (id_manga) references manga (id_manga);

/* tabla volumen - edicion - relacion n:n */
alter table volumenedicion
add constraint fk_volumen foreign key (id_volumen) references volumen (id_volumen),
add constraint fk_edicion foreign key (id_edicion) references edicion (id_edicion);

/* tabla manga - genero - relacion n:n */
alter table mangagenero
add constraint fk_manga5 foreign key (id_manga) references manga (id_manga),
add constraint fk_genero foreign key (id_genero) references genero (id_genero);

/* tabla manga - autor - relacion n:n */
alter table manga_autor
add constraint fk_id_manga6 foreign key (id_manga) references manga (id_manga),
add constraint fk_id_autor foreign key (id_autor) references autor (id_autor);

/* tabla tipogenero - multivaluado */
alter table tipogenero
add constraint fk_tipogenero foreign key (id_genero) references genero (id_genero);

/* tabla rolpersonaje - multivaluado */
alter table rolpersonaje
add constraint fk_rolpersonaje foreign key (id_personaje) references personaje (id_personaje);

/* tabla tipoversiones - multivaluado */
alter table tipoversiones
add constraint fk_version foreign key (id_version) references versiones (id_version);


insert into editorial
(id_editorial, nombre, direccion) values (01, "Norma Editorial", "Calle Manuelitas Nº 22"  );
insert into editorial
(id_editorial, nombre, direccion) values (02, "Panini", "Calle Elanco Jones Nº 56" );
insert into editorial
(id_editorial, nombre, direccion) values (03, "Planeta Comic", "Calle  XPapo Yagües Nº 8" );
insert into editorial
(id_editorial, nombre, direccion) values (04, "Akira Comics", "Calle Zetán Ghana Nº 6" );
insert into editorial
(id_editorial, nombre, direccion) values (05, "Comics Sanchez", "Calle Sol Nº 90" );


insert into manga
(id_manga, titulo, fecha_lanzamiento, fecha_fin, copyright, nombre_autor,id_editorial) values (01, "Tokyo Goul", '2014-10-16', '2018-10-28','copyright original', "Sui Ishida",01 );
insert into manga
(id_manga, titulo, fecha_lanzamiento, fecha_fin, copyright,nombre_autor, id_editorial) values (02, "Attack of Titan", '2009-09-08', '2021-03-02', 'copyright free', "Hajime Isayama",02 );
insert into manga
(id_manga, titulo, fecha_lanzamiento, fecha_fin, copyright, nombre_autor,id_editorial) values (03, "Dragon Ball", '1984-11-20', '1990-06-17', 'copyright original',  "Akira Toriyama",04 );
insert into manga
(id_manga, titulo, fecha_lanzamiento, fecha_fin, copyright, nombre_autor,id_editorial) values (04,"Rakudia kishi no Calnavary", '2015-10-03', '2016-03-17', 'copyright original', "Riku Misora",01 );
insert into manga
(id_manga, titulo, fecha_lanzamiento, fecha_fin, copyright, nombre_autor,id_editorial) values (05,"Detective conan", '1994-01-19', '2023-02-21', 'copyright cc', "Gosho Aoyama",05 );

insert into autor
(id_autor, nacionalidad, numero_mangas, fecha_lanzamiento) values (01, "japonesa", 3, '2014-10-16');
insert into autor
(id_autor, nacionalidad, numero_mangas, fecha_lanzamiento) values (02, "japonesa", 2, '2009-09-08');
insert into autor
(id_autor, nacionalidad, numero_mangas, fecha_lanzamiento) values (03, "japonesa", 6, '1984-11-20');
insert into autor
(id_autor, nacionalidad, numero_mangas, fecha_lanzamiento) values (04, "japonesa", 2, '2015-10-03');
insert into autor
(id_autor, nacionalidad, numero_mangas, fecha_lanzamiento) values (05, "japonesa", 4, '2015-10-03');



insert into editor
(id_editor, email, telefono, nombre, id_editorial) values (01, "Dayloguion@akiracomics.info", 655892545, "Daylo", 01 );
insert into editor
(id_editor, email, telefono, nombre, id_editorial) values (02, "Danielrevisa@panini.info", 629855633, "Daniel", 02);
insert into editor
(id_editor, email, telefono, nombre, id_editorial) values (03, "delipezgirocompleto@normaeditorial.info", 568955633,"Felipez", 03);
insert into editor
(id_editor, email, telefono, nombre, id_editorial) values (04, "Alexelmajo@akiracomics.info",629111133, "Alejandro", 04);
insert into editor
(id_editor, email, telefono, nombre, id_editorial) values (05, "Lincerevisa@planetacomics.com", 695655633,"Jose Maria", 05 );

insert into genero
(id_genero, ejemplares) values (01, 60);
insert into genero
(id_genero, ejemplares) values (02, 69);
insert into genero
(id_genero, ejemplares) values (03, 893);
insert into genero
(id_genero, ejemplares) values (04, 934);
insert into genero
(id_genero, ejemplares) values (05, 01);

insert into tipogenero
(tipo, id_genero) values ("sentai", 01);
insert into tipogenero
(tipo, id_genero) values ("gekiga", 02);
insert into tipogenero
(tipo, id_genero) values ("mecha", 03);
insert into tipogenero
(tipo, id_genero) values ("cyberpunk", 04);
insert into tipogenero
(tipo, id_genero) values ("jidaimono", 05);

insert into personaje
(id_personaje, nombre, apellidos, edad, id_manga) values (01, "Ken", "Kaneki", 19, 01);
insert into personaje
(id_personaje, nombre, apellidos, edad, id_manga) values (02, "Eren", "Yeager", 19, 02);
insert into personaje
(id_personaje, nombre, apellidos, edad, id_manga) values (03, "Goku", "Son", 11, 03);
insert into personaje
(id_personaje, nombre, apellidos, edad, id_manga) values (04, "Ikki", "Kurogane", 16, 04);
insert into personaje
(id_personaje, nombre, apellidos, edad, id_manga) values (05, "Conan",  "Edogawa", 6, 05);

insert into rolpersonaje
(rol, id_personaje) values ("protagonista", 01);
insert into rolpersonaje
(rol, id_personaje) values ("protagonista", 02);
insert into rolpersonaje
(rol, id_personaje) values ("secundario", 03);
insert into rolpersonaje
(rol, id_personaje) values ("protagonista", 04);
insert into rolpersonaje
(rol, id_personaje) values ("extra", 05);

insert into volumen 
(id_volumen, capitulos, numero_volumen, id_manga) values (01, 7, 20, 01);
insert into volumen 
(id_volumen, capitulos, numero_volumen, id_manga) values (02, 6, 27, 02);
insert into volumen 
(id_volumen, capitulos, numero_volumen, id_manga) values (03,7,10,03);
insert into volumen 
(id_volumen, capitulos, numero_volumen, id_manga) values (04, 4, 8, 04);
insert into volumen 
(id_volumen, capitulos, numero_volumen, id_manga) values (05, 10, 52, 05);

insert into edicion
(id_edicion, numero_edicion, fecha_salida, id_manga) values (01, "especial", '2019-02-17', 01);
insert into edicion
(id_edicion, numero_edicion, fecha_salida, id_manga) values (02, "limitada", '2014-04-23', 02 );
insert into edicion
(id_edicion, numero_edicion, fecha_salida, id_manga) values (03, "aniversario", '2020-07-01', 03);
insert into edicion
(id_edicion, numero_edicion, fecha_salida, id_manga) values (04, "estandar", '2015-11-20', 04);
insert into edicion
(id_edicion, numero_edicion, fecha_salida, id_manga) values (05, "aniversario", '2018-06-16', 05);

insert into versiones
(id_version, numero_version, fecha_salida, id_manga) values (01, 7, '2019-02-17', 01 );
insert into versiones
(id_version, numero_version, fecha_salida, id_manga) values (02, 2, '2014-04-23', 02);
insert into versiones
(id_version, numero_version, fecha_salida, id_manga) values (03, 15, '2020-07-01', 03);
insert into versiones
(id_version, numero_version, fecha_salida, id_manga) values (04, 1, '2015-11-20', 04);
insert into versiones
(id_version, numero_version, fecha_salida, id_manga) values (05, 6, '2018-06-16', 05);

insert into tipoversiones
(tipo, id_version) values ("version 02", 01);
insert into tipoversiones
(tipo, id_version) values ("version 10", 02);
insert into tipoversiones
(tipo, id_version) values ("version 45", 03);
insert into tipoversiones
(tipo, id_version) values ("version 05", 04);
insert into tipoversiones
(tipo, id_version) values ("version 31", 05);

insert into volumenedicion
(id_volumen, id_edicion) values (01, 01);
insert into volumenedicion
(id_volumen, id_edicion) values (02, 02);
insert into volumenedicion
(id_volumen, id_edicion) values (03, 03);
insert into volumenedicion
(id_volumen, id_edicion) values (04, 04);
insert into volumenedicion
(id_volumen, id_edicion) values (05, 05);

insert into manga_autor
(id_manga, id_autor) values (01, 01);
insert into manga_autor
(id_manga, id_autor) values (02, 02);
insert into manga_autor
(id_manga, id_autor) values (03, 03);
insert into manga_autor
(id_manga, id_autor) values (04, 04);
insert into manga_autor
(id_manga, id_autor) values (05, 05);

insert into mangagenero
(id_manga, id_genero) values (01, 01);
insert into mangagenero
(id_manga, id_genero) values (02, 02);
insert into mangagenero
(id_manga, id_genero) values (03, 03);
insert into mangagenero
(id_manga, id_genero) values (04, 04);
insert into mangagenero
(id_manga, id_genero) values (05, 05);
