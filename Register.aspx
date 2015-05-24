<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
		<meta charset="UTF-8"/>
		<link rel="stylesheet" type="text/css" href="style.css" />
		<title>Obračun potnih stroškov</title>
		<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

		<script type="text/javascript" src="/skripte.js">
		</script>

</head>
<body>
 	<form id="form1" runat="server">
 	<header>
			
				<h1>Obračun potnih stroškov</h1>
			
		</header>




		<div id="menu">
			<ul>
				<li>
					<a href="/home.aspx">
						<img src="images/home.png" alt="Domov"/>
					</a>
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
					<a href="#" id="loginclick">
						<img src="images/login.png" alt="Login"/>
					</a>
				</li>
				<li>
					<a href="/Register.aspx">
						<img src="images/register.png" alt="Register"/>
					</a>
				</li>
			</ul>
			
		</div>

		<asp:CustomValidator ID="CustomValidator1"
            ControlToValidate="pass1"
            OnServerValidate="primerjajGesli"
            Text="Passwords must be the same" runat="server" ErrorMessage="CustomValidator"></asp:CustomValidator>

		<footer>
			<p id="MadeBy">Made by: Rok Dukič</p>
		</footer>


		
		


<script>
		$(document).ready(function(){
			

			$("#registriraj").click(function(){
				//alert("assignListener #registriraj");
				$EM = $('#email').val();
				$pwd1 = $('#pass1').val();
				$pwd2 = $('#pass2').val();
				$.ajax({
					url: 'povezava.php',
					type: 'post',
					data: {'funkcija': 'dodajVTabelo',
							'email': $EM,
							'pass1': $pwd1,
							'pass2': $pwd2},
					success: function(response){ alert(response); }
				});
			});
			//document.getElementById("loginclick").addEventListener('click',toggleVisibility)
		});
	</script>
         <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="register">
                    <asp:TextBox ID="email" runat="server">Insert e-mail</asp:TextBox>
            <br />
                    <asp:TextBox ID="pass1" runat="server">Insert Password</asp:TextBox>
            <br />
                    <asp:TextBox ID="pass2" runat="server">Repeat Password</asp:TextBox>
            <br />
                    <asp:Button ID="Button1" runat="server" Text="Register" />
		    <br />
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
                
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
</html>
