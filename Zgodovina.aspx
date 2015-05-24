<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Zgodovina.aspx.cs" Inherits="Zgodovina" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
		<meta charset="UTF-8"/>
		<link rel="stylesheet" type="text/css" href="style.css" />
		<title>Obračun potnih stroškov</title></head>
<body>
	<form id="form1" runat="server">
	<script type="text/javascript" src="/skripte.js"></script>

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
					<a id="loginclick" href="#">
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

		<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="374px">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="Od" HeaderText="Od" SortExpression="Od" />
                <asp:BoundField DataField="Do" HeaderText="Do" SortExpression="Do" />
                <asp:BoundField DataField="Cena" HeaderText="Cena" SortExpression="Cena" />
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rok1071_b1ConnectionString %>" ProviderName="<%$ ConnectionStrings:rok1071_b1ConnectionString.ProviderName %>" SelectCommand="SELECT Od, Do, Cena FROM poizvedbe"></asp:SqlDataSource>

		<div id="login">
			<strong>e-mail:</strong><br/>
			<input id="loginEMail" type="text"/><br/>
			<strong>Password:</strong><br/>
			<input id="loginPassword" type="password"/><br/>
			<button id="IWannaLogin" type="button" onclick="login()">Login</button>
		</div>

		<footer>
			<p id="MadeBy">Made by: Rok Dukič</p>
		</footer>

    </form>

</body>
</html>
