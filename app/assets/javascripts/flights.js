$(document).on("ready page:load", ready);

function ready() {
  $('#new_flight').on('ajax:success', newFlight);

  function newFlight(event, data) {
    $('#flights').append(data);
    $('#flight_name').val('');
  }
}
