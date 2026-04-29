<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SENA SPA PRO</title>

<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">

<style>
*{margin:0;padding:0;box-sizing:border-box;font-family:'Poppins',sans-serif}
body{background:#f4fdf6;color:#333}

header{display:flex;justify-content:space-between;align-items:center;padding:15px 30px;background:#fff;box-shadow:0 2px 10px rgba(0,0,0,.1);position:sticky;top:0}
.logo{display:flex;align-items:center;gap:10px}
.logo img{width:50px}
nav ul{display:flex;gap:15px;list-style:none}
nav button{background:none;border:none;cursor:pointer;font-weight:500}
nav button:hover{color:#39A900}

section{display:none;padding:60px 20px}
.active{display:block}

.hero{background:linear-gradient(135deg,#39A900,#2e7d32);color:#fff;text-align:center;padding:100px 20px}
.btn{display:inline-block;margin-top:15px;background:#fff;color:#39A900;padding:12px 25px;border-radius:30px;text-decoration:none}

.cards{display:grid;grid-template-columns:repeat(auto-fit,minmax(250px,1fr));gap:20px;margin-top:30px}
.card{background:#fff;padding:20px;border-radius:15px;box-shadow:0 4px 12px rgba(0,0,0,.1);cursor:pointer;transition:.3s;text-align:center}
.card:hover{transform:translateY(-5px)}
.card img{width:100%;border-radius:10px;margin-bottom:10px}
.card i{font-size:40px;color:#39A900;margin-bottom:10px}

.accordion{display:none;margin-top:10px;background:#e8f5e9;padding:10px;border-radius:10px}

footer{background:#2e7d32;color:#fff;text-align:center;padding:20px}

form{max-width:500px;margin:auto;display:flex;flex-direction:column;gap:15px}
input,textarea{padding:12px;border-radius:8px;border:1px solid #ccc}
button.submit{background:#39A900;color:#fff;border:none;padding:12px;border-radius:8px}

@media(max-width:768px){nav ul{flex-direction:column}}
</style>
</head>
<body>

<header>
<div class="logo">
<img src="https://upload.wikimedia.org/wikipedia/commons/8/8e/SENA_Colombia_logo.svg">
<h3>SENA</h3>
</div>
<nav>
<ul>
<li><button onclick="showSection('inicio')">Inicio</button></li>
<li><button onclick="showSection('areas')">Áreas</button></li>
<li><button onclick="showSection('docentes')">Docentes</button></li>
<li><button onclick="showSection('aprendices')">Aprendices</button></li>
<li><button onclick="showSection('contacto')">Contacto</button></li>
</ul>
</nav>
</header>

<section id="inicio" class="active">
<div class="hero">
<h1>Formación Tecnológica SENA</h1>
<p>Prepárate en redes, sistemas y servidores</p>
<a class="btn" onclick="showSection('areas')">Explorar</a>
</div>
</section>

<section id="areas">
<h2 style="text-align:center">Áreas</h2>
<div class="cards">

<div class="card" onclick="toggle('w')">
<i class="fa-brands fa-windows"></i>
<h3>Windows</h3>
<p>Administración de sistemas Microsoft</p>
<div id="w" class="accordion">Active Directory, DHCP, DNS, Servidores</div>
</div>

<div class="card" onclick="toggle('l')">
<i class="fa-brands fa-linux"></i>
<h3>Linux</h3>
<p>Gestión de servidores y scripting</p>
<div id="l" class="accordion">SSH, FTP, Administración, Scripting</div>
</div>

<div class="card" onclick="toggle('c')">
<i class="fa-solid fa-network-wired"></i>
<h3>Cisco</h3>
<p>Configuración de redes</p>
<div id="c" class="accordion">VLANs, Routing, Switching</div>
</div>

</div>
</section>

<section id="docentes">
<h2 style="text-align:center">Docentes</h2>
<div class="cards">

<div class="card" onclick="toggle('d1')">
<img src="https://picsum.photos/200">
<h3>William Santamaría</h3>
<div id="d1" class="accordion">
<p>Instructor de redes con amplia experiencia.</p>
<p><b>Especialidades:</b> Cisco, Routing</p>
<p><b>Monitores:</b> Camilo Villada, Maycol Hoyos</p>
</div>
</div>

<div class="card" onclick="toggle('d2')">
<img src="https://picsum.photos/201">
<h3>Juan Agredo</h3>
<div id="d2" class="accordion">
<p>Instructor de sistemas Windows.</p>
<p><b>Especialidades:</b> Active Directory, DNS</p>
<p><b>Monitores:</b> Daniel Arboleda, Celis</p>
</div>
</div>

<div class="card" onclick="toggle('d3')">
<img src="https://picsum.photos/202">
<h3>Diego Mapallo</h3>
<div id="d3" class="accordion">
<p>Instructor Linux y automatización.</p>
<p><b>Especialidades:</b> Servidores, Bash</p>
<p><b>Monitores:</b> Certuche, Garay</p>
</div>
</div>

</div>
</section>

<section id="aprendices">
<h2 style="text-align:center">Aprendices</h2>
<div class="cards" id="contenedor-aprendices"></div>
</section>

<script>
// Generar aprendices correctamente cuando el DOM esté listo
const estudiantes=[
"Cristian Camilo Villada Muriel","Maycol Stiven Hoyos Hurtado","Daniel Felipe Arboleda Mera",
"Jhoan Stiven Loboa Cambindo","Jhoan Sebastián Certuche Vélez","Andrés Felipe Garay Monrroy",
"Julián David Lugo Acevedo","Franklin Harby Torres Montaño","Johan Sebastián Celis Vargas",
"Josep Andrés Ramírez Conde","Juan Diego Banquez Díaz","Juan David Sánchez Bernal"
];

document.addEventListener("DOMContentLoaded",()=>{
  const cont=document.getElementById('contenedor-aprendices');
  estudiantes.forEach((n,i)=>{
    let div=document.createElement('div');
    div.className='card';
    div.innerHTML=`
      <img src='https://picsum.photos/200?random=${i}'>
      <h3>${n}</h3>
      <div class='accordion'>
        Configuración de redes y servidores.<br>
        Responsable, proactivo, trabajo en equipo.
      </div>`;

    div.onclick=()=>{
      let a=div.querySelector('.accordion');
      a.style.display=a.style.display==='block'?'none':'block';
    };

    cont.appendChild(div);
  });
});
</script>

<section id="contacto">
<h2 style="text-align:center">Contacto</h2>
<form id="f">
<input placeholder="Nombre" required>
<input type="email" placeholder="Correo" required>
<textarea placeholder="Mensaje" required></textarea>
<button class="submit">Enviar</button>
</form>
</section>

<footer>
<p>Proyecto académico SENA</p>
<p><i class="fab fa-facebook"></i> Facebook | <i class="fab fa-instagram"></i> Instagram</p>
</footer>

<script>
function showSection(id){
document.querySelectorAll('section').forEach(s=>s.classList.remove('active'));
document.getElementById(id).classList.add('active');window.scrollTo(0,0)}

function toggle(id){let el=document.getElementById(id);el.style.display=el.style.display==='block'?'none':'block'}

document.getElementById('f').addEventListener('submit',e=>{e.preventDefault();alert('Mensaje enviado')});
</script>

</body>
</html>

