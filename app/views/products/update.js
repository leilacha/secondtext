<% if @errors.present? %>
  $('#error-pannel').html("<div class='notification is-danger'><button class='delete'></button><%= @errors%></div>");
  $('#error-pannel').show();
  $('.delete').click(function(){
      $('#error-pannel').hide();
  });
<% end %>
