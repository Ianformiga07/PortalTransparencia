<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="base.asp"-->
<%
call abreConexao
  sql = "SELECT * FROM cam_servidores inner join cam_cargos on cam_cargos.id_cargo = cam_servidores.id_Cargo inner join cam_departamento on cam_departamento.id_Departamento = cam_servidores.id_Departamento where statusServidor = 1"
  set rs_admin = conn.execute(sql)

%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Servidores
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Servidores</span>
      </ol>
  </section>

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
                Não há administradores cadastrados na base de dados.
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
                  <td><%if rs_admin("statusServidor") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                  <td>
                  <a href="edit-patrimonio.asp?id=2024001" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
            <% rs_admin.movenext 
              loop 
              %>  
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

<!--#include file="footer.asp"-->