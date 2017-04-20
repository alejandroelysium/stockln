console.log("Coronel Back Engine ");
var express = require('express');

var app = express();
var server  = app.listen(9797);

app.use(express.static('public'));
var session = require('express-sessions')

var socket = require('socket.io');
var io = socket(server);

var user = [];
io.sockets.on('connection', newConnection);

var mysql = require('mysql');
var connection = mysql.createConnection({
	//host: 'localhost',
	host: '192.168.0.104',
	user: 'bleikU',
	password: 'password',
	database: 'stockln'
});

//Prueba login
var bodyParser = require('body-parser')
app.use( bodyParser.json() );       // to support JSON-encoded bodies
app.use(bodyParser.urlencoded({     // to support URL-encoded bodies
  extended: true
})); 
/*
app.use(express.json());       // to support JSON-encoded bodies
app.use(express.urlencoded()); // to support URL-encoded bodies
 */
//Prueba login

connection.connect();
//var timer = setInterVal(timeF, 10000);

// START THE FEED OF THE DATA HERE

// INICIAR LA ALIMENTACION DE LA BASE DE DATOS AQUI CUANDO ENTRA UNA CONNEXION

function newConnection(socket) {
	console.log("ESTA FUNCION INICIA CUANDO SE CONNECTA UN CLIENTE ");
	 connection.query('select * from stockln.stock', function(err,rows,fields){
		datos = {
			id : [],
			Emp : [],
			p : [],
			date : [],
			Uti : []
		}
		for(i = 0; i < rows.length; i ++){
			datos.id.push(rows[i]['id_posicion']);
			datos.Emp.push(rows[i]['empresa']);
			datos.p.push(rows[i]['producto']);
			datos.date.push(rows[i]['fecha_inicial']);
			datos.Uti.push(rows[i]['utilidad_mensual']);
		}
		io.sockets.emit('DB', datos);
	});
}

// Mostrar información inicial
app.get('/initialData',checkAuth, function(req, res) {
	estanteria=[];

  	connection.query('select estanteria from stockln.stock group by estanteria order by estanteria asc', function(err,rows,fields){
  		for(i = 0; i < rows.length; i ++){
			estanteria[i] = rows[i]['estanteria'];
		} 
	});

	setTimeout(function() {
	res.send(JSON.stringify(estanteria)+'&&'+session.nombre);		
	}, 1000);

});

// Mostrar información de una estanteria especifica
app.get('/showdata',checkAuth, function(req, res) {
	var estanteria = req.query.estanteria;
	datos = [];
	estanterias=[];
	proveedores=[];
	categorias=[];
	numero_columnas = 0;
		
  	connection.query("select id_posicion,empresa,producto,DATE_FORMAT(fecha_inicial,'%Y/%m/%d') as fecha_inicial,DATE_FORMAT(fecha_final,'%Y/%m/%d') as fecha_final,utilidad_mensual,estanteria,categoria,orden from stockln.stock where estanteria='"+estanteria+"' order by orden", function(err,rows,fields){
  		for(i = 0; i < rows.length; i ++){
			datos[i] = [];
			datos[i][0] = rows[i]['id_posicion'];
			datos[i][1] = rows[i]['empresa'];
			datos[i][2] = rows[i]['producto'];
			datos[i][3] = rows[i]['fecha_inicial'];
			datos[i][4] = rows[i]['fecha_final'];
			datos[i][5] = rows[i]['utilidad_mensual'];
			datos[i][6] = rows[i]['estanteria'];
			datos[i][7] = rows[i]['categoria'];
			datos[i][8] = rows[i]['orden'];
		} 

	});

  	connection.query('select orden from stockln.stock where estanteria='+estanteria+' limit 2', function(err,rows,fields){
  		for(i = 0; i < rows.length; i ++){
			estanterias[i] = rows[i]['orden'];
		} 
		numero_columnas = parseInt(estanterias[1])-parseInt(estanterias[0]);
	});

	connection.query('select empresa from stockln.stock where estanteria='+estanteria+' group by empresa', function(err,rows,fields){
  		for(i = 0; i < rows.length; i ++){
			proveedores[i] = rows[i]['empresa'];
		} 
	});
		

	connection.query('select categoria from stockln.stock where estanteria='+estanteria+' group by categoria', function(err,rows,fields){
		for(i = 0; i < rows.length; i ++){
			categorias[i] = rows[i]['categoria'];
		} 

	});
	setTimeout(function() {
	res.send(JSON.stringify(datos)+'&&'+JSON.stringify(proveedores)+'&&'+JSON.stringify(categorias)+'&&'+numero_columnas);		
	}, 1000);

});


// routes will go here
app.get('/updatedata',checkAuth, function(req, res) {
    var estanteria = req.query.estanteria;
	var posicion = req.query.posicion;
	var empresa = req.query.empresa;
	var categoria = req.query.categoria;
	var producto = req.query.producto;
	var fecha_inicial = req.query.fecha_inicial;
	var fecha_final = req.query.fecha_final;
	var mensualidad = req.query.mensualidad;
	

	connection.query("update stockln.stock set empresa='"+empresa+"', producto='"+producto+"', fecha_inicial='"+fecha_inicial+"', fecha_final='"+fecha_final+"', categoria='"+categoria+"',utilidad_mensual='"+mensualidad+"' where estanteria='"+estanteria+"' and id_posicion='"+posicion+"'", function(err,rows,fields){});
  res.send("posicion "+posicion+' de la estanteria '+estanteria+' ha sido actualizada!');

	var f = new Date();
	fecha = f.getFullYear() + "/" + (f.getMonth() +1) + "/" + f.getDate()+' '+f.getHours()+':'+f.getMinutes()+':'+f.getSeconds();
  	var log  = {
		usuario:session.username,
		fecha:fecha,
		id_posicion:posicion,
		empresa:empresa,
		producto:producto,
		fecha_inicial:fecha_inicial,
		fecha_final:fecha_final,
		utilidad_mensual:mensualidad,
		estanteria:estanteria,
		categoria:categoria};
	connection.query('INSERT INTO logs SET ?', log, function(err, result) {});

});

//Checking session
function checkAuth(req, res, next) {
  if (!session.username) {
    //res.send('You are not authorized to view this page');
    res.redirect('login.html');
  } else {
    next();
  }
}

//Logout
app.get('/logout', function (req, res) {
  delete session.username;
  delete session.nombre;
  res.redirect('login.html');
});

//Login
app.get('/login', function (req, res) {
	//var post     = req.body;
    var post = req.query;
	var usuario  = post.user;
	var password = post.password;
  	connection.query("select * from stockln.usuarios where username='"+usuario+"' AND password='"+password+"' AND estado=1", function(err,rows,fields){
		if(rows.length > 0){
			session.username = usuario;
			session.nombre   = rows[0]['nombre'];
			res.redirect('alejandro2.html');
		}else{
			alert("Usuario invalido");
		}
	});
});
//http://stackoverflow.com/questions/7990890/how-to-implement-login-auth-in-node-js