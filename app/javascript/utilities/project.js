$(document).on('turbolinks:load', function(){
  $('.project').on('click', '.edit-project-link', function(e) {
    e.preventDefault();
    $(this).hide();
    let projectId = $(this).data('projectId');
    console.log(projectId);
    $('form#edit-project-' + projectId).removeClass('hidden');
  })
});
