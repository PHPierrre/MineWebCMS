<section class="content">
  <div class="row">
    <div class="col-md-12">
      <div class="box">
        <div class="box-header with-border">
          <h3 class="box-title"><?= $Lang->get('ADD_SLIDER') ?></h3>
        </div>
        <div class="box-body">
          <form action="<?= $this->Html->url(array('controller' => 'slider', 'action' => 'add_ajax')) ?>" method="post">
            <input type="hidden" id="form_infos" data-ajax="true" data-upload-image="true" data-redirect-url="<?= $this->Html->url(array('controller' => 'slider', 'action' => 'index', 'admin' => 'true')) ?>">

            <div class="ajax-msg"></div>

            <div class="col-md-4">
              <?= $this->element('form.input.upload.img') ?>
            </div>

            <div class="col-md-8">

              <div class="form-group">
                <label><?= $Lang->get('TITLE') ?></label>
                <input name="title" class="form-control" type="text">
              </div>

              <div class="form-group">
                <label><?= $Lang->get('SUBTITLE') ?></label>
                <input name="subtitle" class="form-control" type="text">
              </div>

              <div class="pull-right">
                <a href="<?= $this->Html->url(array('controller' => 'user', 'action' => 'index', 'admin' => true)) ?>" class="btn btn-default"><?= $Lang->get('CANCEL') ?></a>
                <button class="btn btn-primary" type="submit"><?= $Lang->get('SUBMIT') ?></button>
              </div>

            </div>
          </form>


          <script type="text/javascript">/*
          $(function () {
  $('#my_form').on('submit', function (e) {
      // On empêche le navigateur de soumettre le formulaire
      e.preventDefault();

      var $form = $(this);
      var formdata = (window.FormData) ? new FormData($form[0]) : null;
      var data = (formdata !== null) ? formdata : $form.serialize();

      $.ajax({
          url: $form.attr('action'),
          type: $form.attr('method'),
          contentType: false, // obligatoire pour de l'upload
          processData: false, // obligatoire pour de l'upload
          dataType: 'json', // selon le retour attendu
          data: data,
          success: function (response) {
              // La réponse du serveur
          }
      });
  });*/
</script>



        </div>
      </div>
    </div>
  </div>
</section>
