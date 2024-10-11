<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="base.asp"-->
<%
call abreConexao
sql = "SELECT * FROM cam_servidores INNER JOIN cam_cargos ON cam_cargos.id_cargo = cam_servidores.id_Cargo INNER JOIN cam_departamento ON cam_departamento.id_Departamento = cam_servidores.id_Departamento WHERE statusServidor = 1"
set rs_admin = conn.execute(sql)
%>


<script>
function Ver_alterar(CPF)
{

    var form = document.forms["AltServidor"];
    form.CPF.value = CPF;
    form.Operacao.value = 1;
    form.action = "cad-servidores.asp";
    form.submit();
    
}
</script>

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!-- Content Header -->
  <section class="content-header bg-white p-bottom-5">
    <h1 class="font-w-300">
      <i class="fa fa-edit text-blue"></i> Servidores
    </h1>
    <ol class="breadcrumb font-s-1">
      <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
      <span class="font-w-600">Servidores</span>
    </ol>
  </section>
  <form method="POST" id="AltServidor">
      <input type="hidden" name="BotaoVoltar">
      <input type="hidden" name="CPF" id="CPF">
      <input type="hidden" name="Operacao" id="Operacao">
  </form>
  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <div class="box-footer">
            <a href="cad-servidores.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Cadastro</a>
          </div>

          <!-- /.box-header -->
          <div class="box-body">
            <table id="example1" class="table table-bordered table-striped">
              <%if rs_admin.eof then%>
                <div class="alert alert-danger alert-dismissible">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                  Não há servidores cadastrados na base de dados.
                </div>
              <%Else%>
              <thead>
                <tr>
                  <th>Matrícula</th>
                  <th>CPF</th>
                  <th>Nome</th>
                  <th>Cargo</th>
                  <th>Departamento</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
              </thead>
              <tbody>
                <%do while not rs_admin.eof %>
                <tr>
                  <td><%=rs_admin("Matricula")%></td>
                  <td><%=rs_admin("CPF")%></td>
                  <td><%=rs_admin("NomeCompleto")%></td>
                  <td><%=rs_admin("desc_Cargo")%></td>
                  <td><%=rs_admin("desc_Departamento")%></td>
                  <td>
                    <%if rs_admin("statusServidor") = true then%>
                      <span class="label center bg-green">Ativo</span>
                    <%else%>
                      <span class="label center bg-red">Inativo</span>
                    <%end if%>
                  </td>
                  <td>
                    <a href="#" onClick="Ver_alterar('<%=rs_admin("CPF")%>');" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                    <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
                <% rs_admin.movenext 
                loop %>  
              </tbody>
              <%end if%>
              <%call fechaConexao%>
            </table>
          </div>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
</div>

<!-- Campo hidden para o valor de Resp -->
<input type="hidden" id="hiddenResp" value="<%= Request("Resp") %>">

<!-- SweetAlert e script para limpar URL -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
  window.onload = function() {
    var resp = document.getElementById('hiddenResp').value;

    if (resp == "1") {
      Swal.fire({
        icon: 'success',
        title: 'Cadastro realizado com sucesso!',
        showConfirmButton: false,
        timer: 3000, // Aumentei o tempo para 5 segundos
        position: 'top-end',
        toast: false, // Desativei o toast para ter um alerta central maior
        width: '30rem' // Aumentei a largura do alerta
      });
    } else if (resp == "2") {
      Swal.fire({
        icon: 'success',
        title: 'Alteração realizada com sucesso!',
        showConfirmButton: false,
        timer: 3000, // Aumentei o tempo para 5 segundos
        position: 'top-end',
        toast: false, // Desativei o toast para ter um alerta central maior
        width: '30rem' // Aumentei a largura do alerta
      });
    }

    // Limpar a URL removendo o parâmetro 'Resp'
    if (resp) {
      const url = new URL(window.location);
      url.searchParams.delete('Resp');
      window.history.replaceState(null, null, url);
    }
  };
</script>