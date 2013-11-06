$('[href="'+location.pathname+location.search+'"]').parent().addClass 'active';
$($('[href="'+location.pathname+location.search+'"]').attr('data-parent')).addClass 'active';
