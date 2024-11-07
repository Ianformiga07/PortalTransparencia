<!--#include file="base.asp"-->

<%
nomeVereador = Request.form("nomeVereador")
%>
<!-- Novo Vereador - Formulário Melhorado -->
<div class="content-wrapper">
  <section class="content-header bg-white p-bottom-5">
    <h1><i class="fa fa-fw fa-check-square-o text-blue"></i> Novo Vereador</h1>
    <ol class="breadcrumb">
      <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
      <li class="active">Novo Vereador</li>
    </ol>
  </section>

  <section class="content">
    <div class="row">
      <div class="col-md-3">
          <!-- Profile Image -->
          <div class="box box-primary">
            <div class="box-header with-border text-black-light">
                <div class="box-title">
                    Foto de Perfil
                </div>
            </div>
            <div class="box-body" >
                <img class="profile-user-img img-responsive preview-users-image" src="images/avatar.jpg" style="height: 200px; width: 200px;">
            </div>
            <div class="box-footer">
                <button type="button" class="btn-file btn btn-success pull-right" id="users-image"><span class="fa fa-camera"></span> Foto</button>
                <input type="file" class="users-image" name="users_imagem" style="display: none"/>
            </div>
          </div>
      </div>

      <div class="col-md-9">
        <form role="form">
          <!-- Dados Pessoais -->
          <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Dados Pessoais
                    </div>
                </div>
              <div class="row">
                <div class="col-md-6">
                  <label for="nomeCompleto">Nome Completo</label>
                  <input type="text" class="form-control" id="nomeCompleto" value="<%=nomeVereador%>" disabled>
                </div>
                <div class="col-md-6">
                  <label for="apelido">Apelido</label>
                  <input type="text" class="form-control" id="apelido" name="apelido">
                </div>
              </div>
              <div class="row" style="margin-top: 10px;">
                <div class="col-md-6">
                  <label for="arquivo">Logo Partido</label>
                  <input type="file" class="form-control" id="arquivo" name="arquivo" accept=".pdf">
                </div>
                <div class="col-md-6">
                  <label for="ocupacao">Ocupação</label>
                  <input type="text" class="form-control" id="ocupacao" name="ocupacao">
                </div>
              </div>
            </div>
          </div>

          <!-- Legislativo -->
          <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                    <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Legislativo
                    </div>
                </div>
              <div class="row">
                <div class="col-md-4">
                  <label for="mesaDiretora">Faz Parte da Mesa Diretora?</label>
                  <select class="form-control" id="mesaDiretora" name="mesaDiretora" onchange="toggleMesaDiretora(this.value)">
                    <option> -- Selecionar --</option>
                    <option value="sim">Sim</option>
                    <option value="nao">Não</option>
                  </select>
                </div>
            <div id="mostraMesaDiretora" style="display: none;">
              <%
              call abreConexao
              sql = "SELECT id_mandatosLeg, mandatos FROM cam_mandatosLeg"
              set rs_Mandato = conn.execute(sql)
              %>
                <div class="col-md-4">
                  <label for="anoLegMesa">Ano Legislativo</label>
                  <select class="form-control" id="anoLegMesa" name="anoLegMesa">
                    <option> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_Mandato.eof%>
                    <option <%if  rtrim(id_mandatosLeg) = rtrim(rs_Mandato("id_mandatosLeg")) then response.write("selected") end if%> value="<%=rs_Mandato("id_mandatosLeg")%>"><%=rs_Mandato("mandatos")%></option>
              <% rs_Mandato.movenext 
              loop 
              call fechaConexao
              %>
                  </select>
                </div>
              <%
              call abreConexao
              sql = "SELECT  id_funcoes, desc_funcoes FROM cam_funcoesLeg WHERE id_funcoes IN (1, 2, 3, 4)"
              set rs_Mandato = conn.execute(sql)
              %>
                <div class="col-md-4">
                  <label for="funcaoMesa">Função</label>
                  <select class="form-control" id="funcaoMesa" name="funcaoMesa">
                    <option> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_Mandato.eof%>
                    <option <%if  rtrim(id_funcoes) = rtrim(rs_Mandato("id_funcoes")) then response.write("selected") end if%> value="<%=rs_Mandato("id_funcoes")%>"><%=rs_Mandato("desc_funcoes")%></option>
              <% rs_Mandato.movenext 
              loop 
              call fechaConexao
              %>
                  </select>
                </div>
              </div>
            </div>

                    <!-- Comissões -->
            <div class="row" style="margin-top: 15px;">
            <div class="col-md-6">
                <label for="comissoes">Faz Parte de Comissões?</label>
                <select class="form-control" id="comissoes" name="comissoes" onchange="toggleComissoes(this.value)">
                <option value=""> -- Selecionar --</option>
                <option value="sim">Sim</option>
                <option value="nao">Não</option>
                </select>
            </div>

            <div class="col-md-6" id="anoLegDiv" style="display: none;">
              <%
              call abreConexao
              sql = "SELECT id_mandatosLeg, mandatos FROM cam_mandatosLeg"
              set rs_anoLegComissao = conn.execute(sql)
              %>
                <label for="AnoLegComissao">Ano Legislativo</label>
                <select class="form-control" id="AnoLegComissao" name="AnoLegComissao">
                <option value=""> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_anoLegComissao.eof%>
                    <option <%if  rtrim(id_mandatosLeg) = rtrim(rs_anoLegComissao("id_mandatosLeg")) then response.write("selected") end if%> value="<%=rs_anoLegComissao("id_mandatosLeg")%>"><%=rs_anoLegComissao("mandatos")%></option>
              <% rs_anoLegComissao.movenext 
              loop 
              call fechaConexao
              %>
                </select>
            </div>
            </div>

            <div class="row" id="mostraComissoes" style="display: none; margin-top: 10px;">
              <%
              call abreConexao
              sql = "SELECT id_tipoComissao, DescComissao FROM cam_tipoComissao"
              set rs_tipoComissao = conn.execute(sql)
              %>
            <div class="col-md-6">
                <label for="nomeComissao">Comissão</label>
                <select class="form-control" id="nomeComissao" name="nomeComissao" onchange="mostrarCamposComissao(this.value)">
                <option value=""> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_tipoComissao.eof%>
                    <option <%if  rtrim(id_tipoComissao) = rtrim(rs_tipoComissao("id_tipoComissao")) then response.write("selected") end if%> value="<%=rs_tipoComissao("id_tipoComissao")%>"><%=rs_tipoComissao("DescComissao")%></option>
              <% rs_tipoComissao.movenext 
              loop 
              call fechaConexao
              %>
                </select>
            </div>

              <%
              call abreConexao
              sql = "SELECT  id_funcoes, desc_funcoes FROM cam_funcoesLeg WHERE id_funcoes IN (1, 5, 6)"
              set rs_Mandato = conn.execute(sql)
              %>
                <div class="col-md-6">
                  <label for="funcaoComissao">Função</label>
                  <select class="form-control" id="funcaoComissao" name="funcaoComissao">
                    <option> -- Selecionar --</option>
                    <option disabled></option>
              <%do while not rs_Mandato.eof%>
                    <option <%if  rtrim(id_funcoes) = rtrim(rs_Mandato("id_funcoes")) then response.write("selected") end if%> value="<%=rs_Mandato("id_funcoes")%>"><%=rs_Mandato("desc_funcoes")%></option>
              <% rs_Mandato.movenext 
              loop 
              call fechaConexao
              %>
                </select>
            </div>

            <div class="col-md-2">
                <button type="button" class="btn btn-success" style="margin-top: 25px;" onclick="adicionarComissao()">Adicionar</button>
            </div>
            </div>

            <div class="form-group" style="margin-top: 10px;">
            <h4>Comissões Selecionadas</h4>
            <ul id="listaComissoes"></ul>
            </div>

            <!-- Mandatos Anteriores -->
            <div class="box box-primary">
            <div class="box-body">
                <div class="box-header text-blue" style="border: none; padding: 0;">
                <div class="box-title text-blue" style="font-size: 1.25em; margin-bottom: 10px; margin-left: 0;">
                    <i class="fa fa-caret-right"></i> Mandatos Anteriores
                </div>
                </div>            

                <div class="row">
                <!-- Select Já Teve Mandatos Anteriores -->
                <div class="col-md-5">
                    <label for="mandatosAnteriores">Já Teve Mandatos Anteriores?</label>
                    <select class="form-control" id="mandatosAnteriores" name="mandatosAnteriores" onchange="toggleMandatosAnteriores(this.value)">
                    <option> -- Selecionar --</option>
                    <option value="sim">Sim</option>
                    <option value="nao">Não</option>
                    </select>
                </div>

                <!-- Input e botão na mesma linha, com espaço entre eles -->
                <div class="col-md-6" id="mostraMandatosAnteriores" style="display: none;">
                    <div class="col-md-5">
                      <label for="AnoInicioMandato">Ano Início</label>
                      <input type="text" class="form-control" id="AnoInicioMandato" name="AnoInicioMandato">
                    </div>
                    <div class="col-md-5">
                      <label for="AnoFimMandato">Ano Fim</label>
                      <input type="text" class="form-control" id="AnoFimMandato" name="AnoFimMandato">
                    </div>
                    <div class="col-md-2">
                      <button type="button" class="btn btn-success" style="margin-top: 25px;" onclick="adicionarMandato()">Adicionar</button>
                    </div>
                    </div>
                </div>
                </div>

                <div class="form-group" style="margin-top: 10px;">
                <h4>Mandatos Anteriores</h4>
                <ul id="listaMandatos"></ul>
                </div>
            </div>
            </div>
          <!-- Botão Salvar -->
        <div class="box-footer">
            <a href="#" class="btn btn-primary "><i class="fa fa-reply"></i> Voltar</a>
            <button type="submit" class="form-btn btn btn-primary pull-right"><i class="fa fa-fw fa-check"></i> Cadastrar</button>
        </div>
        </form>
      </div>
    </div>
  </section>
