<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css" rel="stylesheet">
<link href="https://cdn.datatables.net/2.1.5/css/dataTables.bootstrap4.css" rel="stylesheet">
<!--#include file="base.asp"-->

<main class="main">

  <!-- Page Title -->
  <div class="page-title" data-aos="fade">
    <div class="container">
      <nav class="breadcrumbs">
        <ol>
          <li><a href="index.asp">Inicio</a></li>
          <li class="current">Contratos</li>
        </ol>
      </nav>
      <h1>Contratos</h1>
    <!-- Ícone de Voltar -->
    <a href="transparencia.asp" class="icon-voltar">
      <i class="fa fa-reply-all"></i> Voltar
    </a>
    </div>
  </div><!-- End Page Title -->

  <!-- Search and Table Section -->
  <section id="search-table" class="search-table section">
    <div class="container">

      <!-- Search Section -->
      <div class="search-wrapper">
        <div class="search-field">
          <label for="search-input">Buscar por Descrição:</label>
          <input type="text" id="search-input" class="search-input" placeholder="Digite para buscar...">
        </div>
        <div class="search-field">
          <label for="search-date">Data:</label>
          <input type="date" id="search-date" class="search-date">
        </div>
        <div class="search-field">
          <label for="search-category">Tipo de Contrato:</label>
          <select id="search-category" class="search-category">
            <option value="">Selecione...</option>
            <option value="categoria1">Adtivo</option>
            <option value="categoria2">Ata de Registro de Preço</option>
            <option value="categoria2">Contrato</option>
            <option value="categoria2">Credenciamento</option>
            <option value="categoria2">Dispensa</option>
            <option value="categoria2">Distrato</option>
            <option value="categoria2">por Licitação</option>
          </select>
        </div>
        <button class="search-button"><i class="fas fa-search"></i> Buscar</button>
      </div><!-- /Search Section -->

      <!-- Linha de Separação -->
      <hr class="separator">

      <!-- Team Section -->
      <div class="team">
        <table id="example" class="table table-striped table-bordered" style="width:100%">
          <thead>
            <tr>
              <th>N° Instrumento</th>
              <th>N° Contrato</th>
              <th>Objeto</th>
              <th>Fornecedor</th>
              <th>CNPJ</th>
              <th>Data</th>
              <th>Ações</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><P class="diario-content">004/2024</p></td>
              <td><P class="diario-content">017/2024</p></td>
              <td><P class="diario-content">Contratação de empresa para prestação de serviços de hospedagem da rom page do site da Câmara Municipal de Carolina e portal da transparência, em conformidade com Termo de Referência</p></td>
              <td><P class="diario-content">APPMAKE SOLUÇÕES TECNOLÓGICAS LTDA-ME</p></td>
              <td><P class="diario-content">18669921000107</p></td>
              <td><P class="diario-content">06/12/1997</p></td>
              <td>
                <a href="detalhe-contrato.asp" class="btn-visualizar" title="Visualizar Documento" data-toggle="modal" data-target="#contrato">
                  <i class="fas fa-eye fa-1x"></i>
                </a>
                <a href="#" class="btn-visualizar" title="Baixar Documento">
                  <i class="fas fa-download fa-1x"></i>
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </div><!-- /Team Section -->

    </div>
  </section><!-- /Search and Table Section -->

<!-- Modal for Denúncia -->
<div class="modal fade" id="contrato" tabindex="-1" role="dialog" aria-labelledby="contratoLabel" aria-hidden="true">
  <div class="modal-dialog custom-modal-dialog" role="document"> <!-- Classe personalizada adicionada aqui -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="contratoLabel">Contrato</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!-- Tab Content -->
      <div class="tab-content" id="pregaoTabContent">
        <!-- Detalhes da Licitação -->
        <div class="tab-pane fade show active" id="details" role="tabpanel" aria-labelledby="details-tab">
          <!-- Pregão Details Card -->
          <div class="pregao-card">
            <!-- Pregão Header -->
            <div class="pregao-header">
              <h2>Detalhes do Contrato 001/2024</h2>
            </div>

            <!-- Pregão Information -->
            <div class="pregao-info">
              <!-- Column 1 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Número do Contrato:</strong> 001/2024</p>
                <p><strong class="title-black">Tipo de Contrato:</strong> Ata de Registro de Preços</p>
                <p><strong class="title-black">Valor Estimado:</strong> R$ 17.705,00</p>
                <p><strong class="title-black">Início de Vigência:</strong> 17/04/2024</p>
                <p><strong class="title-black">Fim de Vigência:</strong> 17/04/2025</p>
                <p><strong class="title-black">Fornecedor:</strong> NORRIS INFORCELL</p>
              </div>
              <!-- Column 2 -->
              <div class="pregao-coluna">
                <p><strong class="title-black">Fiscal de Contrato:</strong> DEBORA CARVALHO DE ALMEIDA</p>
                <p><strong class="title-black">Unidade Gestora:</strong> Câmara Municipal de Ananás</p>
              </div>
            </div>

            <!-- Pregão Object -->
            <div class="pregao-object">
              <h3 class="title-green">Detalhes/Descrição</h3>
              <p>CONTRATAÇÃO DE PESSOA JURÍDICA PARA EVENTUAL E FUTURA PRESTAÇÃO DE SERVIÇOS TÉCNICOS DE INFORMÁTICA COM FORNECIMENTO DE PEÇAS DESTINADOS A ATENDER A DEMANDA DA CÂMARA MUNICIPAL DE ANANÁS/TO.</p>
            </div>

            <!-- Documentos Section -->
            <div class="pregao-documents">
              <h3 class="title-green">Documentos</h3>
              <ul class="documents-list">
                <li>
                  <i class="fas fa-file-pdf"></i>
                  <span><strong class="title-black">Requerimento:</strong> Requerimento-REQUERIMENTO Nº 010-2022.pdf</span>
                  <a href="caminho/do/arquivo/Requerimento_Nº_010-2022.pdf" download class="document-download">
                    <i class="fas fa-download"></i> Baixar
                  </a>
                </li>
              </ul>
            </div><!-- /Documentos Section -->
          </div><!-- /Pregão Details Card -->
        </div><!-- /Tab Pane -->
    </div>
  </div>
</div>
  <script src="https://code.jquery.com/jquery-3.7.1.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <script src="https://cdn.datatables.net/2.1.5/js/dataTables.js"></script>
  <script src="https://cdn.datatables.net/2.1.5/js/dataTables.bootstrap4.js"></script>

  <script>
  $(document).ready(function(){
      $('#example').DataTable({
        	"language": {
                "lengthMenu": "Mostrando _MENU_ registros por página",
                "zeroRecords": "Nada encontrado",
                "info": "Mostrando página _PAGE_ de _PAGES_",
                "infoEmpty": "Nenhum registro disponível",
                "infoFiltered": "(filtrado de _MAX_ registros no total)"
            }
        });
  });
  </script>
</main>

<!--#include file="footer.asp"-->