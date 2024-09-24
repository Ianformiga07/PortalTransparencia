<!--#include file="base.asp"-->
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar Diário Oficial
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">Diário Oficial</a></li> /
          <span class="font-w-600">Cadastrar</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <div class="box-header with-border font-s-1-2"><b class="font-s-0-875">Licitação</b> » PREGÃO ELETRÔNICO Nº 001/2024</div>
          <form role="form" action="cadastrar_diario_oficial.asp" method="post" enctype="multipart/form-data">
            <div class="box-body">
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-6">
                            <label for="for_posts_annex_title">
                                Título
                                <span class="text-red">*</span>
                                <span class="limit-char limit_posts_annex_title"></span>
                            </label>
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Digite o título" required>
                        </div>
                        <div class="col-md-6">
                            <label for="arquivo">Arquivo PDF</label>
                            <input type="file" class="form-control" id="arquivo" name="arquivo" accept=".pdf" required>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
              <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
              <button type="submit" class="btn btn-primary pull-right"><i class="fa fa-check"></i> Cadastrar</button>
            </div>
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Titulo</th>
                  <th>Arquivo</th>
                  <th>Data</th>
                  <th>Ação</th>
                </tr>
                </thead>
                <tbody>
                <tr>
                  <td>Trident</td>
                  <td>Internet
                    Explorer 4.0
                  </td>
                  <td>Win 95+</td>
                  <td>
                    <button data-toggle="modal" data-target=".modal-delete" mdl-name="users" mdl-page="all" type-action="Delete" class="btn-delete-confirm btn btn-danger btn-xs" id="delete_row_183"><i class="fa fa-trash"></i></button>
                  </td>
                </tr>
                </tbody>
              </table>
            </div>
          </form>
        </div>
        <!-- /.box -->
      </div>
      <!-- /.col -->
    </div>
    <!-- /.row -->
  </section>
  <!-- /.content -->
</div>
<!--#include file="footer.asp"-->