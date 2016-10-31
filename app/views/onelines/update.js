console.log("HELLO EVERYONE!!")
$('#edit_oneline_<%= oneline.id %>').remove();
$('.contents_<%= oneline.id %>').text( '<%= j oneline.contents %>')
$('.contents_<%= oneline.id %>').show();
