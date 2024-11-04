<!--#include file="base.asp"-->

<script>
  function cadastrar() {

      var form = document.forms["frmCadLeg"];
      form.Operacao.value = "2";
      form.enctype = "multipart/form-data";
      form.action = "crud-legislacao.asp";
      form.submit();
  }
</script>
<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
  <!--- Content Header--->
  <section class="content-header bg-white p-bottom-5">
      <h1 class="font-w-300">
          <i class="fa fa-fw fa-check-square-o text-blue"></i> Cadastrar Legislação
      </h1>
      <ol class="breadcrumb font-s-1">
          <li><a href="index.asp"><i class="fa fa-dashboard"></i> Painel</a></li> / 
          <li><a href="diario-oficial.asp">Legislação</a></li> /
          <span class="font-w-600">Cadastrar</span>
      </ol>
  </section>

  <!-- Main content -->
  <section class="content">
    <div class="row">
      <div class="col-xs-12">
        <div class="box box-primary">
          <!-- /.box-header -->
          <!-- form start -->
          <form role="form" name="frmCadLeg" method="post">
              <input type="hidden" name="Operacao" id="Operacao">
              <input type="hidden" name="id_legislacao" id="id_legislacao" value="<%=id_legislacao%>">
            <div class="box-body">
                <div class="form-group">
                    <%
                    call abreConexao 
                    sql = "SELECT * FROM cam_categoriaLeg ORDER BY id_categoriaLeg"
                    set rs_catLeg = conn.execute(sql) 
                    %> 
                    <div class="row">
                        <div class="col-md-6">
                            <label for="CatLegislacao">Categoria</label>
                            <select class="form-control" id="CatLegislacao" name="CatLegislacao" required>
                                <option value="">-- Selecionar --</option>
                                <option value=""></option>
                            <%do while not rs_catLeg.eof%>
                                <option <%if  rtrim(departamento) = rtrim(rs_catLeg("id_categoriaLeg")) then response.write("selected") end if%> value="<%=rs_catLeg("id_categoriaLeg")%>"><%=rs_catLeg("descricao")%></option>
                            <% rs_catLeg.movenext 
                            loop 
                            call fechaConexao
                            %>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="arquivoLeg">Arquivo PDF</label>
                            <input type="file" class="form-control" id="arquivoLeg" name="arquivoLeg" accept=".pdf" required>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                        <div class="col-md-12">
                            <label for="descricao">Descricao</label>
                            <input type="text" class="form-control" id="descricao" name="descricao" placeholder="Digite o título" required>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="row">
                    <%
                    call abreConexao 
                    sql = "SELECT  id_servidor, CPF, NomeCompleto, id_Cargo FROM cam_servidores WHERE  (id_Cargo = 15)"
                    set rs_verAutor = conn.execute(sql) 
                    %> 
                        <div class="col-md-6">
                            <label for="verAutor">Autor</label>
                            <select class="form-control" id="verAutor" name="verAutor" required>
                                <option value="">-- Selecionar --</option>
                                <option value=""></option>
                            <%do while not rs_verAutor.eof%>
                                <option <%if  rtrim(departamento) = rtrim(rs_verAutor("id_servidor")) then response.write("selected") end if%> value="<%=rs_verAutor("id_servidor")%>"><%=rs_verAutor("NomeCompleto")%></option>
                            <% rs_verAutor.movenext 
                            loop 
                            call fechaConexao
                            %>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label for="statusLeg">Status</label>
                            <select class="form-control" id="statusLeg" name="statusLeg" required>
                                <option disabled=""></option>
                                <option value="true" <% If statusLeg = true Then %> selected <% End If %>>Sim</option>
                                <option value="false" <% If statusLeg = false Then %> selected <% End If %>>Não</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
            <!-- /.box-body -->

            <div class="box-footer">
                <a href="javascript:history.back()" class="btn btn-primary"><i class="fa fa-reply"></i> Voltar</a>
                <button type="submit" class="btn btn-primary pull-right" onClick="return cadastrar()"><i class="fa fa-check"></i> Cadastrar</button>
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