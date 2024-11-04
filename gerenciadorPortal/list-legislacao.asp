  <!--#include file="base.asp"-->
  <%
call abreConexao

' Excluir registro se o ID for passado e a ação for exclusão
If Request.Form("acao") = "excluir" And Not IsEmpty(Request.Form("id_diario")) Then
    Dim id_diario
    id_diario = Request.Form("id_diario")
    sql = "DELETE FROM cam_diarioOfi WHERE id_diario = " & id_diario
    conn.Execute(sql)
    response.Redirect "list-diario.asp?Resp=3"
End If

sql = "SELECT id_legislacao, id_categoriaLeg, descricao, anexo_legislacao, id_AutorVer, status_Leg, dataCad FROM cam_legislacao"
set rs_leg = conn.execute(sql)
%>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-edit text-blue"></i> Legislacao
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="dashboard.php?control=home/all"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <span class="font-w-600">Legislacao</span>
      </ol>
  </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
              <div class="box-footer">
                <a href="cad-legislacao.asp" class="btn btn-success pull-right"><i class="fa fa-plus"></i> Novo Documento</a>
              </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
              <%if rs_leg.eof then%>
                  <div class="alert alert-danger alert-dismissible" style="background-color: rgba(220, 53, 69, 0.1);">
                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                      <h4><i class="icon fa fa-ban"></i> Nenhum Registro Encontrado!</h4>
                      Não há diários cadastrados na base de dados.
                  </div>
              <%Else%>   
                <thead>
                <tr>
                  <th>Categoria</th>
                  <th>Numero Documento</th>
                  <th>Descrição</th>
                  <th>Data</th>
                  <th>Status</th>
                  <th>Ações</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td><%=rs_leg("")%></td>
                  <td><%=rs_leg("")%></td>
                  <td><%=rs_leg("")%></td>
                  <td><%=rs_leg("")%></td>
                  <td><%if rs_leg("status_diario") = true then%><span class="label center bg-green">Ativo</span><%else%><span class="label center bg-red">Inativo</span><%end if%></td>
                  <td>
                  <a href="dashboard.php?control=users/create&amp;id=183" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a>
                  <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
                </tbody>
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