</div>

<script>
// Funções JavaScript para alternar exibição de seções e adicionar itens

function toggleMesaDiretora(value) {
    if (value === "sim") {
        document.getElementById("mostraMesaDiretora").style.display = "block";
    } else {
        document.getElementById("mostraMesaDiretora").style.display = "none";
    }
}

  function toggleComissoes(value) {
    const anoLegDiv = document.getElementById("anoLegDiv");
    const mostraComissoes = document.getElementById("mostraComissoes");

    if (value === "sim") {
      anoLegDiv.style.display = "block"; // Exibe o campo Ano Legislativo
      mostraComissoes.style.display = "block"; // Exibe os outros campos
    } else {
      anoLegDiv.style.display = "none"; // Oculta o campo Ano Legislativo
      mostraComissoes.style.display = "none"; // Oculta os outros campos
      resetCampos(); // Reseta os valores dos campos
    }
  }

  function resetCampos() {
    document.getElementById("AnoLegComissao").selectedIndex = 0;
    document.getElementById("nomeComissao").selectedIndex = 0;
    document.getElementById("funcaoComissao").selectedIndex = 0;
  }

  function adicionarComissao() {
    const nomeComissao = document.getElementById("nomeComissao").value;
    const funcaoComissao = document.getElementById("funcaoComissao").value;

    if (nomeComissao && funcaoComissao) {
      const listaComissoes = document.getElementById("listaComissoes");
      const li = document.createElement("li");
      li.textContent = `${nomeComissao} - ${funcaoComissao}`;
      listaComissoes.appendChild(li);
    }
  }

function toggleMandatosAnteriores(value) {
    if (value === "sim") {
        document.getElementById("mostraMandatosAnteriores").style.display = "block";
    } else {
        document.getElementById("mostraMandatosAnteriores").style.display = "none";
    }
}

function adicionarMandato() {
    const anoInicioMandato = document.getElementById("AnoInicioMandato").value;
    const anoFimMandato = document.getElementById("AnoFimMandato").value;

    if (anoInicioMandato && anoFimMandato) {
        const listaMandatos = document.getElementById("listaMandatos");
        const li = document.createElement("li");
        li.textContent = `Mandato: ${anoInicioMandato} - ${anoFimMandato}`;
        listaMandatos.appendChild(li);

        // Limpar campos após adicionar
        document.getElementById("AnoInicioMandato").value = '';
        document.getElementById("AnoFimMandato").value = '';
    } else {
        alert("Por favor, preencha ambos os campos de Ano Início e Ano Fim.");
    }
}
</script>
<!--#include file="footer.asp"-->