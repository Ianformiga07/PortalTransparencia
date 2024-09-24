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
          <li><a href="index.html">Inicio</a></li>
          <li class="current">Decretos</li>
        </ol>
      </nav>
      <h1>Decretos</h1>
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
          <label for="search-category">Autor:</label>
          <select id="search-category" class="search-category">
            <option value="">Selecione...</option>
            <option value="categoria1">Categoria 1</option>
            <option value="categoria2">Categoria 2</option>
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
              <th>#</th>
              <th>Categoria</th>
              <th>Número</th>
              <th>Descrição</th>
              <th>Data</th>
              <th>Ações</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td>1</td>
              <td>Mark</td>
              <td>06/2024</td>
              <td class="description">Autoriza o Executivo Municipal a instalar semáforos de trânsito em cruzamentos e placas de identificação de órgãos públicos, no âmbito do município de Ananás e dá outras providências.</td>
              <td>06/12/1997</td>
              <td>
                <a href="#" class="btn-visualizar" title="Visualizar Documento" title="Visualizar Documento" data-toggle="modal" data-target="#decretos">
                  <i class="fas fa-eye fa-1x"></i>
                </a>
                <a href="#" class="btn-visualizar" title="Baixar Documento">
                  <i class="fas fa-download fa-1x"></i>
                </a>
              </td>
            </tr>
            <tr>
              <td>2</td>
              <td>Jacob</td>
              <td>Thornton</td>
              <td class="description">Autoriza o Executivo Municipal a instalar semáforos de trânsito em cruzamentos e placas de identificação de órgãos públicos, no âmbito do município de Ananás e dá outras providências.</td>
              <td>10/11/2024</td>
              <td>
                <a href="#" class="btn-visualizar" title="Visualizar Documento" title="Visualizar Documento" data-toggle="modal" data-target="#decretos">
                  <i class="fas fa-eye fa-1x"></i>
                </a>
                <a href="#" class="btn-visualizar" title="Baixar Documento">
                  <i class="fas fa-download fa-1x"></i>
                </a>
              </td>
            </tr>
            <tr>
              <td>3</td>
              <td>Larry</td>
              <td>the Bird</td>
              <td class="description">Autoriza o Executivo Municipal a instalar semáforos de trânsito em cruzamentos e placas de identificação de órgãos públicos, no âmbito do município de Ananás e dá outras providências.</td>
              <td>10/02/2023</td>
              <td>
                <a href="#" class="btn-visualizar" title="Visualizar Documento" data-toggle="modal" data-target="#decretos">
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
<div class="modal fade" id="decretos" tabindex="-1" role="dialog" aria-labelledby="decretosLabel" aria-hidden="true">
  <div class="modal-dialog custom-modal-dialog" role="document"> <!-- Classe personalizada adicionada aqui -->
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="decretosLabel">Decretos</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="document-card">
          <div class="document-header">
            <h2>Detalhes do Documento</h2>
          </div>
          <div class="document-details">
            <p><strong>Tipo de Documento:</strong> Ata de Sessão</p>
            <p><strong>Data:</strong> 19/08/2024</p>
            <p><strong>Número do Documento:</strong> 29/2024</p>
            <p><strong>Detalhes/Descrição:</strong> Ata da 29ª Sessão Ordinária da Câmara Municipal de Ananás, Estado do Tocantins.</p>
          </div>
          <div class="document-actions">
            <a href="caminho/do/arquivo/Projeto_de_Lei_16_2024.pdf" download class="download-button">
              <i class="fas fa-download"></i> Baixar Documento
            </a>
          </div>
        </div><!-- /Document Details Card -->
      </div>
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