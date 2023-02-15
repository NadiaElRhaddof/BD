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
email varchar(30) not  null,
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
numero_edicion int not null,
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