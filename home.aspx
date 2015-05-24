<%@ Page Language="C#" AutoEventWireup="true" CodeFile="home.aspx.cs" Inherits="home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <meta charset="UTF-8"/>
		<link rel="stylesheet" type="text/css" href="style.css" />
		<title>Obračun potnih stroškov</title>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js" ></script>

</head>
<body>
 		<script type="text/javascript" src="/skripte.js"></script>

		<header>
			
				<h1>Obračun potnih stroškov</h1>
			
		</header>
		<div id="menu">
			<ul>
				<li>
					<a href="/home.aspx">
						<img src="images/home.png" alt="Domov"/> </a>
				</li>
				<li>
					<a href="/Obracun.aspx">
						<img src="images/calculator.png" alt="Obračun"/>
					</a>
				</li>
				<li>
					<a href="/Zgodovina.aspx">
						<img src="images/images.png" alt="Zgodovina"/>
					</a>
				</li>
				<li>
					<a href="/About.aspx">
						<img src="images/question-mark.png" alt="About"/>
					</a>
				</li>
				<li>
					<a id="loginclick" href="#">
						<img  src="images/login.png" alt="Login"/>
					</a>
				</li>
				<li>
					<a href="/Register.aspx">
						<img src="images/register.png" alt="Register"/>
					</a>
				</li>
			</ul>
			
		</div>


		<div id="login">
			<strong>e-mail:</strong><br/>
			<input id="loginEMail" type="text"/><br/>
			<strong>Password:</strong><br/>
			<input id="loginPassword" type="password"/><br/>
			<button id="IWannaLogin" type="button">Login</button>
		</div>
		
		<footer>
			<p id="MadeBy">Made by: Rok Dukič</p>
		</footer>

<script type="text/javascript">
	/*window.onload = function(){
		document.getElementById('loginclick').addEventListener('click',toggleVisibility);
	}*/

	$(document).ready(function(){
		$("#loginclick").click(function(){
			toggleVisibility();
		});

		$("#IWannaLogin").click(function(){
			$lEMail = $('#loginEMail').val();
			$lPass = $('#loginPassword').val();
			$.ajax({
				url: 'vpis.php',
				type: 'post',
				data: {'funkcija': 'vpis',
						'logEMail' : $lEMail,
						'logPass' : $lPass},
				success: function(response){alert(response)}
			});
		});
	});
	</script>

</body>
</html>
