<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file ="lib/Conexao.asp"-->
<!--#include file="base.asp"-->

<%
if Session("CPF_Usu") = "" then
response.Write("<script>")
response.Write("alert('O Usuáio não está logado!');")
response.Write("window.location.assign('logout.asp')")
response.Write("</script>")
end if


'evt  = Request("evt")

 

'response.write(int(cod))
'response.end
call abreConexao

if Request("CpfVisualizar") <> ""  then
   
   sql = "SELECT * from GU_CadPessoasUp where CPF = '"&replace(replace(replace(Request("CpfVisualizar"),".",""),".",""),"-","")&"'"
   response.write sql
   set rs = conn.execute(sql)

   if not rs.eof then
CPF             =  rs("CPF")
Nome            =  rs("Nome")
CodPrograma     =  rs("CodPrograma")
idPerfil        =  rs("idPerfil")
StatusUsuario   =  rs("status")
DataCadUsuario  =  rs("DataCadUsuario")
cpfCad          =  rs("cpfCad")
Existe = 1


   bot        = "Alterar"   
   else 
   bot        = "Incluir" 
   end if 


else
   bot       = "Incluir"
end if
'Session("id_modulo") = rs("id_modulo")
call fechaConexao
%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.2.1/dist/sweetalert2.min.js"></script>
<script src="javascript/Mascara.js"></script>
<script>
function validar(){
if(document.frmCadPessoa.txtCPF.value == ""){
        Swal.fire({
 		    icon: 'error',
  			title: 'Oops...',
  			text: 'Obrigatorio Digitar o CPF!',
		 })
         document.frmCadPessoa.txtCPF.focus();
         return false;
     }
	else
	if(!ValidarCPF(document.frmCadPessoa.txtCPF.value.replace(".","").replace(".","").replace("-",""))){
   			Swal.fire({
 		    icon: 'error',
  			title: 'Oops...',
  			text: 'CPF Invalido ou está na formatação errada 000.000.000-00!',
  
})
     document.frmCadPessoa.txtCPF.focus();
	 return false;
}
if(document.frmCadPessoa.txtNome.value == ""){
        Swal.fire({
 		    icon: 'error',
  			title: 'Oops...',
  			text: 'Obrigatorio Digitar o Nome Completo!',
		 })
         document.frmCadPessoa.txtNome.focus();
         return false;
     }
if(document.frmCadPessoa.perfil.value == ""){
        Swal.fire({
 		    icon: 'error',
  			title: 'Oops...',
  			text: 'Obrigatorio Selecionar o Perfil!',
		 })
         document.frmCadPessoa.perfil.focus();
         return false;
     }
if(document.frmCadPessoa.programas.value == ""){
        Swal.fire({
 		    icon: 'error',
  			title: 'Oops...',
  			text: 'Obrigatorio Selecionar o programa!',
		 })
         document.frmCadPessoa.programas.focus();
         return false;
     }
else{
    document.frmCadPessoa.action = "manu_CadPessoa.asp";
}

}

function verificar_cadastro()
{   
    document.frmCadPessoa.CpfVisualizar.value = document.frmCadPessoa.txtCPF.value;
	document.frmCadPessoa.action = "frm_CadPessoa.asp";
	document.frmCadPessoa.submit();
}
</script>
<body class="sb-nav-fixed">
    <form method=post name="frmCadPessoa" action="manu_CadPessoa.asp">
    <input type="hidden" name="CpfVisualizar" id="CpfVisualizar">
        <div id="layoutSidenav">
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <ul>&nbsp</ul>
                        <div class="card mb-4">
                        <h5 class="mt-4" style="margin-left:15px">Cadastro de Usuário</h5>
                            <div class="card-body">
                                <div class="form-group row">
                                    <div class="col-4">
                                        <label for="CPF" class="col-form-label col-form-label-sm" >CPF</label>
                                        <input type="text" class="form-control col-form-sm" onKeyPress="MascaraCPF(txtCPF)"  name="txtCPF" id="txtCPF"  value="<%=request("txtCPF")%>" maxlength="14" onblur="verificar_cadastro(this.value);" <%IF Existe = 1 THEN%> readonly <%END IF%>/>
                                    </div>
                                    <div class="col">
                                        <label for="txtNome" class="col-form-label col-form-label-sm" >Nome Completo</label>
                                        <input type="text" class="form-control col-form-sm" id="txtNome" name="txtNome" onKeyUp="maiuscula(this)" size="60"  value="<%=Nome%>"/>
                                    </div>
                                </div>
                                    <div class="form-group row g-3">
                                    <div class="col-3">
                                            
                                    <% 
                                    call abreConexao 
                                    sql="SELECT idPerfil, Perfil FROM GU_Perfil order by Perfil"
                                    set rs = conn.execute(sql) 
                                    %>
                                     <label for="perfil" class="col-form-label col-form-label-sm" >Perfil</label>
                                        <select name="perfil" id="perfil"  class="select2-single form-control col-form-label-sm" >
                                        <option value="">--- Selecionar ---</option>
                                        <%do while not rs.eof%>
                                        <option value="<%=rs("idPerfil")%>" <%if clng(rs("idPerfil")) = clng(idPerfil) then%>selected <% end if%>><%=rs("Perfil")%>
                                        </option>
                                    <% rs.movenext 
                                       loop 
                                    call fechaConexao
                                    %>
                                    </select>
                                        </div>
                                        
                                    <div class="col-3">
                                    <% 
                                    call abreConexao 
                                    sql = "SELECT * FROM GU_Programas WHERE status = 1 order by Sigla"
                                    set rs1 = conn.execute(sql) 
                                    %>
                                    <label for="programas" class="col-form-label col-form-label-sm" >Pastas</label>
                                    <select name="programas" id="programas" class="select2-single form-control col-form-label-sm" >
                                        <option value="">--- Selecionar ---</option>
                                           <%do while not rs1.eof%>
                                        <option value="<%=rs1("id")%>" <%if rs1("id") = CodPrograma then%>selected <%end if%>><%=rs1("Sigla")&"-"&rs1("Programas")%>
                                        </option>
                                    <% rs1.movenext 
                                                loop 
                                    call fechaConexao
                                    %>
                                    </select>   
                                            </div>
                                            <div class="col-3">
                                            <%IF EXISTE = 1 THEN%>
                                    <label for="status" class="col-form-label col-form-label-sm" >Status</label>
                                    <select name="status" id="status" class="select2-single form-control col-form-label-sm">
                                    <option value="1" <%if StatusUsuario = true then%> selected <%end if%>> Ativo </option>
                                    <option value="0" <%if StatusUsuario = false then%> selected <%end if%>> Inativo </option>
                                    </select>
                                    <%END IF%>
                                    <input type="text" name="cpf" id="cpf" value="04426330173" hidden/>
                                            </div>
                                            </div>
                                    <div class="form-group">
                                    <div class="col-3">
                                    <button type="submit" name="Botao" class="btn btn-outline-dark btn-icon-split" style="margin: 15px 0 0 0" onClick="return validar();" value="<%=bot%>"><%=bot%></button>
                                            </div>
                                            </div>
	                            <input type="hidden" name="hfcod" value="<%=cod%>">
                            </div>
                        </div>
                    </div>
                </main>
            </div>
        </div>
    </form>
</body>
